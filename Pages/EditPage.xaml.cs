using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ModFirm.Models;
using ModFirm.Pages;
using System.IO;
using Microsoft.Win32;

namespace ModFirm.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditPage.xaml
    /// </summary>
    public partial class EditPage : Page
    {
        private Product _currentGood = new Product();
        public Product Employee { get; set; }
        private string _filePath = null;
        private string _photoName = Directory.GetCurrentDirectory() + @"\Images\Default.jpg";
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";
        public EditPage(Product selectedProduct)
        {
            InitializeComponent();
            CmbPost.DisplayMemberPath = "Categoty_name";
            CmbPost.SelectedItem = selectedProduct.Category;

            CmbCat.DisplayMemberPath = "Purpose_name";
            CmbCat.SelectedItem = selectedProduct.Purpose;

            if (selectedProduct != null)
            {
                _currentGood = selectedProduct;
                TextBoxId.Visibility = Visibility.Hidden;
                TextBlockId.Visibility = Visibility.Hidden;
                int x = selectedProduct.Product_ID;
                List<Employee> agents = new List<Employee>();
                _filePath = _currentDirectory + _currentGood.Image;
            }
            DataContext = _currentGood;
            _photoName = _currentGood.Image.Trim() == "" ? _photoName : _currentGood.Image ;



            CmbPost.ItemsSource = ModelFirmEntities.GetContext().Categories.ToList();
            CmbCat.ItemsSource = ModelFirmEntities.GetContext().Purposes.ToList();
            Employee = selectedProduct;


        }

        private StringBuilder CheckFileds()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentGood.Product_name))
                s.AppendLine("Поле наименование пустое");
            if (string.IsNullOrWhiteSpace(_photoName))
                s.AppendLine("Фото не выбрано");
            return s;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {

            StringBuilder _error = CheckFileds();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            if (_currentGood.Product_ID == 0)
            {
                string photo = ChangePhotoName();
                string dest = _currentDirectory + photo;
                File.Copy(_filePath, dest);
                _currentGood.Image = photo;
                ModelFirmEntities.GetContext().Products.Add(_currentGood);

            }
            try
            {
                if (_filePath != null)
                {
                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentGood.Image = photo;
                }
                MessageBox.Show("Запись изменена");
                ModelFirmEntities.GetContext().SaveChanges();
                NavigationService.GoBack();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException.ToString());
            }
        }

        string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoname = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoname;
                }
                photoname = i.ToString() + photoname;
            }
            return photoname;
        }

        private void LoadImage_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files(*.gif) | *.gif";
                if (op.ShowDialog() == true)
                {
                    FileInfo fileInfo = new FileInfo(op.FileName);
                    if (fileInfo.Length > (1024 * 1024 * 2))
                    {
                        throw new Exception("Размер файла должен быть меньше 2Мб");
                    }
                    ImagePhoto.Source = new BitmapImage(new Uri(op.FileName));
                    _photoName = op.SafeFileName;
                    _filePath = op.FileName;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK,
                MessageBoxImage.Error);
                _filePath = null;
            }
        }

        private void CmbPost_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _currentGood.Category_ID = (CmbPost.SelectedItem as Category).Category_ID;
        }
        private void CmbCat_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if ((CmbPost.SelectedItem as Purpose) == null)
            {
                return;
            }
            _currentGood.Purpose_ID = (CmbPost.SelectedItem as Purpose).Purpose_ID;
        }

    }
}
