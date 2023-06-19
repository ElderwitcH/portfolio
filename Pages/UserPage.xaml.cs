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
using ModFirm.Store;

namespace ModFirm.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        int _itemcount = 0;
        public UserPage()
        {
            InitializeComponent();
            var directions = ModelFirmEntities.GetContext().Categories.OrderBy(p => p.Categoty_name).ToList();
            directions.Insert(0, new Category
            {
                Categoty_name = "Все категории "
            }
            );
            var purposions = ModelFirmEntities.GetContext().Purposes.OrderBy(p => p.Purpose_name).ToList();
            purposions.Insert(0, new Purpose
            {
                Purpose_name = "Все типы "
            }
            );
            Cmbnapravlenie.ItemsSource = directions;
            Cmbnapravlenie.SelectedIndex = 0;
            CmbType.ItemsSource = purposions;
            CmbType.SelectedIndex = 0;
            //вывод данных из БД в ListBox
            ListoxViewStay.ItemsSource = ModelFirmEntities.GetContext().Products.OrderBy(p => p.Product_name).ToList();
            _itemcount = ListoxViewStay.Items.Count;


            //stayEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());

            //List<specialization> specializations = stayEntities.GetContext().specializations.OrderBy(p => p.name_specialization).ToList();
            //ListoxViewStay.ItemsSource = specializations;
        }

        private void TBoxSerach_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void Cmbnapravlenie_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
        private void CmbType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
        private void Update()
        {
            var currentspecialization = ModelFirmEntities.GetContext().Products.OrderBy(p => p.Product_name).ToList();
            if (Cmbnapravlenie.SelectedIndex > 0)
                //выбор только тех товаров, которые принадлежат данному поставщику
                currentspecialization = currentspecialization.Where(p => p.Category_ID ==
                (Cmbnapravlenie.SelectedItem as Category).Category_ID).ToList();

            if (CmbType.SelectedIndex > 0)
                //выбор только тех товаров, которые принадлежат данному поставщику
                currentspecialization = currentspecialization.Where(p => p.Purpose_ID ==
                (CmbType.SelectedItem as Purpose).Purpose_ID).ToList();
            // выбор тех товаров, в названии которых есть поисковая строка
            currentspecialization = currentspecialization.Where(p =>
            p.Product_name.ToLower().Contains(TBoxSerach.Text.ToLower())).ToList();
            // сортировка
            if (CmbSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (CmbSort.SelectedIndex == 0)
                    currentspecialization = currentspecialization.OrderBy(p => p.Price).ToList();
                // сортировка по убыванию цены
                if (CmbSort.SelectedIndex == 1)
                    currentspecialization = currentspecialization.OrderByDescending(p => p.Price).ToList();
            }
            // В качестве источника данных присваиваем список данных
            ListoxViewStay.ItemsSource = currentspecialization;
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
                ModelFirmEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            ListoxViewStay.ItemsSource = ModelFirmEntities.GetContext().Products.OrderBy(p => p.Product_name).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            if (Auth.User.Role_ID == 1)
            {
                NavigationService.Navigate(new Pages.ProductCard((sender as Button).DataContext as Product));
            }
            else if (Auth.User.Role_ID == 2)
            {
                NavigationService.Navigate(new EditPage((sender as Button).DataContext as Product));
            }
        }
    }
}

