Program Lab_11;
{The program for calculating integrals}

//Console application
{$APPTYPE CONSOLE}

//Connecting modules
Uses
  SysUtils;

//Declaration of types
Type
  Func = Function (X: Real): Real;
  RectMethod = Function (F: Func; A, B: Real; NRect: Integer): Real;

Var
  Res: Real;

{$F+}
//Subprogram to calculate the first sub-integral function
Function Func1 (X: Real): Real;
{X - Value
Result - Parameter that returns the function value}

Begin
  Result := 1/Sqrt(X * X + 1);
End;

//Subprogram to calculate the second sub-integral function
Function Func2 (X: Real): Real;
{X - Value
Result - Parameter that returns the function value}

Begin
  Result := Cos(X)/(X + 1);
End;

//Subprogram to calculate right rectangles by the method
Function RightRect (F: Func; A, B: Real; NRect: Integer): Real;
Var
  Width, Sum: Real;
  i: Integer;
  {F - Function
  A - The first integration limit
  B - Second integration limit
  NRect - Number of rectangles
  Result - Parameter that returns the function value
  Width - The width of the rectangle
  Sum - Amount
  i - Loop parameter}

Begin
  Sum := 0;
  Width := (B-A)/NRect;
  For i:=1 to NRect do
    Sum := Sum + F(A + i * Width);
  Result := Width * Sum;
End;

//Subprogram to calculate centre rectangles by the method
Function CentreRect (F: Func; A, B: Real; NRect: Integer): Real;
Var
  Width, Sum: Real;
  i: Integer;
  {F - Function
  A - The first integration limit
  B - Second integration limit
  NRect - Number of rectangles
  Result - Parameter that returns the function value
  Width - The width of the rectangle
  Sum - Amount
  i - Loop parameter}

Begin
  Sum := 0;
  Width := (B-A)/NRect;
  For i:=1 to NRect do
    Sum := Sum + F(A + (2 * i - 1) * Width/2);
  Result := Width * Sum;
End;
{$F-}

//Subprogram for calculating integrals
Function CountInt (F: Func; A, B, Eps: Real; Method: RectMethod): Real;
Var
  NRect2: Integer;
  Res1, Res2: Real;
  {F - Function
  A - The first integration limit
  B - Second integration limit
  Eps - Accuracy of calculation
  Method - Method of calculation
  Result - Parameter that returns the function value
  NRect2 - Number of rectangles
  Res1 - Variable for loop organization
  Res2 - Variable for loop organization}

Begin
  NRect2 := 1;
  Res2 := Method(F, A, B, NRect2);
  Repeat
    Res1 := Res2;
    NRect2 := NRect2 * 2;
    Res2 := Method(F, A, B, NRect2);
  Until Abs(Res1 - Res2) < Eps;
  Result := Res2;
End;


Begin
  Writeln ('Integral 1:');
  Res := CountInt (Func1, 0.2, 1.2, 10E-4, RightRect);
  Writeln ('Right Rectangle; Eps = 10E-4: ',(Res):8:5);
  Writeln ('Right Rectangle; Eps = 10E-5: ',(CountInt (Func1, 0.2, 1.2, 10E-5, RightRect)):8:6);
  Writeln ('Centre Rectangle; Eps = 10E-4: ',(CountInt (Func1, 0.2, 1.2, 10E-4, CentreRect)):8:5);
  Writeln ('Centre Rectangle; Eps = 10E-5: ',(CountInt (Func1, 0.2, 1.2, 10E-5, CentreRect)):8:6);

  Writeln;
  Writeln ('Integral 2:');
  Writeln ('Right Rectangle; Eps = 10E-4: ',(CountInt (Func2, 0.6, 1.4, 10E-4, RightRect)):8:5);
  Writeln ('Right Rectangle; Eps = 10E-5: ',(CountInt (Func2, 0.6, 1.4, 10E-5, RightRect)):8:6);
  Writeln ('Centre Rectangle; Eps = 10E-4: ',(CountInt (Func2, 0.6, 1.4, 10E-4, CentreRect)):8:5);
  Writeln ('Centre Rectangle; Eps = 10E-5: ',(CountInt (Func2, 0.6, 1.4, 10E-5, CentreRect)):8:6);
  Readln
End.
