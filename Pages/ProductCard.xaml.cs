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
    /// Логика взаимодействия для ProductCard.xaml
    /// </summary>
    public partial class ProductCard : Page
    {
        public Product Product;
        public ProductCard(Product product)
        {
            InitializeComponent();
            DataContext = product;
            Product = product;
            if (Fav.Products.FirstOrDefault(p => p.Product_ID == Product.Product_ID) == null)
            {
                FavouriteCard.Content = "♥";
                FavouriteCard.Width = 35;
            }
            else
            {
                FavouriteCard.Content = "Удалить из избранного";
                FavouriteCard.Width = 250;
            }
            if (Bag.Products.FirstOrDefault(p => p.Product_ID == Product.Product_ID) == null)
            {

                Buy.Content = "Купить";
                Buy.Width = 100;
            }
            else
            {
                Buy.Content = "Убрать из корзины";
                Buy.Width = 200;
            }
        }

        private void Lv_Click(object sender, RoutedEventArgs e)
        {

        }

        private void FavouriteCard_Click(object sender, RoutedEventArgs e)
        {
            if (Fav.Products.FirstOrDefault(p => p.Product_ID == Product.Product_ID) == null)
            {
                Fav.Products.Add(Product);
                FavouriteCard.Content = "Удалить из избранного";
                FavouriteCard.Width = 250;
            }
            else
            {
                Fav.Products.Remove(Product);
                FavouriteCard.Content = "♥";
                FavouriteCard.Width = 35;
            }
        }

        private void Buy_Click(object sender, RoutedEventArgs e)
        {
            if (Bag.Products.FirstOrDefault(p => p.Product_ID == Product.Product_ID) == null)
            {
                Bag.Products.Add(Product);
                Buy.Content = "Убрать из корзины";
                Buy.Width = 200;
            }
            else
            {
                Bag.Products.Remove(Product);
                Buy.Content = "Купить";
                Buy.Width = 100;
            }
        }
    }
}