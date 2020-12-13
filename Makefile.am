SUBDIRS = 
DIST_SUBDIRS = 

DIR_DEBUG = $(srcdir)/Debug
DIR_RELEASE = $(srcdir)/Release
LIBDIR = $(srcdir)/Release/mono

SCIENCE_ASSEMBLY_PC = $(srcdir)/$(PACKAGE_NAME).pc

DIR_TEST = "$(srcdir)/Unit Tests"
NUNIT    = "$(srcdir)/Externals/NUnit/NUnit.Console-3.6.1/nunit3-console.exe"

LIBFILES = \
	$(LIBDIR)/Science.Vision.dll \
	$(LIBDIR)/Science.Video.Ximea.dll \
	$(LIBDIR)/Science.Video.VFW.dll \
	$(LIBDIR)/Science.Video.Kinect.dll \
	$(LIBDIR)/Science.Video.dll \
	$(LIBDIR)/Science.Video.DirectShow.dll \
	$(LIBDIR)/Science.Neuro.dll \
	$(LIBDIR)/Science.Math.dll \
	$(LIBDIR)/Science.Math.Core.dll \
	$(LIBDIR)/Science.MachineLearning.dll \
	$(LIBDIR)/Science.Text.dll \
	$(LIBDIR)/Science.IO.dll \
	$(LIBDIR)/Science.DataSets.dll \
	$(LIBDIR)/Science.Imaging.dll \
	$(LIBDIR)/Science.Genetic.dll \
	$(LIBDIR)/Science.Fuzzy.dll \
	$(LIBDIR)/Science.dll \
	$(LIBDIR)/Science.Controls.Vision.dll \
	$(LIBDIR)/Science.Controls.Imaging.dll \
	$(LIBDIR)/Science.Controls.Audio.dll \
	$(LIBDIR)/Science.Audition.dll \
	$(LIBDIR)/Science.Audio.dll 

TESTFILES = \
	${DIR_TEST}/Science.Tests.Controls/bin/mono/AnyCPU/Science.Tests.Controls.dll \
	${DIR_TEST}/Science.Tests.Core/bin/mono/AnyCPU/Science.Tests.Core.dll \
	${DIR_TEST}/Science.Tests.Imaging/bin/mono/AnyCPU/Science.Tests.Imaging.dll \
	${DIR_TEST}/Science.Tests.IO/bin/mono/AnyCPU/Science.Tests.IO.dll \
	${DIR_TEST}/Science.Tests.MachineLearning/bin/mono/AnyCPU/Science.Tests.MachineLearning.dll \
	${DIR_TEST}/Science.Tests.Math/bin/mono/AnyCPU/Science.Tests.Math.dll \
	${DIR_TEST}/Science.Tests.Neuro/bin/mono/AnyCPU/Science.Tests.Neuro.dll \
	${DIR_TEST}/Science.Tests.Vision/bin/mono/AnyCPU/Science.Tests.Vision.dll \
	${DIR_TEST}/Science.Tests.Statistics/bin/mono/AnyCPU/Science.Tests.Statistics.dll 


DEBUG_FILES = $(addsuffix .mdb, $(LIBFILES))
RELEASE_FILE = $(PACKAGE)-$(VERSION)


#magic automake variables
pkgconfigdir = $(LIBDIR)/pkgconfig
pkgconfig_DATA = $(SCIENCE_ASSEMBLY_PC)
#end



# target: all - Default target: build
all: build

# target: help - Display callable targets.
help:
	egrep "^# target:" Makefile | sed 's/^# target:/make/'

# target: build - Build Science.NET Framework
build: Sources/Science.NET.sln
	$(XBUILD) /p:Configuration=Mono Sources/Science.NET.sln

# target: samples - Build sample applications
samples: Samples/Samples.sln
	$(XBUILD) /p:Configuration=Mono /p:Platform=x86 Samples/Samples.sln

# target: docs - Build documentation
docs:
	mdoc update --lib=Release/mono/ --out=Docs/monodoc Release/mono/*.dll
	mdoc export-html -o htmldocs docfiles

# target: test - Run unit tests
# Notes:
#    Timeout: 30 min = 30 * 60 * 10000 = 1800000
#    First line runs as 64-bit, second line as 32-bits
#
test: build
	$(MONO) --runtime=v4.0 ${NUNIT} --labels=All --timeout=1800000 \
		--where "cat != Serialization && cat != Intensive && cat != WinForms && cat != Office && cat != MonoNotSupported && cat != Random" \
		${TESTFILES}
	$(MONO) --runtime=v4.0 ${NUNIT} --labels=All --timeout=1800000 --x86 \
		--where "cat != Serialization && cat != Intensive && cat != WinForms && cat != Office && cat != MonoNotSupported && cat != Random" \
		${TESTFILES}
		
test-reduced: build
	$(MONO) --runtime=v4.0 ${NUNIT} --labels=All --timeout=1800000 \
		--where "cat != Serialization && cat != Intensive && cat != WinForms && cat != Office && cat != MonoNotSupported && cat != Slow && cat != Random" \
		${TESTFILES}
	$(MONO) --runtime=v4.0 ${NUNIT} --labels=All --timeout=1800000 --x86 \
		--where "cat != Serialization && cat != Intensive && cat != WinForms && cat != Office && cat != MonoNotSupported && cat != Slow && cat != Random" \
		${TESTFILES}

# target: clean - remove all obj and bin directories
clean-local: 
	rm -rvf $(LIBDIR)/*
	rm -rvf $(DIR_RELEASE)/*
	rm -rvf $(DIR_DEBUG)/*
	find $(srcdir)/ -type d -name obj | xargs rm -rvf

maintainer-clean-local:
	rm -rf autom4te.cache

install-exec-local:
	mkdir -p $(DESTDIR)$(libdir)/$(PACKAGE)
	$(INSTALL_SCRIPT) -t $(DESTDIR)$(libdir)/$(PACKAGE)/ $(LIBFILES)

uninstall-local: 
	rm -rf $(DESTDIR)$(libdir)/$(PACKAGE)

MAINTAINERCLEANFILES = Makefile.in \
		       install-sh \
		       configure \
		       aclocal.m4 \
		       missing \
		       compile

.PHONY: install uninstall cleanbin cleanobj 
