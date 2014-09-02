# Makefile for MP-LABS (ZSC-2D-DGR)
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
OBJS   = common.o collision_f.o collision_g.o differentials.o finaldump.o \
         init.o main.o memalloc.o parameters.o stats.o stream.o update.o  \
         vtkplane.o

#Link into an excutable
ZSC-2D-DGR : $(OBJS); $(CMPR1) $(LFLAGS1) $(OBJS) -o ZSC-2D-DGR

#Compile the common modules
common.o : common.f; $(CMPR1) $(CFLAGS1) common.f

#Compile the subroutines
main.o          : common.f collision_f.f collision_g.f differentials.f        \
                  finaldump.f init.f memalloc.f parameters.f stats.f stream.f \
                  update.f vtkplane.f main.f ; $(CMPR1) $(CFLAGS1) main.f
collision_f.o   : common.f collision_f.f; $(CMPR1) $(CFLAGS1) collision_f.f
collision_g.o   : common.f collision_g.f; $(CMPR1) $(CFLAGS1) collision_g.f
differentials.o : common.f differentials.f; $(CMPR1) $(CFLAGS1) differentials.f
finaldump.o     : common.f finaldump.f; $(CMPR1) $(CFLAGS1) finaldump.f
init.o          : common.f differentials.f stats.f vtkplane.f                 \
                  init.f; $(CMPR1) $(CFLAGS1) init.f
memalloc.o      : common.f memalloc.f; $(CMPR1) $(CFLAGS1) memalloc.f
parameters.o    : common.f parameters.f; $(CMPR1) $(CFLAGS1) parameters.f
stats.o         : common.f stats.f; $(CMPR1) $(CFLAGS1) stats.f
stream.o        : common.f stream.f; $(CMPR1) $(CFLAGS1) stream.f
update.o        : common.f differentials.f; $(CMPR1) $(CFLAGS1) update.f
vtkplane.o      : common.f vtkplane.f; $(CMPR1) $(CFLAGS1) vtkplane.f

# Make options
all: ZSC-2D-DGR

install:
	-mv ./ZSC-2D-DGR ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean ZSC-2D-DGR install

mrMonk:
	-mv ./ZSC-2D-DGR ../../../bin
	-rm -f ./*.o ./*.mod
