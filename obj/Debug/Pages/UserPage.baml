   M S B A M L   `   `   `  ����B  >ModFirm, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:ModFirm.PagesModFirm.Pages  5          ModFirm.Pages.UserPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:ModFirm.Pages     5      -   5          N� Title$  UserPage��5	         MaterialDesignBody#���   6   $��Regular"�5
      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont N� 
FontFamily# �  5      .��5      �  � RowDefinitions 5   
   �� 5      $��70 �6   �� 5      $��* �6   .+�5   
   � $��0��6   $��Stretch=�6!   $��Center=�6?   $��5,0,0,0q�6Z   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $5��/Введите текст для поиска  ��6   $��20(�6>   $��Center=�6L   �� 5      -   5         ��Name$ 
TBoxSerach��5      $	��200��6.   $	��5,0q�6:   $��Center=�6G   6d   5      �� 5      $ 
Horizontal=�6   $��5q�62   .+�5      �� $��Категория:  ��6   $��20(�60   �� 5      -   5         ��Name$ Cmbnapravlenie��5      $	��200��63    �� DisplayMemberPath$ Categoty_name��6s   5      �� 5       $ 
Horizontal=�6   $��5q�62   .+�5!      �� $��	Тип:  ��6   $��20(�6*   �� 5"      -   5        $ CmbType��5"      $	��200��6,   $ Purpose_name��6e   5#      �� 5$      $ 
Horizontal=�6   $��5q�62   .+�5%      �� $$��Сортировать по:  ��6   $	��5,0q�65   $��20(�6B   �� 5&      -   5        $ CmbSort��5&      $	��200��6,   .@�5'      �� $��Возрастанию��6#   �� 5(      $��Убыванию��6#   5)      5*      5+      �� 5-   
   -   5        	 ��Name$	 ListoxViewStay��5-      $��Disabled=�6+   $��Stretch=�6a   $��1��6   
 J� Opacity$

 0.85Q�6�   ��5/      �� 50      .R�51      �  � Orientation$ 
Horizontal=�6    $��Center=�69   $��Center=�6V   52      ��54      �� 55      .R�56      �� -   5        $	��330��56   4   $��Stretch=�6A   $��20q�6_   $��Stretch=�6l   
�������.��57      � $	��300��6   $	��400��6'    58      �� 59      $	��270 �6,   �� 5:      �� 5;      �� 5<      �� 5=      �� 5>      �� 5?      .+�5A      �� $��Uniform=�6    $��Center=�62   $��Center=�6O   $��1��6j   $	��250��6�   ��6z   �� *
GetPhoto+6�   �� 5B      $ 
Horizontal=�6)   $��1��6B   .+�5C      �� $
��Wrap=�6%    �� TextAlignment$ Center=�69   $��14(�6P   $��Center=�6�   
���   ���6^   �� *Product_name+ �� StringFormat$
  {0}��6�   �� 5D      $
��Wrap=�6)   $ Center=�6=   $��14(�6T   $��Center=�6�   
���   �$��15, 0q�6�   ��6b   �� *Price+$! Стоимость: {0} ₽��6�   5E      5F      5G      5H      5J      5L      5M      