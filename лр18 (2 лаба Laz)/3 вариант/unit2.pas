unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses unit1;
{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.Image1Click(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
var c, alifa, alifad, a, S: real;
begin
  c:=strtoint(edit1.text);
  alifa:=strtoint(edit2.text);
  alifad:=alifa*pi/180;
  a:=c/(2*cos(alifad));
  S:=0.5*a*c*sin(alifad);
  edit3.text:=floattostr(a);
  edit4.text:=floattostr(S);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  form1.Show;
  form2.close;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  form1.close;
  form2.close;
end;

end.

