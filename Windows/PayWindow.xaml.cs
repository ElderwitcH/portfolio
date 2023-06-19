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
using System.Windows.Shapes;
using System.Net;
using System.IO;
using System.Threading.Tasks;
using System.Net.Mail;

namespace ModFirm.Windows
{
    /// <summary>
    /// Логика взаимодействия для PayWindow.xaml
    /// </summary>
    public partial class PayWindow : Window
    {
        public PayWindow()
        {
            InitializeComponent();
        }

        private void PayBtn_Click(object sender, RoutedEventArgs e)
        {
            MailAddress from = new MailAddress("ttrophyyy@mail.ru");
            // кому отправляем
            MailAddress to = new MailAddress("sanguis.sanguis.sanguis@gmail.com");
            // создаем объект сообщения
            MailMessage m = new MailMessage(from, to);
            // тема письма
            m.Subject = "Ваш Заказ!";
            // текст письма
            m.Body = "<h2>Спасибо за то, что выбрали нас!</h2>";
            m.Attachments.Add(new Attachment("A://58.jpg"));
            m.Attachments.Add(new Attachment("A://62.jpg"));
            m.Attachments.Add(new Attachment("A://64.jpg"));
            m.Attachments.Add(new Attachment("A://65.jpg"));
            // письмо представляет код html
            m.IsBodyHtml = true;
            // адрес smtp-сервера и порт, с которого будем отправлять письмо
            SmtpClient smtp = new SmtpClient("smtp.mail.ru", 587);
            // логин и пароль
            smtp.Credentials = new NetworkCredential("ttrophyyy@mail.ru", "kx4tQBqjriNDQYq3Uszt");
            smtp.EnableSsl = true;
            smtp.Send(m);
            Bag.Products = new List<Product>();
            MessageBox.Show("Заказ оформлен");

            this.Close();

        }
    }
}
