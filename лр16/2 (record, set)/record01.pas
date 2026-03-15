 type anketa = record
    fio: string;
    birth: string;
    kurs: 1..5;
    end;
    var student: anketa;
    begin
      student.fio:= 'Кротова Алёна Владимировна';
      student.birth:= '03.04.2008';
      student.kurs:= 2;
      writeln(student.fio, '/', student.birth, '/', student.kurs);
end.