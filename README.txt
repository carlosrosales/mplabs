=== mplabs v1.2===

Multiphase Lattice Boltzmann Suite.
Released under GPLv3 (see file COPYING.txt).

=== INSTALLATION ===

A full installation requires working versions of:

 * A fortran compiler
 * An MPI library
 * make

Make sure to set the correct compiler, compiler options, and installation 
directory in Makefile.in before trying to build MP-LABS 

To install only the optimized LBS3D code type:

$ make opt
$ make opt-install

To install everything type:

$ make
$ make install


=== CHANGELOG ===

Revision 1.2: (2013-09-10) Optimized version added.
              * Optimized version of ZSC-3D model added - LBS3D
              * Divided src directory into optimized and standard
              * New installation procedure using Make instad of shell script

Revision 1.1: (2008-11-10) Bugfix.
              * Periodic boundary conditions fixed for parallel
                dual grid implementations.

Revision 1.0: (2008-06-15) First public release of mplabs

2013-09-10 Carlos Rosales Fernandez
