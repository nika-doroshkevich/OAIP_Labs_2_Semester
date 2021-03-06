Program Lab_1_with_func;
{The program to perform operations on matrices.
(A-B^2)*(2*A+B). Matrices 3*3}

//Console application
{$APPTYPE CONSOLE}

//Declaration of constants
Const
  Razm=3;
  //Dimension of matrices

//Declaration of types
Type
  TMatrix = Array [1..Razm, 1..Razm] of Real;

//Declaration of varibles
Var
  A:TMatrix=((5,2,0),(10,4,1),(7,3,2));
  B:TMatrix=((3,6,-1),(-1,-2,0),(2,1,3));
  TempMatr1,TempMatr2:TMatrix;
  {A,B - Matrices
  TempMatr1,TempMatr2 - Matrices for ņalculations}

  //Subprogram for matrix outputing
  Function Output (X:TMatrix):String;
  Var
    i,j:Integer;
    S,Si:String;
    {i,j - Cycle counters
    and column and row values
    S,Si - Strings for output}

  Begin
    For i:=1 to Razm do
    Begin
      For j:=1 to Razm do
      Begin
        Str(X[i,j]:4:0,Si);
        S:=S+Si+' ';
      End;
      S:=S+Chr(10)+Chr(13);
    End;
    Output:=S;
  End;

  //Subprogram for matrix multiplicationing
  Function Multip (Matr1:TMatrix; Matr2:TMatrix):TMatrix;
  Var
    i,j,k:Integer;
    Rez:TMatrix;
    //i,j,k - Cycle counters
    //and column and row values

  Begin
    For i:=1 to Razm do
      For j:=1 to Razm do
      Begin
        Rez[i,j]:=0;
        For k:=1 to Razm do
          Rez[i,j]:= Rez[i,j] + Matr1[i,k]*Matr2[k,j];
        Multip:=Rez;
      End;
  End;

  //Subprogram for matrix additioning
  Function Sum (Matr1:TMatrix; Matr2:TMatrix):TMatrix;
  Var
    i,j:Integer;
    Rez:TMatrix;
    //i,j - Cycle counters
    //and column and row values

  Begin
    For i:=1 to Razm do
      For j:=1 to Razm do
        Rez[i,j]:=Matr1[i,j] + Matr2[i,j];
    Sum:=Rez;
  End;

  //Subprogram for matrix multiplicationing on number
  Function Scalar (Scal:Integer; Matr1:TMatrix):TMatrix;
  Var
    i,j:Integer;
    Rez:TMatrix;
    //i,j - Cycle counters
    //and column and row values
    
  Begin
    For i:=1 to Razm do
      For j:=1 to Razm do
        Rez[i,j]:= Scal * Matr1[i,j];
    Scalar:=Rez;
  End;

  Begin
    Writeln('(A-B^2)*(2*A+B):');
    Writeln('Matrix A:');
    Writeln(Output(A));

    Writeln;

    Writeln('Matrix B:');
    Writeln(Output(B));
    Writeln;

    TempMatr1:=Multip(B, B);
    TempMatr1:=Scalar(-1, TempMatr1);
    TempMatr1:=Sum(A, TempMatr1);
    TempMatr2:=Scalar(2, A);
    TempMatr2:=Sum(TempMatr2, B);
    TempMatr1:=Multip(TempMatr1, TempMatr2);

    Writeln('(A-B^2)*(2*A+B)=');
    Writeln(Output(TempMatr1));
    Readln
End.
