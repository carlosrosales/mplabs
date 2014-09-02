# Makefile for MP-LABS (ZSC-2D-DGR-MPI)
#
# make CMPR2=compiler CFLAGS2="comp flags" LFLAGS2="link flags" target
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
         init.o main.o memalloc.o parameters.o postcollision_f.o          \
         postcollision_g.o poststream_f.o stats.o stream.o update.o       \
         vgrid.o vtkplane.o

#Link into an excutable
ZSC-2D-DGR-MPI : $(OBJS); $(CMPR2) $(LFLAGS2) $(OBJS) -o ZSC-2D-DGR-MPI

#Compile the common modules
common.o : common.f; $(CMPR2) $(CFLAGS2) common.f

#Compile the subroutines
main.o           : common.f collision_f.f collision_g.f differentials.f        \
                   finaldump.f init.f memalloc.f parameters.f postcollision_f.f\
                   postcollision_g.f poststream_f.f stats.f stream.f update.f  \
                   vgrid.f vtkplane.f main.f ; $(CMPR2) $(CFLAGS2) main.f
collision_f.o    : common.f collision_f.f; $(CMPR2) $(CFLAGS2) collision_f.f
collision_g.o    : common.f collision_g.f; $(CMPR2) $(CFLAGS2) collision_g.f
differentials.o  : common.f differentials.f; $(CMPR2) $(CFLAGS2) differentials.f
finaldump.o      : common.f finaldump.f; $(CMPR2) $(CFLAGS2) finaldump.f
init.o           : common.f differentials.f stats.f vtkplane.f                 \
                   init.f; $(CMPR2) $(CFLAGS2) init.f
memalloc.o       : common.f memalloc.f; $(CMPR2) $(CFLAGS2) memalloc.f
parameters.o     : common.f parameters.f; $(CMPR2) $(CFLAGS2) parameters.f
postcollision_f.o: common.f postcollision_f.f; $(CMPR2) $(CFLAGS2) postcollision_f.f
postcollision_g.o: common.f postcollision_g.f; $(CMPR2) $(CFLAGS2) postcollision_g.f
poststream_f.o   : common.f poststream_f.f; $(CMPR2) $(CFLAGS2) poststream_f.f
stats.o          : common.f stats.f; $(CMPR2) $(CFLAGS2) stats.f
stream.o         : common.f stream.f; $(CMPR2) $(CFLAGS2) stream.f
update.o         : common.f differentials.f; $(CMPR2) $(CFLAGS2) update.f
vgrid.o          : common.f vgrid.f; $(CMPR2) $(CFLAGS2) vgrid.f
vtkplane.o       : common.f vtkplane.f; $(CMPR2) $(CFLAGS2) vtkplane.f

#Make build options
all: ZSC-2D-DGR-MPI

install:
	-mv ./ZSC-2D-DGR-MPI ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean ZSC-2D-DGR-MPI install

mrMonk:
	-mv ./ZSC-2D-DGR-MPI ../../../bin
	-rm -f ./*.o ./*.mod

