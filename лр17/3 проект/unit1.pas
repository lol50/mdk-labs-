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
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, n, resultat, i: integer;
begin
  a := StrToInt(Edit1.Text);
  n := StrToInt(Edit2.Text);
  resultat := 1;
  i := 1;
  while i <= n do
  begin
    resultat := resultat * a;
    i := i + 1;
  end;
  Memo1.Lines.Add('Число ' + Edit1.Text + ' в степени ' + Edit2.Text + ' равно: ' + IntToStr(resultat));
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

end.

