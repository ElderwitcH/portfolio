using ModFirm.Models;
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
    /// Логика взаимодействия для EmployeePage.xaml
    /// </summary>
    public partial class EmployeePage : Page
    {
        public EmployeePage()
        {
            InitializeComponent();
            ModelFirmEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            List<Employee> employees = ModelFirmEntities.GetContext().Employees.OrderBy(p => p.Employee_ID).ToList();
            EmployeeGrid.ItemsSource = employees;

        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                ModelFirmEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                List<Employee> employees = ModelFirmEntities.GetContext().Employees.OrderBy(p => p.Employee_ID).ToList();
                EmployeeGrid.ItemsSource = employees;
            }
        }

        private void edib_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditEmployeePage((sender as Button).DataContext as Employee));
        }

        private void newemp_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditEmployeePage(null));
        }

        private void delib_Click(object sender, RoutedEventArgs e)
        {
            var selectedGoods = EmployeeGrid.SelectedItems.Cast<Employee>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    Employee x = selectedGoods[0];
                    ModelFirmEntities.GetContext().Employees.Remove(x);
                    ModelFirmEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись удалена");
                    List<Employee> flowers = ModelFirmEntities.GetContext().Employees.OrderBy(p =>
                    p.Name).ToList();
                    EmployeeGrid.ItemsSource = null;
                    EmployeeGrid.ItemsSource = flowers;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}