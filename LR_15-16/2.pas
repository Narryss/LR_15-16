type
  PNode = ^Node;
  Node = record
    word: string[40];
    count: integer;
    next: PNode;
  end;

var
  F: text;
  Result, c: string;
  Head, pp, newelem: PNode;
  i: integer;

begin
  c := ' ';
  New(Head);
  pp := Head;
  Assign(F, 'D:\Алембаев Артём ИСПк 204-52-00\LR_15-16\F.txt');
  Reset(F);
  while not Eof(F) do
  begin
    i := 0;
    Result := '';
    while not Eof(F) and (c <= ' ') do
      Read(F, c);
    while not Eof(F) and (c > ' ') do
    begin
      Result := Result + c;
      Read(F, c);
    end;
    pp := Head;
    while (pp^.next <> nil) do
    begin
      pp := pp^.next;
      if pp^.word = Result then
      begin
        i := 1;
        Break;
      end;
    end;
    if i = 0 then
    begin
      New(newelem);
      newelem^.word := Result;
      newelem^.count := 1;
      newelem^.next := nil;
      pp^.next := newelem;
    end
    else
    begin
      pp^.count := pp^.count + 1;
    end;
  end;
  pp := Head;
  while pp <> nil do
  begin
      writeln(pp^);
      pp := pp^.next;
  end;

end.