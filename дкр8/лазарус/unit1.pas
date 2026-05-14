unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;

type
  { TForm1 }

  TForm1 = class(TForm)
    ButtonCube: TButton;
    ButtonCuboid: TButton;
    ButtonCylinder: TButton;
    ButtonSphere: TButton;
    ButtonCalculate: TButton;
    EditSide: TEdit;
    EditLength: TEdit;
    EditWidth: TEdit;
    EditHeight: TEdit;
    EditResult: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;

    procedure ButtonCubeClick(Sender: TObject);
    procedure ButtonCuboidClick(Sender: TObject);
    procedure ButtonSphereClick(Sender: TObject);
    procedure ButtonCylinderClick(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditSideKeyPress(Sender: TObject; var Key: char);
    procedure EditLengthKeyPress(Sender: TObject; var Key: char);
    procedure EditWidthKeyPress(Sender: TObject; var Key: char);
    procedure EditHeightKeyPress(Sender: TObject; var Key: char);

  private
    CurrentFigure: integer;
    procedure LockInputFields;
    procedure ClearAllFields;
    procedure UpdateLabels;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := 'Калькулятор объема фигур';
  Width := 500;
  Height := 450;

  Label1.Caption := 'Ребро:';
  Label2.Caption := 'Длина:';
  Label3.Caption := 'Ширина:';
  Label4.Caption := 'Высота:';

  EditResult.ReadOnly := True;
  EditResult.Text := '0';
  EditResult.Color := clBtnFace;

  CurrentFigure := 0;
  LockInputFields;
  ClearAllFields;
  UpdateLabels;
end;

procedure TForm1.EditSideKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', '.', #8]) then
    Key := #0;
  if (Key = '.') and (Pos('.', (Sender as TEdit).Text) > 0) then
    Key := #0;
end;

procedure TForm1.EditLengthKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', '.', #8]) then
    Key := #0;
  if (Key = '.') and (Pos('.', (Sender as TEdit).Text) > 0) then
    Key := #0;
end;

procedure TForm1.EditWidthKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', '.', #8]) then
    Key := #0;
  if (Key = '.') and (Pos('.', (Sender as TEdit).Text) > 0) then
    Key := #0;
end;

procedure TForm1.EditHeightKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', '.', #8]) then
    Key := #0;
  if (Key = '.') and (Pos('.', (Sender as TEdit).Text) > 0) then
    Key := #0;
end;

procedure TForm1.LockInputFields;
begin
  EditSide.Enabled := False;
  EditLength.Enabled := False;
  EditWidth.Enabled := False;
  EditHeight.Enabled := False;

  case CurrentFigure of
    0: EditSide.Enabled := True;
    1: begin
      EditLength.Enabled := True;
      EditWidth.Enabled := True;
      EditHeight.Enabled := True;
    end;
    2: EditSide.Enabled := True;
    3: begin
      EditSide.Enabled := True;
      EditHeight.Enabled := True;
    end;
  end;

  EditSide.Color := clWindow;
  EditLength.Color := clWindow;
  EditWidth.Color := clWindow;
  EditHeight.Color := clWindow;

  if not EditSide.Enabled then EditSide.Color := clBtnFace;
  if not EditLength.Enabled then EditLength.Color := clBtnFace;
  if not EditWidth.Enabled then EditWidth.Color := clBtnFace;
  if not EditHeight.Enabled then EditHeight.Color := clBtnFace;
end;

procedure TForm1.ClearAllFields;
begin
  EditSide.Text := '';
  EditLength.Text := '';
  EditWidth.Text := '';
  EditHeight.Text := '';
end;

procedure TForm1.UpdateLabels;
begin
  case CurrentFigure of
    0: begin
      Label1.Caption := 'Ребро:';
      Label2.Caption := '(не нужно)';
      Label3.Caption := '(не нужно)';
      Label4.Caption := '(не нужно)';
    end;
    1: begin
      Label1.Caption := '(не нужно)';
      Label2.Caption := 'Длина:';
      Label3.Caption := 'Ширина:';
      Label4.Caption := 'Высота:';
    end;
    2: begin
      Label1.Caption := 'Радиус:';
      Label2.Caption := '(не нужно)';
      Label3.Caption := '(не нужно)';
      Label4.Caption := '(не нужно)';
    end;
    3: begin
      Label1.Caption := 'Радиус:';
      Label2.Caption := '(не нужно)';
      Label3.Caption := '(не нужно)';
      Label4.Caption := 'Высота:';
    end;
  end;
end;

procedure TForm1.ButtonCubeClick(Sender: TObject);
begin
  CurrentFigure := 0;
  ClearAllFields;
  LockInputFields;
  UpdateLabels;
  EditResult.Text := '0';
  Caption := 'Калькулятор - КУБ';
  ButtonCube.Font.Style := [fsBold];
  ButtonCuboid.Font.Style := [];
  ButtonSphere.Font.Style := [];
  ButtonCylinder.Font.Style := [];
end;

procedure TForm1.ButtonCuboidClick(Sender: TObject);
begin
  CurrentFigure := 1;
  ClearAllFields;
  LockInputFields;
  UpdateLabels;
  EditResult.Text := '0';
  Caption := 'Калькулятор - ПАРАЛЛЕЛЕПИПЕД';
  ButtonCuboid.Font.Style := [fsBold];
  ButtonCube.Font.Style := [];
  ButtonSphere.Font.Style := [];
  ButtonCylinder.Font.Style := [];
end;

procedure TForm1.ButtonSphereClick(Sender: TObject);
begin
  CurrentFigure := 2;
  ClearAllFields;
  LockInputFields;
  UpdateLabels;
  EditResult.Text := '0';
  Caption := 'Калькулятор - СФЕРА';
  ButtonSphere.Font.Style := [fsBold];
  ButtonCube.Font.Style := [];
  ButtonCuboid.Font.Style := [];
  ButtonCylinder.Font.Style := [];
end;

procedure TForm1.ButtonCylinderClick(Sender: TObject);
begin
  CurrentFigure := 3;
  ClearAllFields;
  LockInputFields;
  UpdateLabels;
  EditResult.Text := '0';
  Caption := 'Калькулятор - ЦИЛИНДР';
  ButtonCylinder.Font.Style := [fsBold];
  ButtonCube.Font.Style := [];
  ButtonCuboid.Font.Style := [];
  ButtonSphere.Font.Style := [];
end;

procedure TForm1.ButtonCalculateClick(Sender: TObject);
var
  a, b, c, Volume: Double;
begin
  Volume := 0;

  try
    case CurrentFigure of
      0: begin
        if EditSide.Text = '' then raise Exception.Create('Введите ребро');
        a := StrToFloat(EditSide.Text);
        if a <= 0 then raise Exception.Create('Число должно быть больше 0');
        Volume := a * a * a;
      end;

      1: begin
        if EditLength.Text = '' then raise Exception.Create('Введите длину');
        if EditWidth.Text = '' then raise Exception.Create('Введите ширину');
        if EditHeight.Text = '' then raise Exception.Create('Введите высоту');
        a := StrToFloat(EditLength.Text);
        b := StrToFloat(EditWidth.Text);
        c := StrToFloat(EditHeight.Text);
        if (a <= 0) or (b <= 0) or (c <= 0) then
          raise Exception.Create('Числа должны быть больше 0');
        Volume := a * b * c;
      end;

      2: begin
        if EditSide.Text = '' then raise Exception.Create('Введите радиус');
        a := StrToFloat(EditSide.Text);
        if a <= 0 then raise Exception.Create('Радиус должен быть больше 0');
        Volume := (4/3) * Pi * a * a * a;
      end;

      3: begin
        if EditSide.Text = '' then raise Exception.Create('Введите радиус');
        if EditHeight.Text = '' then raise Exception.Create('Введите высоту');
        a := StrToFloat(EditSide.Text);
        b := StrToFloat(EditHeight.Text);
        if (a <= 0) or (b <= 0) then
          raise Exception.Create('Числа должны быть больше 0');
        Volume := Pi * a * a * b;
      end;
    end;

    EditResult.Text := FormatFloat('0.#####', Volume);

  except
    on E: Exception do
    begin
      EditResult.Text := 'Ошибка!';
      ShowMessage(E.Message);
    end;
  end;
end;

end.
