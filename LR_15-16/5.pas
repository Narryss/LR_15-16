type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;
  
var 
spis:file;
spis2:file;
i:integer;

Head,Cur: PNode;
r:string;
c:string;

begin
New(Head);
Cur:=Head;

Assign(spis, 'D:\Алембаев Артём ИСПк 204-52-00\LR_15-16\spis.txt');
Assign(spis2, 'D:\Алембаев Артём ИСПк 204-52-00\LR_15-16\spis2.txt');
Reset(spis);

while not eof(spis) do begin

New(Head);
Head^.next:=Cur;
Cur:=Head;

while not eof(spis) and (c <= ' ') do
  read(spis, c);

while not eof(spis) and (c > ' ') do begin
    read(spis,c);
    r:=r+c;
end;
i:=strtoint(r);
Cur^.data := i;
end;
close(spis);
Rewrite(spis2);
cur := Head;
while cur <> nil do
begin

writeln(spis2,cur^.data);
cur := cur^.next;

end;
end.
