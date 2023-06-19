using ModFirm.Models;
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

namespace ModFirm.Pages
{
    /// <summary>
    /// Логика взаимодействия для BagPage.xaml
    /// </summary>
    public partial class BagPage : Page
    {
        public User User { get; set; } = Auth.User;
        public BagPage()
        {
            InitializeComponent();
            ListoxViewStay.ItemsSource = Bag.Products;
            TotalPrice.Text = "Сумма заказа: " + Bag.Products.Sum(p => p.Price).ToString() + "₽  ";
            DataContext = this;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.ProductCard((sender as Button).DataContext as Product));
        }

        private void GoOrder_Click(object sender, RoutedEventArgs e)
        {
            if(Bag.Products.Count > 0)
            { 
                ModelFirmEntities.GetContext().Orders.Add(new Order {Client_ID=Auth.User.Client_ID??0, Employee_ID=11, 
                    Date_order=DateTime.Now, Price= Bag.Products.Sum(p => p.Price)??0});

                ModelFirmEntities.GetContext().SaveChanges();
                ModelFirmEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                int order_ID = ModelFirmEntities.GetContext().Orders.ToList().LastOrDefault().Order_ID;
                ModelFirmEntities.GetContext().Order_Product.AddRange(Bag.Products.ConvertAll<Order_Product>(p =>
                new Order_Product { Order_ID = order_ID , Product_ID = p.Product_ID }));
                ModelFirmEntities.GetContext().SaveChanges();
                ListoxViewStay.ItemsSource = Bag.Products;
                TotalPrice.Text = "Сумма заказа: " + Bag.Products.Sum(p => p.Price).ToString() + "₽  ";
                PayWindow payWindow = new PayWindow();
                if (payWindow.ShowDialog() == false)
                {
                    TotalPrice.Text = "Сумма заказа: " + Bag.Products.Sum(p => p.Price).ToString() + "₽  ";
                    ListoxViewStay.ItemsSource = Bag.Products;
                };
            }
        }
    }
}
