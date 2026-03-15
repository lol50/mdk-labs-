type
  toy = record
    name: string;
    price: real;
    age: string;
  end;
var
  toys: array[1..4] of toy;
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

  for i:= 1 to 4 do
  begin
    with toys[i] do
    begin
      writeln('Название: ', name);
      writeln('Цена: ', price);
      writeln('Возраст: ', age);
      writeln;
    end;
  end;
end.