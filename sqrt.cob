*> sqrt.cob: Babylonian square root calculator.
*> Author: Matthew Breckon
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
    *> Variables
    77 in-x pic s9(11)v9(6).
    77 x    pic 9(11)v9(6).
    77 y    pic 9(11)v9(6).
    77 y2   pic 9(11)v9(6).
    77 n    pic 9(11)v9(6).
    *> Message readouts
    01 title-line.
      02 filler pic x(9) value spaces.
      02 filler pic x(26) value 'Square Root Approximations'.
    01 under-line.
      02 filler pic x(45) value
        '---------------------------------------------'.
    01 under-line-2.
      02 filler pic x(20) value '--------------------'.
      02 filler pic x(5) value spaces.
      02 filler pic x(20) value '--------------------'.
    01 col-heads.
      02 filler pic x(8) value spaces.
      02 filler pic x(6) value 'Number'.
      02 filler pic x(15) value spaces.
      02 filler pic x(11) value 'Square Root'.
    01 print-line.
      02 filler pic x value space.
      02 out-x  pic z(11)9.9(6).
      02 filler pic x(6) value spaces.
      02 out-y  pic z(11)9.9(6).
    01 quit-msg.
      02 filler pic x(33) value
        'To quit, input a negative number.'.
    01 user-prompt.
      02 filler pic x(31) value
        'Input a value to be calculated:'.
    01 quit.
      02 filler pic x(54) value
        'Negative value: Exiting program.'.

procedure division.
  *> Open standard out
  open output standard-output.

  *> Prompt user for input
  header.
    write out-line from under-line.
    write out-line from title-line.
    write out-line from under-line.
    write out-line from quit-msg.
    
  *> Loop user input
  perform user-input thru read-out until in-x < 0.

  *> Close standard out and end program
  finish.
    close standard-output.
    stop run.

  *> Prompt user for input
  user-input.
    write out-line from user-prompt.
    accept in-x.
    *> Check if the user input is negative
    if in-x < 0 then
      write out-line from quit
      perform finish
      *> perform finish
    end-if.
    move in-x to x.

  *> Call to external square root module
  sqrt.
    call "sub-sqrt" using x, y.
    move x to out-x.
    move y to out-y.
    display out-x.

  *> Output results
  read-out.
    write out-line from under-line.
    write out-line from col-heads.
    write out-line from under-line-2.
    write out-line from print-line.
