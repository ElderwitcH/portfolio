﻿using ModFirm.Models;
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
using System.Windows.Shapes;

namespace ModFirm.Windows
{
    /// <summary>
    /// Логика взаимодействия для OrderListPage.xaml
    /// </summary>
    public partial class OrderListWindow : Window
    {
        public OrderListWindow(Order order)
        {
            InitializeComponent();
            OrderListBox.ItemsSource = order.Order_Product.ToList().ConvertAll(p => p.Product);

        }
        
    }
    
}
