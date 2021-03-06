Program Lab_6;
{The program to perform operations on matrices.
(A-B^2)*(2*A+B). Matrices 3*3}

//Console application
{$APPTYPE CONSOLE}

//Declaration of types
Type
  TMatrix = Array [1..3, 1..3] of Real;

//Declaration of varibles
Var
  A:TMatrix=((5,2,0),(10,4,1),(7,3,2));
  B:TMatrix=((3,6,-1),(-1,-2,0),(2,1,3));
  TempMatr1,TempMatr2:TMatrix;
  TempMatr3:TMatrix Absolute TempMatr1;
  {A,B - Matrices
  TempMatr1,TempMatr2 - Matrices for calculations}

//Subprogram for matrix outputing
Procedure Output (Const X:TMatrix);
Var
  i,j:Integer;
  //i,j - Cycle counters
  //and column and row values

Begin
  For i:=1 to 3 do
  Begin
    For j:=1 to 3 do
      Write(X[i,j]:4:0,' ');
    Writeln;
  End;
End;

//Subprogram for matrix multiplicationing
Procedure Multip (Var Rez:TMatrix; Matr1:TMatrix; Matr2:TMatrix);
Var
  i,j,k:Integer;
  //i,j,k - Cycle counters
  //and column and row values

Begin
  For i:=1 to 3 do
    For j:=1 to 3 do
    Begin
      Rez[i,j]:=0;
      For k:=1 to 3 do
        Rez[i,j]:= Rez[i,j] + Matr1[i,k]*Matr2[k,j];
    End;
End;

//Subprogram for matrix additioning
Procedure Sum (Var Result; Const Matr1,Matr2:TMatrix);
Var
  i,j:Integer;
  Rez: TMatrix Absolute Result; {Veriable overlay Rez on Result}
  {Result - Parameter without type
  Matr1,Matr2 - Matrices for calculations
  i,j - Cycle counters and column and row values
  Rez - Veriable that overlay on Result}

Begin
  For i:=1 to 3 do
    For j:=1 to 3 do
      Rez[i,j]:=Matr1[i,j] + Matr2[i,j];
End;

//Subprogram for matrix multiplicationing on number
Procedure Scalar (Var Rez:TMatrix; Scal:Integer; Const Matr1:TMatrix);
Var
  i,j:Integer;
  //i,j - Cycle counters
  //and column and row values

Begin
  For i:=1 to 3 do
    For j:=1 to 3 do
      Rez[i,j]:= Scal * Matr1[i,j];
End;

Begin
  Writeln('(A-B^2)*(2*A+B):');
  Writeln('Matrix A:');
  Output(A);

  Writeln;

  Writeln('Matrix B:');
  Output(B);
  Writeln;

  Multip(TempMatr1, B, B);
  Scalar(TempMatr1, -1, TempMatr1);
  Sum(TempMatr1, A, TempMatr3);
  Scalar(TempMatr2, 2, A);
  Sum (TempMatr2, TempMatr2, B);
  Multip(TempMatr3, TempMatr3, TempMatr2);

  Writeln('(A-B^2)*(2*A+B)=');
  Output(TempMatr1);
  Readln
End. 
 
