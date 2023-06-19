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
using System.IO;
using ModFirm.Store;
using ModFirm.Windows;

namespace ModFirm.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        public OrderPage()
        {
            InitializeComponent();
            ModelFirmEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            if (Auth.User.Role_ID==1)
            {
                List<Order> orders = ModelFirmEntities.GetContext().Orders.OrderBy(p => p.Order_ID).Where(p => p.Client_ID==Auth.User.Client_ID).ToList();
                OrderGrid.ItemsSource = orders;
            }
            else if (Auth.User.Role_ID==2)
            {
                List<Order> orders = ModelFirmEntities.GetContext().Orders.OrderBy(p => p.Order_ID).ToList();
                OrderGrid.ItemsSource = orders;
            }
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {

            }
        }

        private void DataShifa_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();

        }

        private void OrderBtn_Click(object sender, RoutedEventArgs e)
        {
            OrderListWindow orderListWindow = new OrderListWindow((sender as Button).DataContext as Order);
            orderListWindow.Show();
        }
    }
}