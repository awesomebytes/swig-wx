#######################################################################
# $Header: /cvsroot/swig/SWIG/Examples/test-suite/cffi/Makefile.in,v 1.1 2006/01/14 13:36:28 mkoeppe Exp $
# Makefile for cffi test-suite
#######################################################################

LANGUAGE     = cffi
CFFI          = @CFFIBIN@
SCRIPTSUFFIX = _runme.lisp
srcdir       = .
top_srcdir   = ../../..
top_builddir = ../../../

include $(srcdir)/../common.mk

# no C++ tests for now
CPP_TEST_CASES =
#C_TEST_CASES += 

# Rules for the different types of tests
%.cpptest: 
	$(setup) \
	($(swig_and_compile_cpp); ) &&\
	$(run_testcase)

%.ctest:
	$(setup) \
	($(swig_and_compile_c); ) &&\
	$(run_testcase)

%.multicpptest: 
	$(setup) \
	($(swig_and_compile_multi_cpp); ) &&\
	$(run_testcase)

# Runs the testcase. A testcase is only run if
# a file is found which has _runme.lisp appended after the testcase name.
run_testcase = \
	if [ -f $(srcdir)/$(SCRIPTPREFIX)$*$(SCRIPTSUFFIX) ]; then (	  \
	  env LD_LIBRARY_PATH=.:$$LD_LIBRARY_PATH $(CFFIBIN) -batch -s $(srcdir)/$(SCRIPTPREFIX)$*$(SCRIPTSUFFIX);) \
	fi;

# Clean: (does nothing, we dont generate extra cffi code)
%.clean:


clean:
	$(MAKE) -f $(top_builddir)/$(EXAMPLES)/Makefile cffi_clean

