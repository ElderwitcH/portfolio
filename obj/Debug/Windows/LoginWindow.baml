   M S B A M L   `   `   `  ����B  >ModFirm, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:ModFirm.WindowsModFirm.Windows  5   	   !    ModFirm.Windows.LoginWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:ModFirm.Windows     5   	     � Title$  Sign in��5   	   $	��450��6   $	��800��6&      MaterialDesignBody#���   67   $��Regular"�5	      $��13(�5
      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignPaper#���  5        MaterialDesignFont#���  5      .��5      �  � RowDefinitions 5   
   �� 5      $��80 �6   �� 5      �� 5      $��60 �6   .+�5   
   � ���#c585966   �� 5   
   
�������$��TROPHY AUTHORIZATION��6'   $��
Bauhaus 93)�6C   $��36(�6[   $��Center=�6i   $��Center=�6�   $
��Bold"�6�   � 5   
   $��1��6    � ColumnDefinitions 5      �� 5      $
��0.5* �6#   �� 5       5      �� 5       �� 5!      �� 5"      $��20 �6    .+�5%      �� $��
Логин��6   $��24(�6%   $��Center=�63   $��Center=�6P   $��Light"�6k   �� 5&      $��Пароль��6   $��1��6&   $��24(�63   $��Center=�6A   $��Center=�6^   $��Light"�6y   �� 5'      $��2��6    �� Orientation$ 
Horizontal=�6&   $��Center=�6?   $��Center=�6\   $��2��6w   .+�5(      �� $%��Запомнить пароль��6   $��2��64   $��16(�6A   $��Center=�6O   $��Light"�6j   �� 5)      -   5         ��Name$ SavePasswordCheckBox��5)      $��Center=�69   $��Center=�6V   5*      �� 5,      -   5         ��Name$ LoginTb��5,      $��1��6'   $��24(�67   $��Center=�6E   $��Light"�6`   $��10q�6s   G� 5-      -   5         G�Name$ 
PasswordPb��5-      $��1��6.   $��1��6>   $��24(�6K   $��Center=�6Y   $��Light"�6t   $��10q�6�   5/      � 50   
   ���#c58596$��3��6$   �� 52   
   $��3��6   $��Center=�6"   $��Center=�6=   $ 
Horizontal=�6Z   .+�53      �� -   5        	 ��Name$	 LoginBtn��53      $��
Войти��6>   $��2��6N   $��10q�54      �� 55      -   5        $	 	RegistBtn��55      $��Регистрация��6@   $��2��6V   $��10q�56      57      58      59      