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
using Microsoft.Win32;
using TeaShop.models;
using System.IO;

namespace TeaShop.pages
{
    /// <summary>
    /// Логика взаимодействия для add_page.xaml
    /// </summary>
    public partial class add_page : Page
    {
        private tea _currentGood = new tea();
        private string _filePath = null;
        private string _photoName = null;
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";

        public add_page(tea selectedTea)

        {
            InitializeComponent();
            if (selectedTea != null)
            {
                _currentGood = selectedTea;
                TextBoxId.Visibility = Visibility.Hidden;
                TextBlockId.Visibility = Visibility.Hidden;
                int x = selectedTea.tea_ID;
                List<tea> agents = new List<tea>();
                _filePath = _currentDirectory + _currentGood.image;
            }
            DataContext = _currentGood;
            _photoName = _currentGood.image;
            CmbShifa.ItemsSource = TeaShopEntities.GetContext().types.ToList();
            CmbShisa.ItemsSource = TeaShopEntities.GetContext().providers.ToList();

        }

        private StringBuilder CheckFileds()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentGood.name))
                s.AppendLine("Поле наименование пустое");
            if (_currentGood.price < 0)
                s.AppendLine("Цена не может быть отрицательной");
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
            if (_currentGood.tea_ID == 0)
            {
                string photo = ChangePhotoName();
                string dest = _currentDirectory + photo;
                File.Copy(_filePath, dest);
                _currentGood.image = photo;
                TeaShopEntities.GetContext().teas.Add(_currentGood);

            }
            try
            {
                if (_filePath != null)
                {
                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentGood.image = photo;
                }
                MessageBox.Show("Запись изменена");
                TeaShopEntities.GetContext().SaveChanges();
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new pages.catalog());
        }

        private void CmbShifa_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _currentGood.type_ID = (CmbShifa.SelectedItem as type).type_ID;
        }

        private void CmbShisa_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _currentGood.provider_ID = (CmbShisa.SelectedItem as provider).provider_ID;
        }
    }
}
