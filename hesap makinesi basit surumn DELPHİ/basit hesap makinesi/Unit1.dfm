object Form1: TForm1
  Left = 136
  Top = 294
  BorderStyle = bsDialog
  Caption = 'STnc Software En basitinden Hesap MAkinesi Ver: 1.00'
  ClientHeight = 188
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 111
    Height = 13
    Caption = 'Birinci '#304#351'lemi Giriniz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 88
    Width = 107
    Height = 13
    Caption = #304'kinci '#304#351'lemi Giriniz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 120
    Width = 39
    Height = 13
    Caption = 'SOnuc'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 184
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 184
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 192
    Width = 75
    Height = 25
    Caption = 'sonuc'
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 96
    Top = 200
    Width = 97
    Height = 17
    Caption = 'toplaam'
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 152
    Top = 200
    Width = 97
    Height = 17
    Caption = #231#305'karma'
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 192
    Width = 97
    Height = 17
    Caption = #231'arpma'
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 128
    Top = 192
    Width = 97
    Height = 17
    Caption = 'bolme'
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 184
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Button2: TButton
    Left = 352
    Top = 88
    Width = 41
    Height = 25
    Caption = '-'
    TabOrder = 8
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 352
    Top = 120
    Width = 41
    Height = 25
    Caption = '*'
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 352
    Top = 152
    Width = 41
    Height = 25
    Caption = '/'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 352
    Top = 48
    Width = 41
    Height = 25
    Caption = '+'
    TabOrder = 11
    OnClick = Button5Click
  end
end
