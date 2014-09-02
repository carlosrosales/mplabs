#! /bin/sh
#
# Installation script for MP-LABS using gfortran and mpif90.
#
# Change CMPR1, CMPR2 and the corresponding flags to match your own compiler.
# Some examples of alternative compilers are:
#
# EKO Pathscale
# --------------
#  export CMPR1=pathf90
#  export CMPR2=mpif90
#  export CFLAGS1="-c -Wall -freeform -O3"
#  export CFLAGS2="-c -Wall -freeform -O3"
#  export LFLAGS1="-Wall -O3"
#  export LFLAGS2="-Wall -O3"
#
# Intel Compiler
# ---------------
#   export CMPR1=ifort
#   export CMPR2=ifort
#   export CFLAGS1="-c -Wall -free -O3"
#   export CFLAGS2="-c -Wall -free -O3 -lmpi"
#   export LFLAGS1="-Wall -O3"
#   export LFLAGS2="-Wall -O3 -lmpi"
#
# In some systems you may have to use mpiifort instead of ifort for CMPR2.
#
# IBM XLF
# -------
#  export CMPR1=xlf90_r
#  export CMPR2=mpxlf90_r
#  export CFLAGS1="-c -O3 -qstrict"
#  export CFLAGS2="-c -O3 -qstrict -lmpi"
#  export LFLAGS1="-O3 -qstrict"
#  export LFLAGS2="-O3 -qstrict -lmpi"
#
# To get the correct compiler version in the log file when using the IBM
# family of compilers you should also change --version by -qversion in line 68
# of this script.
#
# v1.0                                   (2008-07-08)  Carlos Rosales Fernandez

# Set the compilation flags depending on the input options
# GNU gfortran
export CMPR1=gfortran
export CMPR2=mpif90
export CFLAGS1="-c -Wall -ffree-form -O3"
export CFLAGS2="-c -Wall -ffree-form -O3"
export LFLAGS1="-Wall -O3"
export LFLAGS2="-Wall -O3"


# Arguments are same, so initialize the log file and the error file
LOG="./mplabs_install.log"
touch $LOG
ERR="./mplabs_install.err"
touch $ERR

# Record the local conditions for the compilation
MSG="======================================================================\n"
printf "$MSG" && printf "$MSG" > $LOG
MSG="Package  : MP-LABS\nVersion  : 1.0\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Date     : $(date +%d.%m.%Y)\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="System   : $(uname -sr)\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Compiler : $($CMPR1 --version | head -n 1)\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="======================================================================\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Copyright 2008 Carlos Rosales Fernandez, David S. Whyte and IHPC.\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="License: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="This is free software: you are free to change and redistribute it.\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="There is NO WARRANTY, to the extent permitted by law.\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="======================================================================\n\n"
printf "$MSG" && printf "$MSG" >> $LOG

# Get current directory
WORKDIR=$(pwd)

MSG="Starting installation...\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Working Directory : $WORKDIR\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Installation Type : $MPLABS_INSTALL\n\n"
printf "$MSG" && printf "$MSG" >> $LOG

# Installation of serial code
LOG="$WORKDIR/mplabs_install.log"
ERR="$WORKDIR/mplabs_install.err"
MSG="Generating serial binaries...\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Compiling with : $CMPR1 $CFLAGS1\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Linking with   : $CMPR1 $LFLAGS1\n\n"
printf "$MSG" && printf "$MSG" >> $LOG

MSG="Building LL-2D-DRG...  "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/serial/ll-dgr-src 2>> $ERR && make build 2>> $ERR \
&& make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding LL-2D-STD...  "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/serial/ll-src 2>> $ERR && make build 2>> $ERR \
&& make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding ZSC-2D-DGR... "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/serial/zsc-dgr-src 2>> $ERR && make build 2>> $ERR \
&& make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding ZSC-2D-STD... "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/serial/zsc-src 2>> $ERR && make build 2>> $ERR \
&& make clean 2>> $ERR || MSG="Failed."

printf "$MSG\n" && printf "$MSG\n" >> $LOG
cd $WORKDIR

# Installation of parallel code
LOG="$WORKDIR/mplabs_install.log"
ERR="$WORKDIR/mplabs_install.err"
MSG="\nGenerating parallel binaries...\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Compiling with : $CMPR2 $CFLAGS2\n"
printf "$MSG" && printf "$MSG" >> $LOG
MSG="Linking with   : $CMPR2 $LFLAGS2\n\n"
printf "$MSG" && printf "$MSG" >> $LOG

MSG="Building LL-2D-DGR-MPI...  "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/parallel/ll-dgr-src
make build 2>> $ERR && make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding LL-2D-STD-MPI...  "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/parallel/ll-src
make build 2>> $ERR && make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding ZSC-3D-STD-MPI... "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/parallel/zsc-3d-src
make build 2>> $ERR && make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding ZSC-2D-DGR-MPI... "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/parallel/zsc-dgr-src
make build 2>> $ERR && make clean 2>> $ERR || MSG="Failed."

MSG="$MSG\nBuilding ZSC-2D-STD-MPI... "
printf "$MSG\n" && printf "$MSG" >> $LOG
MSG="Done."
cd $WORKDIR/src/parallel/zsc-src
make build 2>> $ERR && make clean 2>> $ERR || MSG="Failed."

printf "$MSG\n" && printf "$MSG\n" >> $LOG
cd $WORKDIR


if test -s "$ERR"
then
  MSG="\n*** WARNING: Errors detected. Check mplabs_install.err. ***\n"
  printf "$MSG" && printf "$MSG" 1>> $LOG
  MSG="***          Installation may be incomplete.            ***\n\n"
  printf "$MSG" && printf "$MSG" 1>> $LOG
else
  MSG="\nMP-LABS v.10 installation completed successfully!\n\n"
  printf "$MSG" && printf "$MSG" 1>> $LOG
  printf "For details see mplabs_install.log.\n\n"
fi

MSG="======================================================================\n\n"
printf "$MSG" >> $LOG
