unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    ListView1: TListView;
    Edit1: TEdit;
    ListBox2: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var x:Integer;
  olay,sayi:Integer;

  begin
   // listbox1.ItemIndex:=listbox2.Items;
//var 


//'; // ba l�kta yaz  ListBox1.Selected:=listbox2.Items.Count;

       // sayi:=ListBox1.Items.IndexOf('Antalya');//Antalya ka��nc� sat�rda
  //Form1.Caption:='Se�ti iniz Eleman ' + IntToStr(sayi+1)+ ' . S�rada';
//olay:=(listbox1.items.strings[listbox1.itemindex]);  // list box daki secimin ne oldugu nu bulur
  sayi:=ListBox1.Items.IndexOf(listbox1.items.strings[listbox1.itemindex]);
  Form1.Caption:='Se�ti iniz Eleman ' + IntToStr(sayi+1)+ ' . S�rada';
  ListBox2.ItemIndex:=sayi;//aktif yap
  end;

procedure TForm1.Button2Click(Sender: TObject);
var 
  i:Byte; 
begin
  for i:=0 to 255 do
    ListBox1.Items.Add(Chr(i)+'='+IntToStr(i))
    end;
end.
