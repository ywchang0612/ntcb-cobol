	ID		DIVISION.
	PROGRAM-ID.	S9456043.
	ENVIRONMENT	DIVISION.
	CONFIGURATION	SECTION.
	INPUT-OUTPUT	SECTION.
	FILE-CONTROL.
	    SELECT A-F ASSIGN TO RANDOM 'A.DAT'
		ORGANIZATION IS LINE SEQUENTIAL.
	    SELECT O-F ASSIGN TO RANDOM 'I.OUT'
		ORGANIZATION IS LINE SEQUENTIAL.
	DATA	DIVISION.
	FILE	SECTION.
	FD A-F.
	01 A-REC.
	   02 A-NO	PIC 9(03).
	   02 A-NM	PIC X(05).
	   02 A-CH	PIC 9(03).
	   02 A-EN	PIC X(03).
	FD O-F.
	01 O-REC	PIC X(40).
	WORKING-STORAGE	SECTION.
	77 EOF	PIC X VALUE 'N'.
	77 I	PIC 99.
	01 OUT-REC.
	   02 O-NO	PIC 9(03).
	   02 FILLER	PIC X(02).
	   02 O-NM	PIC X(05).
	   02 FILLER	PIC X(02).
	   02 O-SU	PIC 9(03).
	   02 FILLER	PIC X(02).
	   02 O-CH	PIC 9(03).
	   02 FILLER	PIC X(02).
	   02 O-EN	PIC 9(03).
	   02 FILLER	PIC X(02).
	   02 O-MK	PIC X.
	01 TABLE1.
	   02 FILLER	PIC X(7) VALUE '171200A'.
	   02 FILLER	PIC X(7) VALUE '166170B'.
	   02 FILLER	PIC X(7) VALUE '160165C'.
	   02 FILLER	PIC X(7) VALUE '156159D'.
	   02 FILLER	PIC X(7) VALUE '151155E'.
	   02 FILLER	PIC X(7) VALUE '000150F'.
	01 TABLE2 REDEFINES TABLE1.
	   02 AA OCCURS 6 TIMES.
	      03 SCR-L	PIC 9(03).
	      03 SCR-B	PIC 9(03).
	      03 SCR-M	PIC 9(01).
	PROCEDURE	DIVISION.
	0000-RTN.
	    OPEN INPUT  A-F
		 OUTPUT O-F.
	    READ A-F AT END MOVE 'Y' TO EOF.
	    PERFORM 0001-RTN UNTIL EOF = 'Y'.
	    CLOSE A-F O-F.
	    STOP RUN.
	0001-RTN.
	    MOVE A-NO TO O-NO.
	    MOVE A-NM TO O-NM.
	    MOVE A-CH TO O-CH.
	    MOVE A-EN TO O-EN.
	    COMPUTE O-SU = O-CH + O-EN.
	    PERFORM 0002-RTN VARYING I FROM 1 BY 1 UNTIL I > 6.
	    WRITE O-REC FROM OUT-REC.
	    READ A-F AT END MOVE 'Y' TO EOF.
	0002-RTN.
	    IF O-SU NOT < SCR-L(I) AND O-SU NOT > SCR-B(I)
	       MOVE SCR-M(I) TO O-MK
	    END-IF.