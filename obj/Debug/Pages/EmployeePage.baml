   M S B A M L   `   `   `  ����B  >ModFirm, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:ModFirm.PagesModFirm.Pages  5           ModFirm.Pages.EmployeePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:ModFirm.Pages     5      -   5          N� Title$  EmployeePage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��50 �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ EmployeeGrid��5   �   $��0��6   ��.     AutoGenerateColumns .     
IsReadOnly . $��300,0q�6t   $��Visible=�6�   $   HorizontalScrollBarVisibility$ Visible=�6�      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$! Код сотрудника��6D      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6\   	   
Visibility$	 Hidden=�6f   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 6%   �� *
EmployeeID+6f   4  .System.Windows.Controls.DataGridTemplateColumn  5         CellTemplate 5      �� 5      .R�5      �� $
��Fill=�6$   $��Center=�63   $��Center=�6P   $��1��6k   $	��200��6�   ��6{   �� *
GetPhoto+6�   5      5        5      $ Должность��6C   $	 100 6V   
 6%   �� *	Post.Name+6V     5      $ Дата рождения��6?   $	 100 6V   
 6%   �� *Birth+6V     5      $ 
Почта��6>   $	 100 6M   
 6%   �� *Mail+6M     5      $ 
Номер��6@   $	 100 6O   
 6%   �� *Number+6O     5      $ Сотрудник��6)    5      �� 5       .R�5!      �� ��5"   "   `� 5#   &    �� StringFormat$ {0} {1} {2}��63   .1�5$   *   ��  �� Path$ Surname�62   �� 5%   *   $
 Name�62   �� 5&   *   $ Second_Name�62   5'   '   5)      5*      5,        5-      $! Серия паспорта��6B   $	 100 6Z   
 6%   �� *
Pass_Ser+6Z     5.      $! Номер паспорта��6B   $	 100 6Z   
 6%   �� *
Pass_Num+6Z     5/      $  Редактировать��6)    50      �� 51      .R�52      ��  ��Name$
 edib��63   -   5        $��°°°��52   %   6A   53      55        56       57      �� 58      .R�59      �� $ delib��67   -   5        $��Удалить��59   %   6F   5:      5<      5>      �� 5?   
   $��1��6   $��Center=�6"   $��Center=�6?   .+�5@      �� -   5        $��newemp��5@   3   $+��%Добавить сотрудника��6   6A   5A      5B      5C      