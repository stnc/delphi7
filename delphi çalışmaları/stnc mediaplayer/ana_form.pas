{

}


unit ana_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, Menus, ToolWin, XPMan, StdCtrls, ExtCtrls,
  MPlayer, Gauges, ImgList, ShellCtrls, OleCtrls, AUDIOCONTROLS2Lib_TLB,mmsystem,
  Controls_TLB;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    Dosya1: TMenuItem;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    ListBox1: TListBox;
    XPManifest1: TXPManifest;
    ToolButton1: TToolButton;
    MediaPlayer1: TMediaPlayer;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    CoolBar1: TCoolBar;
    SpeedButton3: TSpeedButton;
    Yukle_tus: TSpeedButton;
    sonraki_tus: TSpeedButton;
    Onceki_tus: TSpeedButton;
    Duraklat_tus: TSpeedButton;
    oynat_tus: TSpeedButton;
    Durdur_tusu: TSpeedButton;
    en_bas_tus: TSpeedButton;
    en_sondaki_tus: TSpeedButton;
    Kaydet_tusu: TSpeedButton;
    Label2: TLabel;
    Gauge1: TGauge;
    ScrollBar1: TScrollBar;
    PopupMenu1: TPopupMenu;
    amEkrandank1: TMenuItem;
    k1: TMenuItem;
    HerZamanUstte1: TMenuItem;
    sd1: TMenuItem;
    dsd1: TMenuItem;
    Tam_ekran: TMenuItem;
    ImageList1: TImageList;
    Label1: TLabel;
    ListBox2: TListBox;
    SpeedButton1: TSpeedButton;
    ShellTreeView1: TShellTreeView;
    CurveEdit1: TCurveEdit;
    LEDMeter1: TLEDMeter;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    ScrollBar2: TScrollBar;
    Label4: TLabel;
    Label5: TLabel;
    TrackBar1: TTrackBar;
    CExSliderCtrl1: TCExSliderCtrl;
    procedure Yukle_tusClick(Sender: TObject);
    procedure oynat_tusClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

    procedure amEkrandank1Click(Sender: TObject);
    procedure k1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
                    procedure baslik_cubugunu_sakla;
    procedure baslik_cubugunu_goster;
    procedure WMSysCommand(var Msg: TWMSysCommand);message WM_SYSCOMMAND;
      procedure herzaman_ustte_olmasin  ;
         procedure   herzaman_ustte;
         procedure dosya_ara(StartDir, FileMask: string);
    procedure HerZamanUstte1Click(Sender: TObject);
    procedure Tam_ekranClick(Sender: TObject);
    procedure Duraklat_tusClick(Sender: TObject);
    procedure Durdur_tusuClick(Sender: TObject);
                      procedure oynat;
    procedure Panel1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure sonraki_tusClick(Sender: TObject);
    procedure Onceki_tusClick(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CExSliderCtrl1PositionChanged(ASender: TObject;
      nPosition: Integer);
// windows un warsay�lan alan�na kendi sistem menunuz� ekler
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
  const
  MCI_SETAUDIO = $0873;
  MCI_DGV_SETAUDIO_VOLUME = $4002;
  MCI_DGV_SETAUDIO_ITEM = $00800000;
  MCI_DGV_SETAUDIO_VALUE = $01000000;
  MCI_DGV_STATUS_VOLUME = $4019;

type
  MCI_DGV_SETAUDIO_PARMS = record
    dwCallback: DWORD;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PChar;
    lpstrQuality: PChar;
  end;

type
  MCI_STATUS_PARMS = record
    dwCallback: DWORD;
    dwReturn: DWORD;
    dwItem: DWORD;
    dwTrack: DWORD;
  end;



function GetMPVolume(MP: TMediaPlayer): Integer;
var 
  p: MCI_STATUS_PARMS;
begin
  p.dwCallback := 0;
  p.dwItem := MCI_DGV_STATUS_VOLUME;
  mciSendCommand(MP.DeviceID, MCI_STATUS, MCI_STATUS_ITEM, Cardinal(@p));
  Result := p.dwReturn;
  { Volume: 0 - 1000 }



  end;


    procedure SetMPVolume(MP: TMediaPlayer; Volume: Integer);
  { Volume: 0 - 1000 }
var
  p: MCI_DGV_SETAUDIO_PARMS;
begin
  { Volume: 0 - 1000 }
  p.dwCallback := 0;
  p.dwItem := MCI_DGV_SETAUDIO_VOLUME;
  p.dwValue := Volume;
  p.dwOver := 0;
  p.lpstrAlgorithm := nil;
  p.lpstrQuality := nil;
  mciSendCommand(MP.DeviceID, MCI_SETAUDIO,
    MCI_DGV_SETAUDIO_VALUE or MCI_DGV_SETAUDIO_ITEM, Cardinal(@p));
end;






   procedure TForm1.dosya_ara(StartDir, FileMask: string);
var
  SR: TSearchRec;
  DirList: TStringList;    //alt klas�rleri de tarama i�in ac�n�z
  IsFound: Boolean;
  i: integer;              // alt klas�rleri de tarama i�in ac�n�z  alt k�s�m

     say:integer;


     begin

 for say:=0 to ListBox1.Items.Count do  //listboxdaki elemna say�s�n� bul
  //o dan ba�la ve bunu listbox a ekelemk i�in gerekli for dongusu

  if StartDir[length(StartDir)] <> '\' then

    StartDir := StartDir + '\';


  IsFound :=
    FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;


  while IsFound do begin
//listbox 1 ve 2 ye ayn� elemenlar� ekle sa�ilen leri


listbox1.Items.Add( (IntToStr(say)+'--'+ExtractFileName(StartDir + SR.Name)));// ExtractFileName buradan exaxt � siliniz
listbox2.Items.Add(StartDir + SR.Name);// ExtractFileName buradan exaxt � silini
               IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);  
 // bu k�sm� acarsan�z sadece tek bir dizini degil onun alt�ndaki t�m dizinleri
 //tarayabilirsiniz
  DirList := TStringList.Create;
 IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;


  while IsFound do begin
    if ((SR.Attr and faDirectory) <> 0) and
         (SR.Name[1] <> '.') then
     DirList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  for i := 0 to DirList.Count-1 do
    dosya_ara(DirList[i], FileMask);

  DirList.Free;
end; // klas�r arama fonksiyonu sonu


                         
procedure tform1.baslik_cubugunu_sakla;
var
save:longint;
begin
     if borderstyle=bsnone then exit;
     save:=getwindowlong(handle,gwl_style);
     if (save and ws_caption)=ws_caption then
     begin
     case borderstyle of
     bssingle,bssizeable: setwindowlong(handle,gwl_style,save and (not(ws_caption)) or ws_border);
     bsdialog:setwindowlong(handle,gwl_style,save and (not(ws_caption)) or ds_modalframe or ws_dlgframe);
     end;
     height:=height-getsystemmetrics(sm_cycaption);
     refresh;
   end;
end;

procedure tform1.baslik_cubugunu_goster;
var
save:longint;
begin
     if borderstyle=bsnone then exit;
     save:=getwindowlong(handle,gwl_style);
     if (save and ws_caption)<>ws_caption then
     begin
     case borderstyle of
     bssingle,
     bssizeable: setwindowlong(handle,gwl_style,save or ws_caption or ws_border);
     bsdialog:setwindowlong(handle,gwl_style,save or ws_caption or ds_modalframe or ws_dlgframe);
     end;
     height:=height+getsystemmetrics(sm_cycaption);
     refresh;
   end;
end;


procedure tform1.herzaman_ustte;
begin
setwindowpos(form1.windowhandle,hwnd_topmost,0,0,1,1,swp_nomove or swp_nosize);
   end;

procedure tform1.herzaman_ustte_olmasin;
begin
   setwindowpos(form1.windowhandle,hwnd_notopmost,0,0,1,1,swp_nomove or swp_nosize);
   end;


procedure TForm1.Yukle_tusClick(Sender: TObject);
   begin
  if (OpenDialog1.Execute) then begin
        MediaPlayer1.FileName := OpenDialog1.FileName;
    MediaPlayer1.Open;
   label1.Caption := '�alan Dosya Ad�     '+ ExtractFileName(openDialog1.FileName)
   +#13+ 'Dosyan�n Yolu      '+openDialog1.FileName+#13+'Bulundugu Klasor     '+ExtractFilePath(openDialog1.FileName);
      Panel1.Caption :='';
      //not  ExtractFileExt() uzunt� kontrol eder
         Timer1.Enabled := true;
                         MediaPlayer1.Display :=Panel1 ;
                         MediaPlayer1.Play;
                              Gauge1.Visible:=True;
     ScrollBar1.Visible:=True;
 ScrollBar1.Max := MediaPlayer1.Length;
    Gauge1.MaxValue :=MediaPlayer1.Length;




MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
 MediaPlayer1.DisplayRect := Rect(0 , 0, panel1.Clientwidth, panel1.ClientHeight);//tam ekran  �




         
   end;
   end;



   procedure tform1.oynat;
 var
olay:string;
sayi:Integer;
begin  //basla1
         // Form2.Show;
         // Form1.Visible :=False;


{listbox1.items[listbox1.itemindex]:=listbox2.items[listbox2.itemindex];    }
                 Form1.Caption:=olay;
MediaPlayer1.Display :=panel1 ;

  sayi:=ListBox1.Items.IndexOf(listbox1.items.strings[listbox1.itemindex]);  // listbocda 1 de se�ili olan�n numaras�n�u bul
      ListBox2.ItemIndex:=sayi;//aktif yap
      olay:=(listbox2.items.strings[listbox2.itemindex]);  // list box2deki daki secimin ne oldugu nu bulur
//secili oln resimi onizleme yapmak i�in iamge1 de onizlemeye koyar
//image3.Picture.LoadFromFile(olay);
//resim_yeri.Caption :=olay;
        // Timer1.Enabled := false;
        //form3.Timer1.Enabled := false;
        //�ok onemli bunlar�n a��lmas� form3 deki scrollbar da hata yap�yor sekme olmuyor

     MediaPlayer1.FileName := olay;




MediaPlayer1.Top:=ClientHeight-30;
//ShowMessage('uyar�');


     MediaPlayer1.Open;
  mediaplayer1.Play;

  ScrollBar1.Max := MediaPlayer1.Length;
  ProgressBar1.Max :=MediaPlayer1.Length;
    // form3. ScrollBar1.Max := MediaPlayer1.Length;
// Form2.WindowState :=wsMaximized;//tam ekran i�in once form buyutulur
 Show;
MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
 MediaPlayer1.DisplayRect := Rect(0 , 0, panel1.Clientwidth, panel1.ClientHeight);//tam ekran  �art kod

 //  ScrollBar1.Position := 0;

  //form3.  ScrollBar1.Position := 0;

Timer1.Enabled := true;
//form3.Timer1.Enabled := true;
 //�ok onemli bunlar�n a��lmas� form3 deki scrollbar da hata yap�yor sekme olmuyor

    begin

                               MediaPlayer1.TimeFormat := tfFrames;
 //ShowMessage('Number of frames = ' +
    //Edit1.Text:=('KAre say�s� = ' + IntToStr(MediaPlayer1.Length));

  MediaPlayer1.TimeFormat :=tfMilliseconds;
   // MediaPlayer1.TimeFormat := tfMilliseconds;

 //Edit2.Text:=('s�re = ' +  IntToStr(MediaPlayer1.Length));
 begin

     ScrollBar1.Max := MediaPlayer1.Length;
   // ProgressBar1.Max:=MediaPlayer1.Length;
    Gauge1.MaxValue :=MediaPlayer1.Length;
                                    Label3.Caption:=IntToStr(MediaPlayer1.Frames);
        {form3.ScrollBar1.Max := MediaPlayer1.Length;
     form3.ProgressBar1.Max:=MediaPlayer1.Length;
     form3.Gauge1.MaxValue :=MediaPlayer1.Length;  }
    end;
     end;
      end;
       {iki elamn eklama

       var
  i:Byte;
begin
  for i:=0 to 255 do
    ListBox1.Items.Add(Chr(i)+'='+IntToStr(i))

    }


procedure TForm1.oynat_tusClick(Sender: TObject);
begin
MediaPlayer1.Play;
end;

procedure TForm1.Timer1Timer(Sender: TObject);

begin {timer �n interval de�eri 1  olsun bu pc'yi biraz zorlar ama}
 ScrollBar1.OnChange := nil;
  ScrollBar1.Position := MediaPlayer1.Position;
 // ProgressBar1.Position:=MediaPlayer1.Position;
  Gauge1.Progress  :=MediaPlayer1.Position;
         ProgressBar1.Position  :=MediaPlayer1.Position;
  //Label3.Caption:='% '+FloatToStr(ProgressBar1.Position*100/ProgressBar1.Max) + 's� Tamamland�';

Label3.Caption:='% '+FloatToStr(ProgressBar1.Position*100/ProgressBar1.Max) + 's� Tamamland�';
label2.Caption :='saatimiz  '+TimeToStr(time);


ScrollBar1.OnChange := ScrollBar1change;
        
   {form3. ScrollBar1.OnChange := nil;
   form3.  ScrollBar1.Position := MediaPlayer1.Position;
  form3.   ProgressBar1.Position:=MediaPlayer1.Position;
   form3.  Gauge1.Progress  :=MediaPlayer1.Position; }
  //form3. ScrollBar1.OnChange := form1.ScrollBar1Change;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  MediaPlayer1.Pause;
  MediaPlayer1.Position := ScrollBar1.Position;

  MediaPlayer1.Play;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
Tam_ekran.Enabled :=False;
  baslik_cubugunu_sakla;
   MediaPlayer1.Display :=form1 ;
     Gauge1.Visible:=false;
     ScrollBar1.Visible:=false;
      PageControl1.Visible :=False;
      CoolBar1.Visible:=False;
      StatusBar1.Visible :=False;
      Panel1.Visible :=False;
                            MainMenu1.AutoMerge:=True;
MediaPlayer1.Top:=ClientHeight-60;
Form1.WindowState :=wsMaximized;//tam ekran i�in once form buyutulur
Show;
MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
MediaPlayer1.DisplayRect := Rect(0 , 0, form1.Clientwidth,form1.ClientHeight);//tam ekran  �

end;



procedure TForm1.amEkrandank1Click(Sender: TObject);
begin
Tam_ekran.Enabled :=True;
    baslik_cubugunu_goster;
  Gauge1.Visible:=True;
     ScrollBar1.Visible:=True;
                Panel1.Visible:=True;
      PageControl1.Visible :=True;
      CoolBar1.Visible:=True;

      StatusBar1.Visible :=true;

                        //    MainMenu1.AutoMerge:= True;
Form1.WindowState :=wsNormal  ;
Show;

MediaPlayer1.Play;

MediaPlayer1.Top:=ClientHeight-30;

MediaPlayer1.Display :=Panel1 ;

MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
MediaPlayer1.DisplayRect := Rect(0 , 0, panel1.Clientwidth, panel1.ClientHeight);//tam ekran  �
//form1.BorderStyle:=bsDialog;


 end;



procedure TForm1.k1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);

var
asd:pchar;
hwin:thandle;
hwin2:thandle;
begin
asd:='Program Hakk�nda';
hwin:=form1.handle; //forma handle al
hwin2:=GetSystemMenu(hwin,false); // system men�ye handle al
DeleteMenu(hwin2, sC_RESTORE, MF_BYCOMMAND );//�nceki boyut eleman�n�sil
DeleteMenu(hwin2, SC_MAXIMIZE, MF_BYCOMMAND);//ekran� kapla eleman�n�sil
DeleteMenu(hwin2,SC_SIZE, MF_BYCOMMAND);    //boyut eleman�n� sil
AppendMenuA(hwin2,MF_STRING,1009,asd);//program hakk�nda isminde eleman ekle
DrawMenuBar(hWin);                   //men�y� tekrar �iz
                   begin
//CurveEdit1.Controls:=MediaPlayer1.Position;
//                  LEDMeter1.Reset;
        Label3.Caption:=IntToStr(MediaPlayer1.StartPos);
        Timer1.Enabled := true;
                           end;


       end;

procedure TForm1.WMSysCommand(var Msg: TWMSysCommand);
begin
 if Msg.CmdType =1009 then //program hakk�ndaya t�kland� ise
 begin
      application.Title:='Hakkinda';
      showmessage('       SYSTEMMEN� PROGRAM�     '+#13+#10+#13+
     'Yazan:'+#9+ 'Selman Tun�'#13+#10+
     'Tarih:'+#9+ '17 kas�m 2006'+#13+#10+
     'Program:'#9+'Stnc Media Player');
 end;
DefaultHandler(Msg);
end;


procedure TForm1.HerZamanUstte1Click(Sender: TObject);
begin

if HerZamanUstte1.Checked=True then
 begin


        herzaman_ustte;
  end
else
begin
//�stte degilse

herzaman_ustte_olmasin;


  end;

end;



procedure TForm1.Tam_ekranClick(Sender: TObject);
begin
SpeedButton3.Click;
end;

procedure TForm1.Duraklat_tusClick(Sender: TObject);
begin
MediaPlayer1.Pause;
end;

procedure TForm1.Durdur_tusuClick(Sender: TObject);
begin

MediaPlayer1.Rewind;
//MediaPlayer1.Play;
end;



procedure TForm1.Panel1DblClick(Sender: TObject);
begin
SpeedButton3.Click;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
 MediaPlayer1.DisplayRect := Rect(0 , 0, panel1.Clientwidth, panel1.ClientHeight);//tam ekran  �

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
//form1.listbox1.Clear ; // listbox � temizle

dosya_ara  (ShellTreeView1.Path   ,'*mp3');//ShellTreeView de secilen klasoru
  dosya_ara  (ShellTreeView1.Path   ,'*mpeg');//ShellTreeView de secilen klasoru
  dosya_ara  (ShellTreeView1.Path   ,'*avi');//ShellTreeView de secilen klasoru
    dosya_ara  (ShellTreeView1.Path   ,'*mpg');
        dosya_ara  (ShellTreeView1.Path   ,'*wmv');
       //  dosya_ara  (ShellTreeView1.Path   ,'*dat');
//form2.Free ;  // bellekten kald�r
//form1.Close ;// bu gereksiz ama beni kapat
//form1.Enabled :=true;  // form 1 i kullanl�r  yap
//form1.Show ;  // form1 i g�ster

//ad�n� al ve klasor �c�nde ve alt dizinlerinde bmp dosyas� ara
end;

procedure TForm1.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   oynat;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
oynat;
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);

        var
  olay :string;
begin
 With ( Control As TListBox ).Canvas Do

begin
  FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, ( Control As TListBox ).Items[Index]);
//olay:=(listbox1.items.strings[listbox1.itemindex]);  // list box2deki daki secimin ne oldugu nu bulur
        Font.Color  := ClBlack; //1 Numaral� Sat�r�n Yaz� Rengi
        Brush.Color := ClWhite; //1 Numaral� Sat�r�n Zemin Rengi
        Font.Color  := ClBlack;  //0 Numaral� Sat�r�n Yaz� Rengi
        Brush.Color := $00D5FBFD;//0 Numaral� Sat�r�n Zemin Rengi




end;
end;
procedure TForm1.sonraki_tusClick(Sender: TObject);
var
olay :string;
sayi:Integer;
begin
listbox1.itemindex:=(listbox1.itemindex+1);



sayi:=ListBox1.Items.IndexOf(listbox1.items.strings[listbox1.itemindex]);  // listbocda 1 de se�ili olan�n numaras�n�u bul
  ListBox2.ItemIndex:=sayi;//aktif yap
olay:=(listbox2.items.strings[listbox2.itemindex]);  // list box2deki daki secimin ne oldugu nu bulur

         Timer1.Enabled := false;


     MediaPlayer1.FileName := olay;


MediaPlayer1.Display :=panel1 ;

MediaPlayer1.Top:=ClientHeight-30;



     MediaPlayer1.Open;
  mediaplayer1.Play;

  ScrollBar1.Max := MediaPlayer1.Length;


MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
 MediaPlayer1.DisplayRect := Rect(0 , 0, panel1.Clientwidth, panel1.ClientHeight);//tam ekran  �art kod
    end;
    

procedure TForm1.Onceki_tusClick(Sender: TObject);
var
olay :string;
sayi:Integer;
begin
listbox1.itemindex:=(listbox1.itemindex-1);



sayi:=ListBox1.Items.IndexOf(listbox1.items.strings[listbox1.itemindex]);  // listbocda 1 de se�ili olan�n numaras�n�u bul
  ListBox2.ItemIndex:=sayi;//aktif yap
olay:=(listbox2.items.strings[listbox2.itemindex]);  // list box2deki daki secimin ne oldugu nu bulur

         Timer1.Enabled := false;


     MediaPlayer1.FileName := olay;


MediaPlayer1.Display :=panel1 ;

MediaPlayer1.Top:=ClientHeight-30;



     MediaPlayer1.Open;
  mediaplayer1.Play;

  ScrollBar1.Max := MediaPlayer1.Length;


MediaPlayer1.Left:=(panel1.ClientWidth-MediaPlayer1.Width);   //tam ekran kodu olmasa da olur
 MediaPlayer1.DisplayRect := Rect(0 , 0, panel1.Clientwidth, panel1.ClientHeight);//tam ekran  �art kod




end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
SetMPVolume(MediaPlayer1, scrollbar2.position);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
SetMPVolume(MediaPlayer1, TrackBar1.Position);
end;

procedure TForm1.CExSliderCtrl1PositionChanged(ASender: TObject;
  nPosition: Integer);
begin
SetMPVolume(MediaPlayer1,CExSliderCtrl1.position);
end;

end.
