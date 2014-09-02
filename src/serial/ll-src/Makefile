# Makefile for MP-LABS (LL-2D-STD)
#
# make CMPR1=compiler CFLAGS1="comp flags" LFLAGS1="link flags" target
#
#
# Copyright 2008 Carlos Rosales Fernandez, David S. Whyte and IHPC (A*STAR).
#
# This file is part of MP-LABS.
#
# MP-LABS is free software: you can redistribute it and/or modify it under the
# terms of the GNU GPL version 3 or (at your option) any later version.
#
# MP-LABS is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# MP-LABS, in the file COPYING.txt. If not, see <http://www.gnu.org/licenses/>.


SHELL = /bin/sh

#Object files
OBJS   = common.o finaldump.o hydrodynamics.o init.o main.o memalloc.o \
         parameters.o poststream.o prestream.o stats.o vtkplane.o

#Link into an excutable
LL-2D-STD : $(OBJS); $(CMPR1) $(LFLAGS1) $(OBJS) -o LL-2D-STD

#Compile the common modules
common.o : common.f; $(CMPR1) $(CFLAGS1) common.f

#Compile the subroutines
main.o               : common.f finaldump.f hydrodynamics.f init.f memalloc.f \
                       parameters.f poststream.f prestream.f stats.f          \
                       vtkplane.f main.f; $(CMPR1) $(CFLAGS1) main.f
finaldump.o          : common.f finaldump.f; $(CMPR1) $(CFLAGS1) finaldump.f
hydrodynamics.o      : common.f hydrodynamics.f; $(CMPR1) $(CFLAGS1) hydrodynamics.f
init.o               : common.f stats.f vtkplane.f init.f; $(CMPR1) $(CFLAGS1) init.f
memalloc.o           : common.f memalloc.f; $(CMPR1) $(CFLAGS1) memalloc.f
parameters.o         : common.f parameters.f; $(CMPR1) $(CFLAGS1) parameters.f
poststream.o         : common.f poststream.f; $(CMPR1) $(CFLAGS1) poststream.f
prestream.o          : common.f prestream.f; $(CMPR1) $(CFLAGS1) prestream.f
stats.o              : common.f stats.f; $(CMPR1) $(CFLAGS1) stats.f
vtkplane.o           : common.f vtkplane.f; $(CMPR1) $(CFLAGS1) vtkplane.f


#Build options
all: LL-2D-STD

install:
	-mv ./LL-2D-STD ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean LL-2D-STD install

mrMonk:
	-mv ./LL-2D-STD ../../../bin
	-rm -f ./*.o ./*.mod

