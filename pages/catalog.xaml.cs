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
    /// Логика взаимодействия для catalog.xaml
    /// </summary>

    public class PageController
    {
        public int PageNumber { get; set; }
    public PageController(int pageNumber)
    {
        PageNumber = pageNumber;
    }
}
public partial class catalog : Page
    {
        private int currentPage = 1;
        private int limit = 3;
        private int limitPage = 4;
        private int start = 1;
        private int pageCount;
        public List<PageController> pageController { get; set; } = new List<PageController>();
        public catalog()
        {
            InitializeComponent();
            var rooms = TeaShopEntities.GetContext().teas.ToList();
            RoomDg.ItemsSource = TeaShopEntities.GetContext().teas.ToList();

            pageCount = (rooms.Count / limit) + 1;
            var tarrifTypes = TeaShopEntities.GetContext().types.ToList();
            tarrifTypes.Insert(0, new type() { category = "Все" });
            RoomTypeCmb.ItemsSource = tarrifTypes;
        }
        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void RoomTypeCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void ComboSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
        private void Update()
        {
            List<tea> product = TeaShopEntities.GetContext().teas.ToList();

            pageCount = (product.Count / limit) + 1;
            GeneratePageButton();

            if (TBoxSearch.Text.Trim().Length > 0)
            {
                product = product.Where(p => p.name.ToLower().Contains(TBoxSearch.Text.Trim().ToLower())).ToList();
            }

            if (ComboSort.SelectedIndex >= 0)
            {
                if (ComboSort.SelectedIndex == 0)
                    product = product.OrderBy(p => p.price).ToList();
                if (ComboSort.SelectedIndex == 1)
                    product = product.OrderByDescending(p => p.price).ToList();
            }

            if (RoomTypeCmb.SelectedIndex > 0)
            {
                product = product.Where(p => p.type_ID == (RoomTypeCmb.SelectedItem as type).type_ID).ToList();
            }

            RoomDg.ItemsSource = product.Skip(currentPage * limit - limit).Take(limit); ;
        }

        private void InfoBtn_Click(object sender, RoutedEventArgs e)
        {

            NavigationService.Navigate(new pages.add_page((sender as Button).DataContext as tea));
        }

        private void AddRoomBtn_Click(object sender, RoutedEventArgs e)
        {

            NavigationService.Navigate(new add_page(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            TeaShopEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());

            Update();
        }
        private void GeneratePageButton()
        {
            List<tea> agents = TeaShopEntities.GetContext().teas.ToList();
            RoomDg.ItemsSource = agents;

            pageController = new List<PageController>();

            for (int i = start; i < start + limitPage; i++)
            {
                if (i <= pageCount)
                {
                    pageController.Add(new PageController(i));
                }
            }

            PagesItemsControl.ItemsSource = pageController;
        }


        private void SelectPageBtn_Click(object sender, RoutedEventArgs e)
        {
            currentPage = (int)(sender as Button).Content;
            Update();
        }
        private void nextBtn_Click(object sender, RoutedEventArgs e)
        {
            if (start + limitPage > pageCount)
            {
                return;
            }
            start = start + limitPage;
            Update();
        }
        private void prevBtn_Click(object sender, RoutedEventArgs e)
        {
            if (start - limitPage < 1)
            {
                return;
            }
            start = start - limitPage;
            Update();
        }

        private void DelBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedGoods = RoomDg.SelectedItems.Cast<tea>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedGoods.Count()} записей?", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    tea x = selectedGoods[0];
                    TeaShopEntities.GetContext().teas.RemoveRange(selectedGoods);
                    TeaShopEntities.GetContext().SaveChanges();
                    NavigationService.Navigate(new pages.catalog());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new pages.user_catalog());
        }
    }
}
