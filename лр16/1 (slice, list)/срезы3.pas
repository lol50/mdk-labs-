begin
  var n:=ReadInteger('сколько элементов?');
  var a:=ReadArrInteger(n);
  a[1::2].Println();
  println('мин:', a.Min);
end.