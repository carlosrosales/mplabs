#!/bin/sh
#
# Makefile for MP-LABS.
#
# Change CC, MPICC and the corresponding flags to match your own compiler in
# file "Makefile.in". You should not have to edit this file at all.
#
# v1.2                                  (2013-09-10)  Carlos Rosales Fernandez

include ./Makefile.in

COPYRIGHT1="Copyright 2008 Carlos Rosales Fernandez, David S. Whyte and IHPC."
COPYRIGHT2="Copyright 2013 Carlos Rosales Fernandez, and UT Austin."
COPYRIGHT3="License: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>"
COPYRIGHT4="This is free software: you are free to change and redistribute it."
COPYRIGHT5="There is NO WARRANTY, to the extent permitted by law."

BUILD_LOG="`pwd`/mplabs_build.log"
INSTALL_LOG="`pwd`/mplabs_install.log"

SEPARATOR="======================================================================"
PKG      ="Package  : MP-LABS"
VER      ="Version  : 1.2"
DATE     ="Date     : `date +%Y.%m.%d`"
SYSTEM   ="System   : `uname -sr`"
COMPILER ="Compiler : `$(CC) --version | head -n 1`"

all: logs lbs3d seq par check-build
opt: logs lbs3d check-build
sequential: logs seq check-build
parallel: logs par check-build
install: opt-install seq-install par-install check-install

logs:
# Initialize the log files
	@touch $(BUILD_LOG)
	@touch $(INSTALL_LOG)

# Record the local conditions for the compilation
	@echo
	@echo $(SEPARATOR)  | tee $(BUILD_LOG)
	@echo $(PKG)        | tee -a $(BUILD_LOG)
	@echo $(VER)        | tee -a $(BUILD_LOG)
	@echo $(DATE)       | tee -a $(BUILD_LOG)
	@echo $(SYSTEM)     | tee -a $(BUILD_LOG)
	@echo $(COMPILER)   | tee -a $(BUILD_LOG)
	@echo $(SEPARATOR)  | tee -a $(BUILD_LOG)
	@echo $(COPYRIGHT1) | tee -a $(BUILD_LOG)
	@echo $(COPYRIGHT2) | tee -a $(BUILD_LOG)
	@echo $(COPYRIGHT3) | tee -a $(BUILD_LOG)
	@echo $(COPYRIGHT4) | tee -a $(BUILD_LOG)
	@echo $(COPYRIGHT5) | tee -a $(BUILD_LOG)
	@echo $(SEPARATOR)  | tee -a $(BUILD_LOG)
	@echo               | tee -a $(BUILD_LOG)

	@echo "Starting build..."                   | tee -a $(BUILD_LOG)
	@echo "Working Directory : `pwd`"           | tee -a $(BUILD_LOG)
	@echo "Build Type        : $(MPLABS_BUILD)" | tee -a $(BUILD_LOG)
	@echo                                       | tee -a $(BUILD_LOG)

lbs3d:
# LBS3D opt code
	@echo "Generating OMP binaries..." | tee -a $(BUILD_LOG)
	@$(MAKE) --directory=`pwd`/src/opt/lbs3d build |& tee -a $(BUILD_LOG)
	@echo                                          | tee -a $(BUILD_LOG)

opt-install:
# LBS3D install
	@echo "Installing OMP binaries..." | tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/opt/lbs3d install |& tee -a $(INSTALL_LOG)
	@echo                                            | tee -a $(INSTALL_LOG)

seq:
# All purely sequential code
	@echo "Generating Sequential binaries..." | tee -a $(BUILD_LOG)

	@$(MAKE) --directory=`pwd`/src/std/ll-dgr-seq build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/ll-seq build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/zsc-dgr-seq build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/zsc-seq build |& tee -a $(BUILD_LOG)
	@echo                               | tee -a $(BUILD_LOG)

seq-install:
# Install all sequential binaries
	@echo "Installing Sequential binaries..." | tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/ll-dgr-seq install  |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/ll-seq install      |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/zsc-dgr-seq install |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/zsc-seq install     |& tee -a $(INSTALL_LOG)
	@echo                                                  | tee -a $(INSTALL_LOG)

par:
# All MPI code
	@echo "Generating MPI binaries..." | tee -a $(BUILD_LOG)

	@$(MAKE) --directory=`pwd`/src/std/ll-dgr-mpi build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/ll-mpi build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/zsc-3d-mpi build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/zsc-dgr-mpi build |& tee -a $(BUILD_LOG)
	@echo

	@$(MAKE) --directory=`pwd`/src/std/zsc-mpi build |& tee -a $(BUILD_LOG)
	@echo                                   | tee -a $(BUILD_LOG)

par-install:
# Install all MPI parallel binaries
	@echo "Installing MPI binaries..."
	@$(MAKE) --directory=`pwd`/src/std/ll-dgr-mpi install  |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/ll-mpi install      |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/zsc-3d-mpi install  |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/zsc-dgr-mpi install |& tee -a $(INSTALL_LOG)
	@$(MAKE) --directory=`pwd`/src/std/zsc-mpi install     |& tee -a $(INSTALL_LOG)
	@echo                                                  | tee -a $(INSTALL_LOG)

clean:
# Cleanup all directories
	@$(MAKE) --directory=`pwd`/src/opt/lbs3d clean
	@$(MAKE) --directory=`pwd`/src/std/ll-dgr-seq clean
	@$(MAKE) --directory=`pwd`/src/std/ll-seq clean
	@$(MAKE) --directory=`pwd`/src/std/zsc-dgr-seq clean
	@$(MAKE) --directory=`pwd`/src/std/zsc-seq clean
	@$(MAKE) --directory=`pwd`/src/std/ll-dgr-mpi clean
	@$(MAKE) --directory=`pwd`/src/std/ll-mpi clean
	@$(MAKE) --directory=`pwd`/src/std/zsc-3d-mpi clean
	@$(MAKE) --directory=`pwd`/src/std/zsc-dgr-mpi clean
	@$(MAKE) --directory=`pwd`/src/std/zsc-mpi clean

check-build:
	@echo "Build completed. Check $(BUILD_LOG) for details."

check-install:
	@echo "Installation completed. Check $(INSTALL_LOG) for details."
