        IDENTIFICATION     DIVISION.
        PROGRAM-ID.        SAMPLE.

        ENVIRONMENT        DIVISION.
        CONFIGURATION      SECTION.
        SOURCE-COMPUTER.   IBM-PC.
        OBJECT-COMPUTER.   IBM-PC.

        DATA               DIVISION.
        WORKING-STORAGE    SECTION.
        01 A       PIC 9(6).
        01 B       PIC 9(6).
        01 C       PIC 9(6).
        01 I       PIC 9(6).
        01 S       PIC 9(6).
        01 N       PIC 9(6).
        01 Z       PIC 9(6).
        01 W       PIC X.

        PROCEDURE DIVISION.
        0000-RTN.
            PERFORM 0001-RTN UNTIL W = 'N'.
            STOP RUN.
        0001-RTN.
            DISPLAY 'START=?'  LINE 1 ERASE. 
            ACCEPT  A.
            DISPLAY 'END=?'    LINE 3.
            ACCEPT  B.
            DISPLAY 'INTER=?'  LINE 5.
            ACCEPT  C.
            COMPUTE I = C.
            COMPUTE N = A.
            COMPUTE Z = A + C.
            PERFORM 0002-RTN UNTIL N > B.
            DISPLAY S.
            DISPLAY ' '.
            DISPLAY 'CONTINUE? (Y/N)'.
            ACCEPT  W.
        0002-RTN.
            COMPUTE S = S + N.
            DISPLAY A '+' Z '+....+' N '=' S.
            COMPUTE N = N + I.
            