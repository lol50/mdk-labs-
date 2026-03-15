type t = set of Char;
const
  lett: t = ['a'..'z','A'..'Z','_'];
  num: t = ['0'..'9'];
var
  str: string;
  i: byte;
  f: boolean;

begin
  write('Введите строку: ');
  readln(str);
  
  f:= true;
  
  if Length(str) = 0 then
    f:= false
  else
  begin

    if not (str[1] in lett) then
      f:= false
    else
    begin

      for i:= 2 to Length(str) do
      begin
        if not (str[i] in (lett + num)) then
        begin
          f:= false;
          break;
        end;
      end;
    end;
  end;
  writeln(f);
end.