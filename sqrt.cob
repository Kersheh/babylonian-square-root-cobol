identification division.
program-id. babylonian-sqrt.

environment division.
input-output section.
file-control.
  select input-file assign to "sqrt.dat"
  organization is line sequential.
  select standard-output assign to display.

data division.
file section.
fd input-file.
  01 standard-input pic x(80).
fd standard-output.
  01 out-line pic x(80).
working-storage section.
77 diff pic v9(5).
77 z    pic 9(11)v9(6).
77 k    pic s9999.
77 x    pic 9(11)v9(6).
77 y    pic 9(11)v9(6).
77 temp pic 9(11)v9(6).
01 in-card.
  02 in-z     pic s9(11)v9(6).
  02 in-diff  pic v9(5).
  02 filler   pic x(58).
01 title-line.
  02 filler pic x(9) value spaces.
  02 filler pic x(26) value 'Square Root Approximations'.
01 under-line.
  02 filler pic x(44) value
    '--------------------------------------------'.
01 col-heads.
  02 filler pic x(8) value spaces.
  02 filler pic x(6) value 'Number'.
  02 filler pic x(15) value spaces.
  02 filler pic x(11) value 'Square Root'.
01 underline-2.
  02 filler pic x(20) value ' -------------------'.
  02 filler pic x(5) value spaces.
  02 filler pic x(19) value '------------------'.
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

procedure division.
  open input input-file, output standard-output.
  write out-line from title-line after advancing 0 lines.
  write out-line from under-line after advancing 1 lines.
  write out-line from col-heads after advancing 1 line.
  write out-line from underline-2 after advancing 1 line.
s1.
  read input-file into in-card at end go to finish.
  if in-z is greater than zero go to b1.
  move in-z to ot-z.
  write out-line from error-mess after advancing 1 line.
  go to s1.
b1.
  move in-diff to diff.
  move in-z to z.
  divide 2 into z giving x rounded.
  perform s2 thru e2 varying k from 1 by 1
    until k is greater than 1000.
  move in-z to outp-z.
  write out-line from abort-mess after advancing 1 line.
  go to s1.
s2.
  compute y rounded = 0.5 * (x + z / x).
  subtract x from y giving temp.
  if temp is less than zero compute temp = - temp.
  if temp / (y + x) is greater than diff go to e2.
  move in-z to out-z.
  move y to out-y.
  write out-line from print-line after advancing 1 line.
  go to s1.
e2.
  move y to x.
finish.
  close input-file, standard-output.
stop run.
