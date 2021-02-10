/*ident	"@(#)cls4:incl-master/proto-headers/generic.h	1.1" */

/*******************************************************************************

C++ source for the C++ Language System, Release 3.0.  This product
is a new release of the original cfront developed in the computer
science research center of AT&T Bell Laboratories.

Copyright (c) 1991 AT&T and UNIX System Laboratories, Inc.
Copyright (c) 1984, 1989, 1990 AT&T.  All Rights Reserved.

THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE of AT&T and UNIX System
Laboratories, Inc.  The copyright notice above doesnotevidence
any actual or intended publication of such source code.

*******************************************************************************/
#ifndef GENERICH

#define GENERICH 1

/* macros to paste tokens together to form new names */
/* 4.2BSD and System V cpp's have different mechanisms for
   pasting tokens together, but 4.3BSD agrees with System V.
   ANSI C has defined a new way.
*/

#ifdef __STDC__
/* ANSI C preprocessors willnotexpand the arguments to a macro;
 * so we need to add a level of indirection to allow macro expansion of
 * arguments.  (Reiser preprocessors allowed the first arg to be expanded;
 * this method will allow both to be expanded, which is better than none.)
 */
#define name2(a, b) _name2_aux(a, b)
#define _name2_aux(a, b) a##b
#define name3(a, b, c) _name3_aux(a, b, c)
#define _name3_aux(a, b, c) a##b##c
#define name4(a, b, c, d) _name4_aux(a, b, c, d)
#define _name4_aux(a, b, c, d) a##b##c##d

#else

#ifdef pyr
/*
 * Pyramid run SVR3, but its cpp uses the BSD4.2 version of argument pasting
 */
#define name2(a, b)                                                                                    \
    a\
b
#define name3(a, b, c)                                                                                 \
    a\
b\
c
#define name4(a, b, c, d)                                                                              \
    a\
b\
c\
d
#else
/*
 * Most non-ANSI cpps use the "null comment" method
 */
#define name2(a, b) a /**/ b
#define name3(a, b, c) a /**/ b /**/ c
#define name4(a, b, c, d) a /**/ b /**/ c /**/ d
#endif

#endif

#define declare(a, t) name2(a, declare)(t)
#define implement(a, t) name2(a, implement)(t)
#define declare2(a, t1, t2) name2(a, declare2)(t1, t2)
#define implement2(a, t1, t2) name2(a, implement2)(t1, t2)

extern int genericerror(int, char *);
typedef int (*GPT)(int, char *);
#define set_handler(generic, type, x) name4(set_, type, generic, _handler)(x)
#define errorhandler(generic, type) name3(type, generic, handler)
#define callerror(generic, type, a, b) (*errorhandler(generic, type))(a, b)
#endif
