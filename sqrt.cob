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
77 g    pic 9(11)v9(6).
77 g2   pic 9(11)v9(6).
77 n    pic 9(11)v9(6).
77 diff pic v9(5).
77 z    pic 9(11)v9(6).
77 k    pic s9999.
77 x    pic 9(11)v9(6).
77 y    pic 9(11)v9(6).
77 temp pic 9(11)v9(6).
01 in-card.
  02 in-z     pic s9(11)v9(6).
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
  02 out-z  pic z(11)9.9(6).
  02 filler pic x(5) value spaces.
  02 out-y  pic z(11)9.9(6).
01 error-mess.
  02 filler pic x value space.
  02 ot-z   pic -(11)9.9(6).
  02 filler pic x(21) value '        Invalid input'.
01 abort-mess.
  02 filler pic x value space.
  02 outp-z pic z(11)9.9(6).
  02 filler pic x(37) value
     ' Attempt aborted, too many iterations'.
01 user-prompt.
  02 filler pic x(31) value
    'Input a value to be calculated:'.

procedure division.
open output standard-output.
user-input.
  write out-line from title-line after advancing 0 lines.
  write out-line from user-prompt after advancing 1 lines.
  accept in-z.

sqrt.
  compute g = in-z / 2.0.
  compute g2 = g + 1.0.
  perform calc until g = g2.
  move in-z to out-z.
  move g to out-y.

header.
  write out-line from under-line.
  write out-line from col-heads.
  write out-line from under-line-2.
  write out-line from print-line.

finish.
  close standard-output.
  stop run.

calc.
  compute n = in-z / g.
  move g to g2.
  compute g = (g + n) / 2.0.
