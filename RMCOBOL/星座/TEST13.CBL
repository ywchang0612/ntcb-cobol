        IDENTIFICATION DIVISION.
        PROGRAM-ID.    TEST13.
        AUTHOR.        S9456043.
        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        77 I PIC 99.
        77 B PIC 9(4).
        77 F PIC 99.
        77 WAIT PIC X.
        01 TABLE1.
           02 AA OCCURS 12 TIMES.
              05 FILLER PIC X(19) VALUE "12220119CAPRICORN".
              05 FILLER PIC X(19) VALUE "01200218AQUARIUS".
              05 FILLER PIC X(19) VALUE "02190320PISCES".
              05 FILLER PIC X(19) VALUE "03210419ARIES".
              05 FILLER PIC X(19) VALUE "04200520TAURUS".
              05 FILLER PIC X(19) VALUE "05210620GEMINI".
              05 FILLER PIC X(19) VALUE "06210722CANCER".
              05 FILLER PIC X(19) VALUE "07230822LEO".
              05 FILLER PIC X(19) VALUE "08230922VIROG".
              05 FILLER PIC X(19) VALUE "09231022LIBRA".
              05 FILLER PIC X(19) VALUE "10231121SCORPIO".
              05 FILLER PIC X(19) VALUE "11221221SAGITTARIUS".
        01 TABEL2 REDEFINES TABLE1.
           02 AB OCCURS 12 TIMES.
              05 ZODIC-B PIC 9(4).
              05 ZODIC-E PIC 9(4).
              05 ZODIC-N PIC X(11).

        PROCEDURE DIVISION.

        0000.
            DISPLAY " " LINE 1 POSITION 1 ERASE.
            DISPLAY "Please keyin your birthday" LINE 10 POSITION 15.
            DISPLAY "(SAMPLE:0101)" LINE 11 POSITION 15.
            ACCEPT B NO BEEP LINE 12 POSITION 15.

            PERFORM 2000 VARYING I FROM 2 BY 1 UNTIL I > 12.
            PERFORM 3000 UNTIL F = 27.
            STOP RUN.
        2000.
            IF B NOT < ZODIC-B(I) AND B NOT > ZODIC-E(I)
               DISPLAY ZODIC-N(I) LINE 18 POSITION 15
               PERFORM 3000
            ELSE
               DISPLAY ZODIC-N(1) LINE 18 POSITION 15
            END-IF.

        3000.
            DISPLAY "CONTINUE?(ESC = EXIT , PRESS ANY KEY CAN CONTINUE)"
            LINE 22 POSITION 15.
            ACCEPT WAIT NO BEEP ON EXCEPTION F NEXT SENTENCE.
            IF F NOT = 27
               GO TO 0000
            END-IF.