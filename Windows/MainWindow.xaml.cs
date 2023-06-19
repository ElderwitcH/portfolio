using ModFirm.Pages;
using ModFirm.Store;
using ModFirm.Windows;
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

namespace ModFirm
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new UserPage());
                if (Auth.User.Role_ID == 1)
            {
                employee.Visibility = Visibility.Collapsed;
            }
            else
            {
                employee.Visibility = Visibility.Visible;
                bag.Visibility = Visibility.Collapsed;
                fav.Visibility = Visibility.Collapsed;
                help.Visibility = Visibility.Collapsed;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.NavigationService.RemoveBackEntry();
            MainFrame.Navigate(new UserPage());
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                MainFrame.GoBack();
            }
        }

        private void bag_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new Pages.BagPage());
        }

        private void fav_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new Pages.FavPage());
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void order_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new OrderPage());
        }

        private void employee_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new EmployeePage());
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }

        private void help_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new HelpPage());
        }
    }
}
