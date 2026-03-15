begin
  var n:=ReadInteger('сколько элементов? (четное)');
  var a:=ReadArrInteger(n);
  a[1::2].Println();
end.