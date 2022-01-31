program Lab_1_with_proc;

{$APPTYPE CONSOLE}

type
  Matrix = array [1..3, 1..3] of real;
var
  A: Matrix=((5,2,0),(10,4,1),(7,3,2));
  B: Matrix=((3,6,-1),(-1,-2,0),(2,1,3));
  C,D: Matrix;

  procedure Output (var X:Matrix);
    var
      i,j:Integer;
    begin
      for i:=1 to 3 do
      begin
        for j:=1 to 3 do
          Write(X[i,j]:4:0,' ');
          Writeln;
      end;
    end;


  procedure Umn (var Rez:Matrix; M1:Matrix; M2:Matrix);
    var
      i,j,k:Integer;
    begin
    for i:=1 to 3 do
      for j:=1 to 3 do
      begin
        Rez[i,j]:=0;
        for k:=1 to 3 do
          Rez[i,j]:= Rez[i,j] + M1[i,k]*M2[k,j];
      end;
    end;

  procedure Sum (var Rez:Matrix; M1:Matrix; M2:Matrix);
    var
      i,j:Integer;
    begin
    for i:=1 to 3 do
      for j:=1 to 3 do
        Rez[i,j]:=M1[i,j] + M2[i,j];
    end;

  procedure Scalar (var Rez:Matrix; Sc:Integer; M1:Matrix);
    var
      i,j:Integer;
    begin
    for i:=1 to 3 do
      for j:=1 to 3 do
        Rez[i,j]:= Sc * M1[i,j];
    end;

  Begin

  Writeln('(A-B^2)*(2*A+B):');
  Writeln('Matrix A');

  Output(A);

  Writeln;

  Writeln('Matrix B');
  Output(B);

  Writeln;

  Writeln('B^2=');

  Umn(C, B, B);

  Writeln;

  Output(C);

  Writeln('(A-B^2)=');
  Scalar(C, -1, C);
  Sum(C, A, C);
    

  Writeln;

  Output(C);

  Writeln;

  Writeln('(2*A)=');

  Scalar(D, 2, A);

  Writeln;

  Output(D);

  Writeln;

  Writeln('(2*A+B)=');

  Sum (D, D, B);

  Writeln;

  Output(D);

  Writeln;

  Writeln('(A-B^2)*(2*A+B)');

  Umn(C, C, D);

  Writeln;

  Output(C);

  readln
End.
