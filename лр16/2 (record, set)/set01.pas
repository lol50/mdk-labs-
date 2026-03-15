var
  n: integer;
  l: byte;
  years1, years2, years: set of byte;

begin
  write('Введите количество лет: ');
  readln(n);
  
  years1:= [1];
  years2:= [2, 3, 4];
  years:= [11, 12, 13, 14];
  
  l:= n mod 10;
  
  if (n mod 100 in years) then
    writeln(n, ' лет')
  else if l in years1 then
    writeln(n, ' год')
  else if l in years2 then
    writeln(n, ' года')
  else
    writeln(n, ' лет');
end.