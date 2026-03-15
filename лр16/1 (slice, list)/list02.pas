begin
    var a:= lst(arrrandom(10, -5, 20));
    println('список: ', a);
    var k:=a.IndexMax;
    a.RemoveAt(k);
    print(a);
end.