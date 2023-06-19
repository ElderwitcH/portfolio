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
using System.IO;
using TeaShop.models;

namespace TeaShop.pages
{
    /// <summary>
    /// Логика взаимодействия для employee_page.xaml
    /// </summary>
public partial class employee_page : Page
    {
        public employee_page()
        {
            InitializeComponent();
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                DataShifa.ItemsSource = null;
                TeaShopEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                List<employee> employees = TeaShopEntities.GetContext().employees.OrderBy(p => p.name).ToList();
                DataShifa.ItemsSource = employees;
            }
        }

        private void DataShifa_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();

        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new pages.add_employee((sender as Button).DataContext as employee));
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new add_employee(null));
        }

        private void DelBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedGoods = DataShifa.SelectedItems.Cast<employee>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить { selectedGoods.Count()} записей ??? ", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    employee x = selectedGoods[0];
                    TeaShopEntities.GetContext().employees.Remove(x);
                    TeaShopEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<employee> flowers = TeaShopEntities.GetContext().employees.OrderBy(p =>
                    p.name).ToList();
                    DataShifa.ItemsSource = null;
                    DataShifa.ItemsSource = flowers;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new user_catalog());
        }
    }
}