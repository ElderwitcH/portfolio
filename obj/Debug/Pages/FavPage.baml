   M S B A M L   `   `   `  ����B  >ModFirm, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:ModFirm.PagesModFirm.Pages  5          ModFirm.Pages.FavPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:ModFirm.Pages     5        N� Title$  FavPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $	��160 �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��0��6.   .+�5      A� $	��120��6   $	��120��6"   $��20q�6/   ��5      �� 5       j� Stretch$
 Fill=�6!    �� ImageSource 60   �� *User.Client.GetPhoto+5      �� 5      $��20q�6   .+�5      �� -   5         ��Name$ TbFamil��5      $��30(�6R   ��6-   �� *User.Client.Surname+6R   �� 5      -   5        $ TbImya��5      $��30(�6N   ��6,   �� *User.Client.Name+6N   �� 5      -   5        $ TbOtchestvo��5      $��30(�6Z   ��61   �� *User.Client.Second_Name+6Z   5      5      �� 5   
   -   5         ��Name$ ListoxViewStay��5      $��Disabled=�6+   $��Stretch=�6a   $��1��6    J� Opacity$
 0.85Q�6�   ��5      �� 5       .R�5!      �  � Orientation$ 
Horizontal=�6    $��Center=�69   $��Center=�6V   5"      ��5$      �� 5%      .R�5&      �� -   5        $	��330��5&      $��Stretch=�6*   $��20q�6H   $��Stretch=�6U   
�������.��5'      � $	��300��6   $	��400��6+    5(      �� 5)   "   $	��270 �60   �� 5*   "   �� 5+   "   �� 5,   "   �� 5-   "   �� 5.   "   �� 5/   "   .+�51      �� $��Uniform=�6$   $��Center=�66   $��Center=�6S   $��1��6n   $	��250��6�   ��6~   �� *
GetPhoto+6�   �� 52      $ 
Horizontal=�6)   $��1��6B   .+�53   "   �� $
��Wrap=�6-   	 �� TextAlignment$	 Center=�6A   $��14(�6X   $��Center=�6�   
���   ���6f   �� *Product_name+
 �� StringFormat$

  {0}��6�   �� 54   "   $
��Wrap=�6-   $	 Center=�6A   $��14(�6X   $��Center=�6�   
���   �$��15, 0q�6�   ��6f   �� *Price+$!
 Стоимость: {0} ₽��6�   55      56      57      58      5:      5;      5<      