# Makefile for MP-LABS (LL-2D-DGR-MPI)
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
OBJS   = common.o finaldump.o hydrodynamics_g.o hydrodynamics_f.o init.o main.o\
         memalloc.o mpi_update_f.o mpi_update_g.o mpi_update_hydro.o           \
         mpi_update_rho_f.o mpi_update_rho_g.o parameters.o poststream_g.o     \
         poststream_f.o prestream_g.o prestream_f.o stats.o update_f.o         \
         update_g.o vgrid.o vtkplane.o

#Link into an excutable
LL-2D-DGR-MPI : $(OBJS); $(CMPR2) $(LFLAGS2) $(OBJS) -o LL-2D-DGR-MPI

#Compile the common modules
common.o : common.f; $(CMPR2) $(CFLAGS2) common.f

#Compile the subroutines
main.o                 : common.f finaldump.f hydrodynamics_g.f               \
                         hydrodynamics_f.f init.f memalloc.f mpi_update_f.f   \
                         mpi_update_g.f mpi_update_hydro.f mpi_update_rho_f.f \
                         mpi_update_rho_g.f parameters.f poststream_g.f       \
                         poststream_f.f prestream_g.f prestream_f.f stats.f   \
                         update_f.f update_g.f vgrid.f vtkplane.f             \
                         main.f; $(CMPR2) $(CFLAGS2) main.f
finaldump.o            : common.f finaldump.f; $(CMPR2) $(CFLAGS2) finaldump.f
hydrodynamics_g.o      : common.f hydrodynamics_g.f; $(CMPR2) $(CFLAGS2) hydrodynamics_g.f
hydrodynamics_f.o      : common.f hydrodynamics_f.f; $(CMPR2) $(CFLAGS2) hydrodynamics_f.f
init.o                 : common.f mpi_update_rho_g.f stats.f vtkplane.f       \
                         init.f; $(CMPR2) $(CFLAGS2) init.f
memalloc.o             : common.f memalloc.f; $(CMPR2) $(CFLAGS2) memalloc.f
mpi_update_f.o         : common.f mpi_update_f.f; $(CMPR2) $(CFLAGS2) mpi_update_f.f
mpi_update_g.o         : common.f mpi_update_g.f; $(CMPR2) $(CFLAGS2) mpi_update_g.f
mpi_update_hydro.o     : common.f mpi_update_hydro.f; $(CMPR2) $(CFLAGS2) mpi_update_hydro.f
mpi_update_rho_f.o     : common.f mpi_update_rho_f.f; $(CMPR2) $(CFLAGS2) mpi_update_rho_f.f
mpi_update_rho_g.o     : common.f mpi_update_rho_g.f; $(CMPR2) $(CFLAGS2) mpi_update_rho_g.f
parameters.o           : common.f parameters.f; $(CMPR2) $(CFLAGS2) parameters.f
poststream_g.o         : common.f poststream_g.f; $(CMPR2) $(CFLAGS2) poststream_g.f
poststream_f.o         : common.f poststream_f.f; $(CMPR2) $(CFLAGS2) poststream_f.f
prestream_g.o          : common.f prestream_g.f; $(CMPR2) $(CFLAGS2) prestream_g.f
prestream_f.o          : common.f prestream_f.f; $(CMPR2) $(CFLAGS2) prestream_f.f
stats.o                : common.f stats.f; $(CMPR2) $(CFLAGS2) stats.f
update_f.o             : common.f update_f.f; $(CMPR2) $(CFLAGS2) update_f.f
update_g.o             : common.f update_g.f; $(CMPR2) $(CFLAGS2) update_g.f
vgrid.o                : common.f vgrid.f; $(CMPR2) $(CFLAGS2) vgrid.f
vtkplane.o             : common.f vtkplane.f; $(CMPR2) $(CFLAGS2) vtkplane.f

#Build options
all: LL-2D-DGR-MPI

install:
	-mv ./LL-2D-DGR-MPI ../../../bin

clean:
	-rm -f ./*.o ./*.mod

build: clean LL-2D-DGR-MPI install

mrMonk:
	-mv ./LL-2D-DGR-MPI ../../../bin
	-rm -f ./*.o ./*.mod

