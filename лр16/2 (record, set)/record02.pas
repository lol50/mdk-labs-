type
  zap1 = record
    day: 1..31;
    month: 1..12;
    year: 1900..2100;
  end;
  anketa = record
    fio: string;
    birth: zap1; 
    kurs: 1..5;
  end;
var
  students: array[1..100] of anketa;
begin
  students[1].fio := 'Кротова Алёна Владимировна';
  students[1].birth.day := 3;
  students[1].birth.month := 4;
  students[1].birth.year := 2008;
  students[1].kurs := 2;

  students[2].fio := 'Иванов Пётр Сергеевич';
  students[2].birth.day := 12;
  students[2].birth.month := 8;
  students[2].birth.year := 2007;
  students[2].kurs := 3;

  students[3].fio := 'Смирнова Анна Дмитриевна';
  students[3].birth.day := 25;
  students[3].birth.month := 11;
  students[3].birth.year := 2008;
  students[3].kurs := 2;

  writeln('Список студентов:');
  
  for var i:= 1 to 3 do
  begin
    writeln('Ф.И.О.: ', students[i].fio);
    write('Дата рождения: ');
    writeln(students[i].birth.day, '.', students[i].birth.month, '.', students[i].birth.year);
    writeln('Курс: ', students[i].kurs);
  end;
end.