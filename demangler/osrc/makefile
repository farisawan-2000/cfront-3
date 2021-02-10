# /*ident	"@(#)cls4:tools/demangler/osrc/makefile	1.3" */

###############################################################################
#
# C++ source for the C++ Language System, Release 3.0.  This product
# is a new release of the original cfront developed in the computer
# science research center of AT&T Bell Laboratories.
#
# Copyright (c) 1993  UNIX System Laboratories, Inc.
# Copyright (c) 1991, 1992  AT&T and UNIX System Laboratories, Inc.
# Copyright (c) 1984, 1989, 1990 AT&T.  All Rights Reserved.
#
# THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE of AT&T and UNIX System
#	
# Laboratories, Inc.  The copyright notice above doesnotevidence
# any actual or intended publication of such source code.
#
###############################################################################

# 
#  C++ Demangler Source Code
#  @(#)master	1.5
#  7/27/88 13:54:37
#
#BSD=1
CC = cc
CFLAGS = -O
TARGETS = dem c++filt errfilt libmangle.a

all: $(TARGETS)

OFILES= nplist.o String.o demangle.o args.o strtol.o

libmangle.a: $(OFILES)
	rm -f libmangle.a
	ar cr libmangle.a `lorder $(OFILES) | tsort`
	if test "$(BSD)" ; then ranlib libmangle.a; fi

dem: dem.o libmangle.a
	$(CC) $(CFLAGS) -o dem dem.o libmangle.a

c++filt: c++filt.o libmangle.a
	$(CC) $(CFLAGS) -o c++filt c++filt.o libmangle.a

errfilt: errfilt.c
	$(CC) $(CFLAGS) -o errfilt errfilt.c

clean:
	rm -f *.o libmangle.a

clobber: clean
	rm -f $(TARGETS)

cpio: dem.cpio
	cat files | cpio -ocvu > dem.cpio
