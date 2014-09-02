# Makefile for MP-LABS (LL-2D-DGR)
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
OBJS   = common.o finaldump.o hydrodynamics_g.o hydrodynamics_f.o init.o main.o\
         memalloc.o parameters.o poststream_g.o poststream_f.o prestream_g.o   \
         prestream_f.o update_f.o update_g.o stats.o vtkplane.o

#Link into an excutable
LL-2D-DGR : $(OBJS); $(CMPR1) $(LFLAGS1) $(OBJS) -o LL-2D-DGR

#Compile the common modules
common.o : common.f; $(CMPR1) $(CFLAGS1) common.f

#Compile the subroutines
main.o            : common.f finaldump.f hydrodynamics_g.f hydrodynamics_f.f \
                    init.f memalloc.f parameters.f poststream_g.f            \
                    poststream_f.f prestream_g.f prestream_f.f update_f.f    \
                    update_g.f stats.f vtkplane.f                            \
                    main.f; $(CMPR1) $(CFLAGS1) main.f
finaldump.o       : common.f finaldump.f; $(CMPR1) $(CFLAGS1) finaldump.f
hydrodynamics_g.o : common.f hydrodynamics_g.f; $(CMPR1) $(CFLAGS1) hydrodynamics_g.f
hydrodynamics_f.o : common.f hydrodynamics_f.f; $(CMPR1) $(CFLAGS1) hydrodynamics_f.f
init.o            : common.f stats.f vtkplane.f init.f; $(CMPR1) $(CFLAGS1) init.f
memalloc.o        : common.f memalloc.f; $(CMPR1) $(CFLAGS1) memalloc.f
parameters.o      : common.f parameters.f; $(CMPR1) $(CFLAGS1) parameters.f
poststream_g.o    : common.f poststream_g.f; $(CMPR1) $(CFLAGS1) poststream_g.f
poststream_f.o    : common.f poststream_f.f; $(CMPR1) $(CFLAGS1) poststream_f.f
prestream_g.o     : common.f prestream_g.f; $(CMPR1) $(CFLAGS1) prestream_g.f
prestream_f.o     : common.f prestream_f.f; $(CMPR1) $(CFLAGS1) prestream_f.f
stats.o           : common.f stats.f; $(CMPR1) $(CFLAGS1) stats.f
update_f.o        : common.f update_f.f; $(CMPR1) $(CFLAGS1) update_f.f
update_g.o        : common.f update_g.f; $(CMPR1) $(CFLAGS1) update_g.f
vtkplane.o        : common.f vtkplane.f; $(CMPR1) $(CFLAGS1) vtkplane.f


#Build options
all: LL-2D-DGR

install:
	-mv ./LL-2D-DGR ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean LL-2D-DGR install

mrMonk:
	-mv ./LL-2D-DGR ../../../bin
	-rm -f ./*.o ./*.mod
