begin
  var n:=ReadInteger('сколько элементов?');
  var a:=ReadArrInteger(n);
  var k:=a.IndexMax;
  a:=a[:k]+a[k+1:];
  print(a);
end.