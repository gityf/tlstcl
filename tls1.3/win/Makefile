#
# $Header: /cvs/tcl/tls/win/Makefile,v 1.6 1999/09/26 21:46:38 matt Exp $
#
# Main settings
#
MODULE		= tls
VERSION		= 1.3
VSHORT		= 13

WINDIR		= ..\win
GENERICDIR	= ..\generic
COMPATDIR	= ..\compat
SCRIPTDIR	= ..\library
#
#
NODEBUG=1
!IF "$(NODEBUG)" == "0"
MODE		= Debug
DEBUG		= -Zi -DEBUG
DBGX		= d
!ELSE
MODE		= Release
DEBUG		= -Zi
DBGX		=
!ENDIF
#
TCL_VERSION	= 82
TCL_ROOT	= $(SYSTEMDRIVE)\tcl$(TCL_VERSION)
TCL_INCLUDE	= $(TCL_ROOT)\include
TCL_LIB		= $(TCL_ROOT)\lib
TCL_LIBRARY	= "$(TCL_LIB)\tcl$(TCL_VERSION)$(DBGX).lib" 

!IF $(TCL_VERSION) > 80
TCL_LIBRARY	= "$(TCL_LIB)\tclstub$(TCL_VERSION)$(DBGX).lib" 
TCL_FLAGS	= -DUSE_TCL_STUBS
!ENDIF

SSL_ROOT	= e:/openssl
SSL_LIBDIR	= $(SSL_ROOT)/lib
# Set to 0 to link against US/Patented openssl library
SSL_EXPORT	= 1
# Set to "" for dll linkage (as opposed to static)
SSL_STATIC	= s
# Uncomment if using a pre- 0.9.4 version of OpenSSL
#SSL_DEFINES	= -DPRE_OPENSSL_0_9_4

!IF $(SSL_EXPORT) == 1
SSL_DEFINES	= $(SSL_DEFINES) -DNO_PATENTS
SSL_SUFFIX	= $(SSL_STATIC)-export.lib
!ELSE
SSL_DEFINES	=
SSL_SUFFIX	= $(SSL_STATIC).lib
!ENDIF

SSL_FLAGS	= -I"$(SSL_ROOT)/include" $(SSL_DEFINES)
SSL_LIBS	= $(SSL_LIBDIR)/ssleay32$(SSL_SUFFIX) $(SSL_LIBDIR)/libeay32$(SSL_SUFFIX)

INSTALLDIR	= $(TCL_ROOT)
TMPDIR		= .\$(MODE)$(TCL_VERSION)
# Un-comment for debuging
#
#
#
T_DLL		= $(TMPDIR)\$(MODULE).dll
T_SCRIPT	= $(WINDIR)\pkgIndex.tcl
#
CORE_LIBS	= kernel32.lib user32.lib gdi32.lib ws2_32.lib
LIBS		= $(CORE_LIBS) $(TCL_LIBRARY) $(SSL_LIBS)
#
DEFINES		= -DWIN32 -DWIN32_LEAN_AND_MEAN -DL_ENDIAN -DBUILD_tls $(SSL_FLAGS) $(TCL_FLAGS)
CPPFLAGS	= -I"$(WINDIR)" -I"$(GENERICDIR)" -I"$(TCL_INCLUDE)" $(DEFINES)
CFLAGS		= $(DEBUG) $(CPPFLAGS) -GD -WX -nologo -MD$(DBGX) -Fo$(TMPDIR)\ -Fd$(TMPDIR)\$(MODULE).pdb
LDFLAGS		= $(CFLAGS) -LD

GENERIC_OBJS= \
	$(TMPDIR)\tls.obj \
	$(TMPDIR)\tlsX509.obj \
	$(TMPDIR)\tlsIO.obj \
	$(TMPDIR)\tlsBIO.obj


OBJS		= $(WIN_OBJS) $(GENERIC_OBJS) $(COMPAT_OBJS)
DEST		= $(INSTALLDIR)\lib\$(MODULE)

all:	setup $(T_DLL)

$(T_DLL):	$(OBJS)
	$(CC) $(LDFLAGS) $(LIBS) -o $(T_DLL) $(OBJS)

setup:
	@-mkd $(TMPDIR)

clean:
	@-rmd $(TMPDIR)

install:	all
	@-mkd "$(DEST)"
	copy $(T_DLL) "$(DEST)\$(MODULE)$(VSHORT)$(DBGX).dll"
	copy $(T_SCRIPT) "$(DEST)"
	copy "$(SCRIPTDIR)\tls.tcl" "$(DEST)"
	copy "..\tls.htm" "$(DEST)"

{$(WINDIR)}.c{$(TMPDIR)}.obj:
	$(CC) $(CFLAGS) -c -Fo$(TMPDIR)\ $<

{$(GENERICDIR)}.c{$(TMPDIR)}.obj:
	$(CC) $(CFLAGS) -c -Fo$(TMPDIR)\ $<

{$(COMPATDIR)}.c{$(TMPDIR)}.obj:
	$(CC) $(CFLAGS) -c -Fo$(TMPDIR)\ $<

$(OBJS): $(GENERICDIR)/tls.h $(GENERICDIR)/tlsInt.h
