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
using TeaShop.models;

namespace TeaShop.pages
{
    /// <summary>
    /// Логика взаимодействия для user_catalog.xaml
    /// </summary>
    public partial class user_catalog : Page
    {
        int _itemcount = 0;

        public user_catalog()
        {
            InitializeComponent();
            ListoxViewStay.ItemsSource = TeaShopEntities.GetContext().providers.OrderBy(p => p.name).ToList();
            var directions = TeaShopEntities.GetContext().types.OrderBy(p => p.category).ToList();
            directions.Insert(0, new type
            {
                category = "Все категории "
            }
            );
            Cmbnapravlenie.ItemsSource = directions;
            Cmbnapravlenie.SelectedIndex = 0;
            //вывод данных из БД в ListBox
            ListoxViewStay.ItemsSource = TeaShopEntities.GetContext().teas.OrderBy(p => p.name).ToList();
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

        private void Update()
        {
            var currentspecialization = TeaShopEntities.GetContext().teas.OrderBy(p => p.name).ToList();
            if (Cmbnapravlenie.SelectedIndex > 0)
                //выбор только тех товаров, которые принадлежат данному поставщику
                currentspecialization = currentspecialization.Where(p => p.type_ID ==
                (Cmbnapravlenie.SelectedItem as type).type_ID).ToList();
            // выбор тех товаров, в названии которых есть поисковая строка
            currentspecialization = currentspecialization.Where(p =>
            p.name.ToLower().Contains(TBoxSerach.Text.ToLower())).ToList();
            // сортировка
            if (CmbSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (CmbSort.SelectedIndex == 0)
                    currentspecialization = currentspecialization.OrderBy(p => p.price).ToList();
                // сортировка по убыванию цены
                if (CmbSort.SelectedIndex == 1)
                    currentspecialization = currentspecialization.OrderByDescending(p => p.price).ToList();
            }
            // В качестве источника данных присваиваем список данных
            ListoxViewStay.ItemsSource = currentspecialization;
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
                TeaShopEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            ListoxViewStay.ItemsSource = TeaShopEntities.GetContext().teas.OrderBy(p => p.name).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new support_page());
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new catalog());
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new employee_page());
        }
    }
}

