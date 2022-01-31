Program MinMax;
{The program to search for
the largest of the minimum distances}

//Console application
{$APPTYPE CONSOLE}

//Connecting modules
Uses
  SysUtils;

//Declaration of types
Type
  TPoint = Record
    X,Y: Real;
  End;

Type
  TArray = Array [1..10] of TPoint;

//Declaration of varibles
Var
  Mas: TArray;
  i: Integer;
  BordA, BordB: Real;
  Result: Real;
  {Mas - Array for coordinates
  i - Cycle parameter
  BordA, BordB - A and B borders
  Result - Varible for result}

//Subprogram for finding distance
Function Distance (Point: TPoint; X: Real):Real;
{Point - Coordinate
X - Varible for borders}

Begin
  Distance := Sqrt((Point.X-X)*(Point.X-X)+Point.Y*Point.Y);
End;

//Subprogram for finding max distance
Function MaxDist (Points: TArray; X: Real):Real;
Var
  i: Integer;
  Max: Real;
  {Points - Coordinate
  X - Varible for borders
  i - Cycle parameter
  Max - Max distance}

Begin
  Max := Distance(Points[1],X);
  For i:=2 to 10 do
    If Distance(Points[i],X) > Max then
      Max := Distance(Points[i],X);
  MaxDist := Max;
End;

//Subprogram for finding min distance
Function SearchMin (Points: TArray; BordA,BordB: Real):Real;
Var
  BordX1, BordX2: Real;
  Y1, Y2: Real;
  Eps, GoldenSection: Real;
  {Points - Coordinate
  BordA, BordB - A and B borders
  BordX1, BordX2 - 1 and 2 borders
  Y1, Y2 - Coordinates Y
  Eps - Accuracy
  GoldenSection - Golden section value}

Begin
  Eps := 10E-10;
  GoldenSection := 1.61803398874;
  Repeat
    BordX1 := BordB - (BordB - BordA)/GoldenSection;
    BordX2 := BordA + (BordB - BordA)/GoldenSection;
    Y1 := MaxDist (Points, BordX1);
    Y2 := MaxDist (Points, BordX2);
    If Y1 >= Y2 then
      BordA := BordX1
    Else
      BordB := BordX2;
  Until Abs(BordB - BordA) < Eps;

  SearchMin := (BordA + BordB)/2;
End;

//Main algorithm
Begin
  Writeln('Enter X and Y:');
  BordA := MaxInt;
  BordB := -MaxInt;
  For i:=1 to 10 do
  Begin
    Readln(Mas[i].X, Mas[i].Y);
    If BordA > Mas[i].X then
      BordA := Mas[i].X;
    If BordB < Mas[i].X then
      BordB := Mas[i].X;
  End;
  Result := SearchMin(Mas, BordA, BordB);
  Writeln('Largest of minimum distances:');
  Writeln(Result:10:5);
  Readln
End.
