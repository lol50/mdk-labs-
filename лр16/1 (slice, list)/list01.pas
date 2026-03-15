begin
  var n:=ReadInteger('сколько элементов в массиве?');
  var a:= arrrandominteger(n, -5,20);
  println('массив: ', a);
  var L1:=new List<integer>;
  var L2:=new List<integer>;
  foreach var x in a do
    if (x > 0) or (x = 0) then
      L1 += x
    else L2 += x;
  println('L1: ', L1); 
   println('L2: ', L2); 
end.