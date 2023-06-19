using ModFirm.Models;
using ModFirm.Store;
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

namespace ModFirm.Pages
{
    /// <summary>
    /// Логика взаимодействия для FavPage.xaml
    /// </summary>
    public partial class FavPage : Page
    {
        public User User { get; set; } = Auth.User;

        public FavPage()
        {
            InitializeComponent();
            ListoxViewStay.ItemsSource = Fav.Products;
            DataContext = this;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.ProductCard((sender as Button).DataContext as Product));
        }
    }
}
