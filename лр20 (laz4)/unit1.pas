unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    EditResult: TEdit;
    Panel1: TPanel;
    ButtonBackspace: TButton;
    ButtonClearEntry: TButton;
    ButtonClear: TButton;
    ButtonSqrt: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ButtonDiv: TButton;
    ButtonSquare: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ButtonMul: TButton;
    ButtonOneover: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonSub: TButton;
    ButtonDecimal: TButton;
    ButtonAdd: TButton;
    ButtonEquals: TButton;
    Button0: TButton;
    ButtonSign: TButton;

    procedure FormCreate(Sender: TObject);
    procedure DigitClick(Sender: TObject);
    procedure OperatorClick(Sender: TObject);
    procedure DecimalClick(Sender: TObject);
    procedure EqualsClick(Sender: TObject);
    procedure ClearAllClick(Sender: TObject);
    procedure ClearEntryClick(Sender: TObject);
    procedure BackspaceClick(Sender: TObject);
    procedure SquareClick(Sender: TObject);
    procedure SqrtClick(Sender: TObject);
    procedure OneOverClick(Sender: TObject);
    procedure SignClick(Sender: TObject);
    procedure EditResultKeyPress(Sender: TObject; var Key: char);

  private
    FVal1: Double;
    FOp: Char;
    FNewNumber: Boolean;
    FError: Boolean;
    FWaitingForOperand: Boolean;

    procedure Calculate;
    procedure UpdateDisplay(const Value: String);
    procedure ResetAfterError;
    procedure SetTabOrderAndStyle;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FVal1 := 0;
  FOp := #0;
  FNewNumber := True;
  FError := False;
  FWaitingForOperand := False;
  EditResult.Text := '0';
  EditResult.ReadOnly := False;
  EditResult.TabStop := True;

  BorderStyle := bsSingle;
  BorderIcons := BorderIcons - [biMaximize];
  AutoScroll := False;

  Panel1.Align := alClient;
  Panel1.Color := clGradientActiveCaption;

  EditResult.Font.Name := 'Segoe UI';
  EditResult.Font.Size := 28;
  EditResult.Font.Style := [fsBold];

  for i := 0 to ComponentCount-1 do
    if Components[i] is TButton then
      with Components[i] as TButton do
      begin
        Font.Name := 'Segoe UI';
        Font.Size := 14;
        Font.Style := [fsBold];
      end;

  EditResult.OnKeyPress := @EditResultKeyPress;

  SetTabOrderAndStyle;
end;

// Навигация по таб
procedure TForm1.SetTabOrderAndStyle;
begin
  EditResult.TabOrder := 0;
  Button7.TabOrder := 1;
  Button8.TabOrder := 2;
  Button9.TabOrder := 3;
  ButtonDiv.TabOrder := 4;
  ButtonSqrt.TabOrder := 5;
  ButtonSquare.TabOrder := 6;
  ButtonOneover.TabOrder := 7;
  Button4.TabOrder := 8;
  Button5.TabOrder := 9;
  Button6.TabOrder := 10;
  ButtonMul.TabOrder := 11;
  ButtonClearEntry.TabOrder := 12;
  ButtonClear.TabOrder := 13;
  ButtonBackspace.TabOrder := 14;
  Button1.TabOrder := 15;
  Button2.TabOrder := 16;
  Button3.TabOrder := 17;
  ButtonSub.TabOrder := 18;
  ButtonSign.TabOrder := 19;
  Button0.TabOrder := 20;
  ButtonDecimal.TabOrder := 21;
  ButtonAdd.TabOrder := 22;
  ButtonEquals.TabOrder := 23;
end;

procedure TForm1.UpdateDisplay(const Value: String);
begin
  if Value = '' then
    EditResult.Text := '0'
  else
    EditResult.Text := Value;
end;

procedure TForm1.ResetAfterError;
begin
  FError := False;
  FVal1 := 0;
  FOp := #0;
  FNewNumber := True;
  FWaitingForOperand := False;
  UpdateDisplay('0');
end;

procedure TForm1.Calculate;
var
  Val2: Double;
begin
  if FError then Exit;
  if FWaitingForOperand then Exit;

  try
    Val2 := StrToFloat(EditResult.Text);
  except
    UpdateDisplay('0');
    FVal1 := 0;
    FOp := #0;
    FNewNumber := True;
    FWaitingForOperand := False;
    Exit;
  end;

  case FOp of
    '+': FVal1 := FVal1 + Val2;
    '-': FVal1 := FVal1 - Val2;
    '*': FVal1 := FVal1 * Val2;
    '/':
      begin
        if Val2 = 0 then
        begin
          ShowMessage('Ошибка: деление на ноль!');
          FError := True;
          UpdateDisplay('Ошибка');
          Exit;
        end;
        FVal1 := FVal1 / Val2;
      end;
  else
    FVal1 := Val2;
  end;

  UpdateDisplay(FloatToStr(FVal1));
  FOp := #0;
  FNewNumber := True;
  FWaitingForOperand := False;
end;

// Ввод цифр с кнопок
procedure TForm1.DigitClick(Sender: TObject);
var
  Digit: String;
begin
  if FError then ResetAfterError;

  if FNewNumber then
  begin
    EditResult.Text := '';
    FNewNumber := False;
    FWaitingForOperand := False;
  end;

  Digit := (Sender as TButton).Caption;

  if Length(EditResult.Text) < 15 then
    EditResult.Text := EditResult.Text + Digit;
end;

// Ввод с клавиатуры
procedure TForm1.EditResultKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', '.', '-', #8]) then
    Key := #0;

  if (Key = '-') and (EditResult.Text <> '') then
    Key := #0;

  if (Key = '.') and (Pos('.', EditResult.Text) > 0) then
    Key := #0;

  if FNewNumber and (Key <> #8) then
  begin
    EditResult.Text := '';
    FNewNumber := False;
    FWaitingForOperand := False;
  end;
end;

procedure TForm1.DecimalClick(Sender: TObject);
begin
  if FError then ResetAfterError;

  if FNewNumber then
  begin
    EditResult.Text := '0';
    FNewNumber := False;
    FWaitingForOperand := False;
  end;

  if Pos(DecimalSeparator, EditResult.Text) = 0 then
    EditResult.Text := EditResult.Text + DecimalSeparator;
end;

procedure TForm1.OperatorClick(Sender: TObject);
var
  NewOp: Char;
  CurrentVal: Double;
begin
  if FError then ResetAfterError;
  if EditResult.Text = '' then Exit;

  if Sender = ButtonAdd then
    NewOp := '+'
  else if Sender = ButtonSub then
    NewOp := '-'
  else if Sender = ButtonMul then
    NewOp := '*'
  else if Sender = ButtonDiv then
    NewOp := '/'
  else
    Exit;

  if (FOp <> #0) and (not FWaitingForOperand) then
  begin
    Calculate;
    FNewNumber := True;
  end;

  if FNewNumber or (FOp = #0) then
  begin
    try
      CurrentVal := StrToFloat(EditResult.Text);
      FVal1 := CurrentVal;
    except
      FVal1 := 0;
    end;
  end;

  FOp := NewOp;
  FNewNumber := True;
  FWaitingForOperand := True;
end;

procedure TForm1.EqualsClick(Sender: TObject);
begin
  if FError then ResetAfterError;
  if (EditResult.Text = '') or (FOp = #0) then Exit;
  if FWaitingForOperand then
    FWaitingForOperand := False;
  Calculate;
  FNewNumber := True;
  FWaitingForOperand := False;
end;

procedure TForm1.ClearAllClick(Sender: TObject);
begin
  FVal1 := 0;
  FOp := #0;
  FNewNumber := True;
  FError := False;
  FWaitingForOperand := False;
  UpdateDisplay('0');
end;

procedure TForm1.ClearEntryClick(Sender: TObject);
begin
  if FError then
    ResetAfterError
  else
  begin
    FNewNumber := True;
    FWaitingForOperand := False;
    UpdateDisplay('0');
  end;
end;

procedure TForm1.BackspaceClick(Sender: TObject);
var
  S: String;
begin
  if FError then ResetAfterError;
  if FNewNumber then Exit;

  S := EditResult.Text;
  if Length(S) > 1 then
  begin
    Delete(S, Length(S), 1);
    UpdateDisplay(S);
  end
  else
  begin
    UpdateDisplay('0');
    FNewNumber := True;
    FWaitingForOperand := False;
  end;
end;

// Квадрат числа
procedure TForm1.SquareClick(Sender: TObject);
var
  Val: Double;
begin
  if FError then ResetAfterError;

  Val := StrToFloatDef(EditResult.Text, 0);

  Val := Val * Val;

  UpdateDisplay(FloatToStr(Val));

  FVal1 := Val;
  FOp := #0;
  FNewNumber := True;
  FWaitingForOperand := False;
end;

procedure TForm1.SqrtClick(Sender: TObject);
var
  Val: Double;
begin
  if FError then ResetAfterError;

  Val := StrToFloatDef(EditResult.Text, 0);

  if Val < 0 then
  begin
    ShowMessage('Ошибка: корень из отрицательного числа!');
    FError := True;
    UpdateDisplay('Ошибка');
    Exit;
  end;

  Val := Sqrt(Val);
  UpdateDisplay(FloatToStr(Val));

  FVal1 := Val;
  FOp := #0;
  FNewNumber := True;
  FWaitingForOperand := False;
end;

procedure TForm1.OneOverClick(Sender: TObject);
var
  Val: Double;
begin
  if FError then ResetAfterError;

  Val := StrToFloatDef(EditResult.Text, 0);

  if Val = 0 then
  begin
    ShowMessage('Ошибка: деление на ноль');
    FError := True;
    UpdateDisplay('Ошибка');
    Exit;
  end;

  Val := 1 / Val;
  UpdateDisplay(FloatToStr(Val));

  FVal1 := Val;
  FOp := #0;
  FNewNumber := True;
  FWaitingForOperand := False;
end;

// Смена знака (+/-)
procedure TForm1.SignClick(Sender: TObject);
var
  Val: Double;
begin
  if FError then ResetAfterError;

  Val := StrToFloatDef(EditResult.Text, 0);
  Val := -Val;
  UpdateDisplay(FloatToStr(Val));

  if not FNewNumber then
    FVal1 := Val;
end;

end.
