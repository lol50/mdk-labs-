unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
var f, a, b, t, k: real;
begin
  a:=strtoint(edit1.text);
  b:=strtoint(edit2.text);
  t:=strtoint(edit3.text);
  k:=b*t+a;
  if k < 0 then
  begin
  showmessage('подкоренное выражение отрицательное');
  end;
  f:=exp(b*t)*sin(a*t+b)-sqrt(k);
  edit4.text:=floattostr(f);

end;

end.

