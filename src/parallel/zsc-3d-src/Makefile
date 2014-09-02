# Makefile for MP-LABS (ZSC-3D-STD-MPI)
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
OBJS   = common.o main.o collision.o collisionrelax.o finaldump.o init.o   \
         memalloc.o parameters.o postcollision.o poststream.o relaxstats.o \
         stats.o stream.o vgrid.o vtkdump.o

#Link into an excutable
ZSC-3D-STD-MPI : $(OBJS); $(CMPR2) $(LFLAGS2) $(OBJS) -o ZSC-3D-STD-MPI

#Compile the common modules
common.o : common.f; $(CMPR2) $(CFLAGS2) common.f

#Compile the subroutines
main.o           : main.f common.f collision.f collisionrelax.f finaldump.f    \
                   init.f memalloc.f parameters.f postcollision.f poststream.f \
                   relaxstats.f stats.f stream.f vgrid.f                       \
                   vtkdump.f; $(CMPR2) $(CFLAGS2) main.f
collision.o      : common.f collision.f; $(CMPR2) $(CFLAGS2) collision.f
collisionrelax.o : common.f collisionrelax.f; $(CMPR2) $(CFLAGS2) collisionrelax.f
finaldump.o      : common.f finaldump.f; $(CMPR2) $(CFLAGS2) finaldump.f
init.o           : common.f init.f stats.f vtkdump.f; $(CMPR2) $(CFLAGS2) init.f
memalloc.o       : common.f memalloc.f; $(CMPR2) $(CFLAGS2) memalloc.f
parameters.o     : common.f parameters.f; $(CMPR2) $(CFLAGS2) parameters.f
postcollision.o  : common.f postcollision.f; $(CMPR2) $(CFLAGS2) postcollision.f
poststream.o     : common.f poststream.f; $(CMPR2) $(CFLAGS2) poststream.f
relaxstats.o     : common.f relaxstats.f; $(CMPR2) $(CFLAGS2) relaxstats.f
stats.o          : common.f stats.f; $(CMPR2) $(CFLAGS2) stats.f
stream.o         : common.f stream.f; $(CMPR2) $(CFLAGS2) stream.f
vgrid.o          : common.f vgrid.f; $(CMPR2) $(CFLAGS2) vgrid.f
vtkdump.o        : common.f vtkdump.f; $(CMPR2) $(CFLAGS2) vtkdump.f

#Build options
all: ZSC-3D-STD-MPI

install:
	-mv ./ZSC-3D-STD-MPI ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean ZSC-3D-STD-MPI install

mrMonk:
	-mv ./ZSC-3D-STD-MPI ../../../bin
	-rm -f ./*.o ./*.mod

