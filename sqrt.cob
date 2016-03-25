identification division.
program-id. babylonian-sqrt.

environment division.
input-output section.
file-control.
  select standard-output assign to display.

data division.
file section.
fd standard-output.
  01 out-line pic x(80).
working-storage section.
77 x    pic 9(11)v9(6).
77 y    pic 9(11)v9(6).
77 y2   pic 9(11)v9(6).
77 n    pic 9(11)v9(6).
01 in-card.
  02 in-x     pic s9(11)v9(6).
01 title-line.
  02 filler pic x(9) value spaces.
  02 filler pic x(26) value 'Square Root Approximations'.
01 under-line.
  02 filler pic x(45) value
    '---------------------------------------------'.
01 col-heads.
  02 filler pic x(8) value spaces.
  02 filler pic x(6) value 'Number'.
  02 filler pic x(15) value spaces.
  02 filler pic x(11) value 'Square Root'.
01 under-line-2.
  02 filler pic x(20) value '--------------------'.
  02 filler pic x(5) value spaces.
  02 filler pic x(20) value '--------------------'.
01 print-line.
  02 filler pic x value space.
  02 out-x  pic z(11)9.9(6).
  02 filler pic x(6) value spaces.
  02 out-y  pic z(11)9.9(6).
01 user-prompt.
  02 filler pic x(31) value
    'Input a value to be calculated:'.
01 error-neg.
  02 filler pic x(54) value
    'Cannot calculate the square root of a negative number.'.

procedure division.
open output standard-output.
user-input.
  write out-line from under-line.
  write out-line from title-line.
  write out-line from under-line.
  write out-line from user-prompt.
  accept x.
  if x < 0 then
    write out-line from error-neg
    stop run
  end-if.

sqrt.
  compute y = x / 2.0.
  compute y2 = y + 1.0.
  perform calc until y = y2.
  move x to out-x.
  move y to out-y.

read-out.
  write out-line from under-line.
  write out-line from col-heads.
  write out-line from under-line-2.
  write out-line from print-line.

finish.
  close standard-output.
  stop run.

calc.
  compute n = x / y.
  move y to y2.
  compute y = (y + n) / 2.0.
