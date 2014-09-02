# Makefile for MP-LABS (LL-2D-STD-MPI)
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
OBJS   = common.o finaldump.o hydrodynamics.o init.o main.o memalloc.o \
         parameters.o poststream.o prestream.o stats.o mpi_updatefg.o  \
        mpi_updaterho.o vgrid.o vtkplane.o

#Link into an excutable
LL-2D-STD-MPI : $(OBJS); $(CMPR2) $(LFLAGS2) $(OBJS) -o LL-2D-STD-MPI

#Compile the common modules
common.o : common.f; $(CMPR2) $(CFLAGS2) common.f

#Compile the subroutines
main.o               : common.f finaldump.f hydrodynamics.f init.f memalloc.f \
                       parameters.f poststream.f prestream.f stats.f          \
                       mpi_updatefg.f mpi_updaterho.f vgrid.f vtkplane.f      \
                       main.f; $(CMPR2) $(CFLAGS2) main.f
finaldump.o          : common.f finaldump.f; $(CMPR2) $(CFLAGS2) finaldump.f
hydrodynamics.o      : common.f hydrodynamics.f; $(CMPR2) $(CFLAGS2) hydrodynamics.f
init.o               : common.f stats.f vtkplane.f init.f; $(CMPR2) $(CFLAGS2) init.f
memalloc.o           : common.f memalloc.f; $(CMPR2) $(CFLAGS2) memalloc.f
parameters.o         : common.f parameters.f; $(CMPR2) $(CFLAGS2) parameters.f
poststream.o         : common.f poststream.f; $(CMPR2) $(CFLAGS2) poststream.f
prestream.o          : common.f prestream.f; $(CMPR2) $(CFLAGS2) prestream.f
stats.o              : common.f stats.f; $(CMPR2) $(CFLAGS2) stats.f
mpi_updatefg.o       : common.f mpi_updatefg.f; $(CMPR2) $(CFLAGS2) mpi_updatefg.f
mpi_updaterho.o      : common.f mpi_updaterho.f; $(CMPR2) $(CFLAGS2) mpi_updaterho.f
vgrid.o              : common.f vgrid.f; $(CMPR2) $(CFLAGS2) vgrid.f
vtkplane.o           : common.f vtkplane.f; $(CMPR2) $(CFLAGS2) vtkplane.f

#Build oprions
all: LL-2D-STD-MPI

install:
	-mv ./LL-2D-STD-MPI ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean LL-2D-STD-MPI install

mrMonk:
	-mv ./LL-2D-STD-MPI ../../../bin
	-rm -f ./*.o ./*.mod
