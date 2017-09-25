





unit gorunum_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Registry, ExtCtrls, jpeg;

type
  Tgorunum = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox7: TCheckBox;
    Image1: TImage;
    Image9: TImage;
    Image18: TImage;
    Image2: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Image4: TImage;
    Image5: TImage;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image9Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure Label27Click(Sender: TObject);
    procedure Label28Click(Sender: TObject);
    procedure Label32Click(Sender: TObject);
    procedure Label31Click(Sender: TObject);
    procedure Label29Click(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  gorunum: Tgorunum;

implementation

uses anamenu, baslatUnit, guvenlikUnit, guvenlik2, internet_explorer_unit,
  internet_unit, sistem_bil_unit, tweak_ui_unit, bil_soft_unit,
  taskman_unit, donanim_unit, ag_unit, araclar, hakkinda;

{$R *.dfm}


  //dosya okur

procedure Tgorunum.FormCreate(Sender: TObject);
var

alr,alr2: OleVariant;
reg:tregistry;
//oku: OleVariant;
//okul:integer;
begin
image1.Picture.Bitmap.LoadFromResourceName(HInstance,'SKK_1_RES');
Reg:=TRegistry.Create;


     begin
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey ('Software\Microsoft\Windows\CurrentVersion\Policies\System',true);//kayd� acar
                 if Reg.ValueExists('NoDispSettingsPage') then   //kayd�n olup olmad�g�n� kontrol eder
                 alr:=reg.ReadInteger ('NoDispSettingsPage'); //verdigimiz de�iskene gore kayd� okur
                  //varsa kayd� alr ye atar

   if  alr=1 then //eger kay�t 1 ise
   CheckBox1.Checked:=true //check box � i�aretler

     else   //de�ilse �art uymuyorsa
     CheckBox1.Checked:=false;   //check boz i�aretini kald�r�r
     reg.CloseKey;
     reg.Free;   //bellekten kald�r�r
 begin

Reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
         if Reg.ValueExists('NoThemesTab') then   //kayd�n olup olmad�g�n� kontrol eder
                 alr2:=reg.ReadInteger ('NoThemesTab'); //verdigimiz de�iskene gore kayd� okur
   if  alr2=1 then
   CheckBox2.Checked:=true
  else
  CheckBox2.Checked:=false;
       reg.CloseKey;
  reg.Free;   //bellekten kald�r�r
              end;

end;
 end;




procedure Tgorunum.CheckBox1Click(Sender: TObject);
   var
key0,key1: OleVariant;
reg:tregistry;
begin
key0:= ('00');
key1:= ('01');
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey ('Software\Microsoft\Windows\CurrentVersion\Policies\System',true);




   if  CheckBox1.Checked=true then

  reg.WriteInteger('NoDispSettingsPage',key1)
     else
     reg.WriteInteger('NoDispSettingsPage',key0) ;
      reg.Free;
       end;










procedure Tgorunum.CheckBox2Click(Sender: TObject);
   var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox2.Checked=true  then
  reg.WriteInteger('NoThemesTab',key1)
     else
       reg.WriteInteger('NoThemesTab',key0) ;
     reg.Free;
       end;
procedure Tgorunum.CheckBox3Click(Sender: TObject);
   var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\System',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox3.Checked=true  then
  reg.WriteInteger('NoDispAppearancePage',key0)
     else
       reg.WriteInteger('NoDispAppearancePage',key1) ;
     reg.Free;
       end;

procedure Tgorunum.CheckBox4Click(Sender: TObject);
   var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\System',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox4.Checked=true  then
  reg.WriteInteger('NoDispBackgroundPage',key1)
     else
       reg.WriteInteger('NoDispBackgroundPage',key0) ;
     reg.Free;
       end;

procedure Tgorunum.CheckBox5Click(Sender: TObject);
   var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox5.Checked=true  then
  reg.WriteInteger('NoChangeKeyboardNavigationIndicators',key0)
     else
       reg.WriteInteger('NoChangeKeyboardNavigationIndicators',key1) ;
     reg.Free;
       end;

procedure Tgorunum.CheckBox6Click(Sender: TObject);
    var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox6.Checked=true  then
  reg.WriteInteger('NoDispScrSavPage',key0)
     else
       reg.WriteInteger('NoDispScrSavPage',key1) ;
     reg.Free;
       end;


 procedure Tgorunum.CheckBox7Click(Sender: TObject);
    var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox7.Checked=true  then
  reg.WriteInteger('NoDispCpl',key0)
     else
       reg.WriteInteger('NoDispCpl',key1) ;
     reg.Free;
       end;




procedure Tgorunum.CheckBox8Click(Sender: TObject);
    var
key0,key1: OleVariant;
reg:tregistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER ;
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
  key0:= ('00');
  key1:= ('01');
   if CheckBox8.Checked=true  then
  reg.WriteInteger('NoChangeAnimation',key0)
     else
       reg.WriteInteger('NoChangeAnimation',key1) ;
     reg.Free;
       end;


  procedure Tgorunum.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  releasecapture;
perform(wm_syscommand,$f012,0);
end;

procedure Tgorunum.Image9Click(Sender: TObject);
begin
application.Minimize;
end;

procedure Tgorunum.Image18Click(Sender: TObject);
begin
application.Terminate;
end;



procedure Tgorunum.Label17Click(Sender: TObject);
begin
gorunum.Visible:=false; 
ana_mnu.show;

end;

procedure Tgorunum.Label18Click(Sender: TObject);
begin
gorunum.Visible:=false;
baslat_form.show;

end;

procedure Tgorunum.Label19Click(Sender: TObject);
begin
gorunum.Visible:=false;
guvenlik.show;

end;

procedure Tgorunum.Label20Click(Sender: TObject);
begin
gorunum.Visible:=false;
guvenlik_2.show;

end;

procedure Tgorunum.Label24Click(Sender: TObject);
begin
gorunum.Visible:=false;
int_exp.show;

end;

procedure Tgorunum.Label23Click(Sender: TObject);
begin
gorunum.Visible:=false;
internet_bil.show;

end;

procedure Tgorunum.Label21Click(Sender: TObject);
begin

gorunum.Visible:=false;
sistem_bil.show;

end;

procedure Tgorunum.Label22Click(Sender: TObject);
begin

gorunum.Visible:=false;
tweak_ui.show;

end;

procedure Tgorunum.Label25Click(Sender: TObject);
begin

//gorunum.Visible:=false;
//gorunum.show;


end;

procedure Tgorunum.Label26Click(Sender: TObject);
begin
gorunum.Visible:=false;
bil_soft.show;

end;

procedure Tgorunum.Label27Click(Sender: TObject);
begin
gorunum.Visible:=false;
taskman_form.show;

end;

procedure Tgorunum.Label28Click(Sender: TObject);
begin
gorunum.Visible:=false;
donanim.show;

end;

procedure Tgorunum.Label32Click(Sender: TObject);
begin
gorunum.Visible:=false;
ag_net.show;

end;

procedure Tgorunum.Label31Click(Sender: TObject);
begin
gorunum.Visible:=false;
araclar_form.show;

end;

procedure Tgorunum.Label29Click(Sender: TObject);
begin
//gorunum.Visible:=false;
//ayarlar.show;

end;

procedure Tgorunum.Label30Click(Sender: TObject);
begin
gorunum.Visible:=false;
hakkinda_form.show;

end;

procedure Tgorunum.Image4Click(Sender: TObject);
begin
gorunum.Visible :=false;
ana_mnu.Show;
end;

end.



















