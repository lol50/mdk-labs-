type
  toy = record
    name: string[20];
    price: real;
    age: string[10];
  end;

var
  toys: array[1..4] of toy;
  toys_copy: array[1..4] of toy;
  f: file;
  i: integer;

begin
  with toys[1] do
  begin
    name:= 'Кукла';
    price:= 1200;
    age:= '3-7';
  end;
  
  with toys[2] do
  begin
    name:= 'Машинка';
    price:= 450;
    age:= '2-5';
  end;
  
  with toys[3] do
  begin
    name:= 'Мяч';
    price:= 300;
    age:= '1-10';
  end;
  
  with toys[4] do
  begin
    name:= 'Пазл';
    price:= 600;
    age:= '5-12';
  end;

  assign(f, 'toys.dat');
  rewrite(f);
  for i:= 1 to 4 do
    write(f, toys[i]);
  close(f);

  assign(f, 'toys.dat');
  reset(f);
  for i:= 1 to 4 do
    read(f, toys_copy[i]);
  close(f);

  for i := 1 to 4 do
  begin
    with toys_copy[i] do
    begin
      writeln('Название: ', name);
      writeln('Цена: ', price:0:2);
      writeln('Возраст: ', age);
      writeln;
    end;
  end;
end.