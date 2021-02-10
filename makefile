#ident	"@(#)cls4:src/makefile	1.7"
###############################################################################
#
# C++ source for the C++ Language System, Release 3.0.  This product
# is a new release of the original cfront developed in the computer
# science research center of AT&T Bell Laboratories.
#
# Copyright (c) 1993  UNIX System Laboratories, Inc.
# Copyright (c) 1991,1992   AT&T and UNIX System Laboratories, Inc.
# Copyright (c) 1984, 1989, 1990 AT&T.  All Rights Reserved.
#
# THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE of AT&T and UNIX System
#	
# Laboratories, Inc.  The copyright notice above doesnotevidence
# any actual or intended publication of such source code.
#
###############################################################################
CC	=	g++-7

IRIX_ROOT := ~/Desktop/indy/indy
YACC	=	qemu-irix -L $(IRIX_ROOT) $(IRIX_ROOT)/usr/bin/yacc
# YACC := yacc

#The ANSI_OUT option has been replaced by the +a1 and +a0 compilation options

#for systems which only recognize identifiers of up to 31 characters
#setting DENSE to -DDENSE causes cfront to generate internal names
#of 31 characters or less 
DENSE=

# The use of RETBUG is nolonger needed with version 2.0 and has been removed.
# RETBUG was used in 1.* Translator versions to circumvent a C compiler bug.

# Uncomment the next line and add -DLICENSE_MAN to the _int_CCFLAGS
# if you want to build a version of cfront that uses a license manager
#
# The LICENSE_LIBS line will change depending upon where your license
# library is located.

#LICENSE_LIBS=Location_of_your_library/libsdelic.a

SANITIZERS := null,undefined
# 			  address

# SANITIZE_CCFLAGS = -fsanitize=$(SANITIZERS)
# SANITIZE_LDFLAGS = -fsanitize=$(SANITIZERS)
_int_CCFLAGS=-Wall -Wpedantic -I. -std=c++17 -g -m32 -fno-for-scope -fno-operator-names

# top level makefile modifies the following
MPMACRO	= PATCH
MPFILE	= patch

BUILD_DIR = build

DUMMY != mkdir -p $(BUILD_DIR)

OFILES	:= alloc.o Bits.o block.o dcl.o dcl2.o dcl3.o dcl4.o \
		del.o discrim.o error.o expand.o \
		expr.o expr2.o expr3.o find.o hash.o lalex.o lex.o main.o \
		norm.o norm2.o print.o print2.o repr.o simpl.o \
		simpl2.o size.o table.o template.o tree_copy.o \
		tree_walk.o typ.o typ2.o y.tab.o 

O_FILES := $(foreach file,$(OFILES),$(BUILD_DIR)/$(file:.c=.o))

cfront:	$(O_FILES)
	$(CC) $(_int_CCFLAGS) $(SANITIZE_LDFLAGS) -o cfront $(O_FILES)

$(O_FILES):	cfront.h token.h typedef.h

y.tab.c:	gram.y
	$(YACC) gram.y

$(BUILD_DIR)/%.o: %.c
	$(CC) $(_int_CCFLAGS) -MMD -MP -MT $@ -MF $(BUILD_DIR)/$*.d -c $< -o $@

$(BUILD_DIR)/y.tab.o:	y.tab.c
	$(CC) -MMD -MP -MT $@ -MF $@.d -DGRAM $(_int_CCFLAGS) -c y.tab.c -o $@

clean:
	rm -f -r $(BUILD_DIR) y.tab.c

cpio:	
	find alloc.c Bits.c block.c dcl.c dcl2.c dcl3.c dcl4.c del.c discrim.c \
		error.c expand.c expr.c expr2.c expr3.c find.c hash.c \
		lalex.c lex.c main.c norm.c norm2.c print.c print2.c \
		repr.c simpl.c simpl2.c size.c table.c \
		template.c tree_copy.c tree_walk.c typ.c typ2.c \
		overload.h gram.y \
		Bits.h Block.h \
		cfront.h token.h size.h tqueue.h typedef.h yystype.h \
		hash.h node_classes.h \
		template.h tree_copy.h tree_walk.h \
		makefile -print | cpio -oc > cfront.cpio


print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
