   M S B A M L   `   `   `  ����B  >ModFirm, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:ModFirm.PagesModFirm.Pages  5          ModFirm.Pages.ProductCard   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:ModFirm.Pages     5        N� Title$  ProductCard��5	         MaterialDesignBody#���   6   $��Regular"�5
      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont N� 
FontFamily# �  5      .��5      �  � RowDefinitions 5   
   �� 5      �� 5       � ColumnDefinitions 5   
   �� 5      �� 5      �� 5      .+�5   
   � $��2��6   $��1��6    .+�5      ��  �� CornerRadius$ 5��6   $	��600��6'   
�������
��� ���$��1,1,1,1q�6\   $��Center=�6v   5      �� 5   
   $��Uniform=�6   $��Center=�6"   $��Bottom=�6?   $��1��6Z   $��20q�6�   $��0��6�   ��6j   �� *
GetPhoto+6�   �� 5   
   $��1��6    �� Orientation$ Vertical=�6%   $	��Top=�6<   $��1��6T   .+�5!      �� $
��Wrap=�6    �� TextAlignment$ Center=�6,   $��50(�6C   $��Center=�6�   
���   �$��0 0 0 30q�6�   ��6Q   �� *Product_name+	 �� StringFormat$
	  {0}��6�   �� 5"      $
��Wrap=�6   $ Center=�6,   $��30(�6C   $��Center=�6~   
���   ���6Q   �� *Price+$	 {0} ₽��6�   �� 5#      $
��Wrap=�6   $ Center=�6,   $��30(�6C   $��Center=�6�   
���   ���6Q   �� *Category.Categoty_name+$
	  {0}��6�   �� 5$      $
��Wrap=�6   $ Center=�6,   $��30(�6C   $��Center=�6�   
���   ���6Q   �� *Purpose.Purpose_name+$
	  {0}��6�   �� 5%      $ 
Horizontal=�6   $��Center=�62   $��Stretch=�6O   .+�5&      �� -   5        
 ��Name$
 FavouriteCard��5&   V   $	��♥��6   $��20(�6%   $��35��63   $��35��6>   $��0q�6J   $��20q�6�   �� 5'      -   5        $	
 Buy��5'   X   $��Купить��6   $��20(�6&   $	��100��64   $��35��6@   $��0q�6L   $��20q�6w   5(      5)      5*      5+      