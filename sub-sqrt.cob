identification division.
  program-id. sub-sqrt.

environment division.

data division.
  working-storage section.
    77 y2   pic 9(11)v9(6).
    77 n    pic 9(11)v9(6).
  linkage section.
    77 x    pic 9(11)v9(6).
    77 y    pic 9(11)v9(6).

procedure division using x, y.
  *> Perform babylonian square root
  sqrt.
    compute y = x / 2.0.
    compute y2 = y + 1.0.
    perform calc until y = y2.
    goback.

  *> 'Function': Calculate recursive portion of babylonian square root
  calc.
    compute n = x / y.
    move y to y2.
    compute y = (y + n) / 2.0.
