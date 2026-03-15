begin
  var n:=ReadInteger('сколько элементов в массиве?');
  var a:=ReadArrInteger(n);
  var h:=ReadInteger('введите число');
  var l:=a.IndexMin;
  a:=a[:l]+Arr(h)+a[l:];
  print(a);
end.