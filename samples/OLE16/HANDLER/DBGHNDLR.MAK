ORIGIN		= Symantec C++
ORIGIN_VER	= Version 7.22
VERSION		= DEBUG

!IFDEF SUB_DEBUG
DEBUG		= $(SUB_DEBUG)
NDEBUG		= !$(SUB_DEBUG)
!ELSE
DEBUG		= 1
NDEBUG		= 0
!ENDIF

PROJ		= DBGHNDLR
APPTYPE		= WINDOWS DLL
PROJTYPE	= DLL

CC		= SC
CPP		= SPP
JAVAC		= sj
MAKE		= SMAKE
RC		= RCC
HC		= HC31
ASM		= SC
DISASM		= OBJ2ASM
LNK		= LINK
DLLS		= 

HEADERS		= stdafx.h ..\..\..\mfc\include\afxwin.h ..\..\..\mfc\include\16-bit\afxwin.h  \
		..\..\..\mfc\include\afx.h ..\..\..\mfc\include\16-bit\afx.h ..\..\..\mfc\include\afxver_.h ..\..\..\mfc\include\16-bit\afxver_.h  \
		..\..\..\include\tchar.h ..\..\..\include\string.h ..\..\..\include\stdio.h ..\..\..\include\stdlib.h  \
		..\..\..\include\time.h ..\..\..\include\windows.h ..\..\..\include\win16\WINDOWS.H ..\..\..\include\shellapi.h  \
		..\..\..\include\win16\shellapi.h ..\..\..\mfc\include\afxres.h ..\..\..\mfc\include\16-bit\afxres.h ..\..\..\mfc\include\afxcoll.h  \
		..\..\..\mfc\include\16-bit\afxcoll.h ..\..\..\include\print.h ..\..\..\include\win16\PRINT.H ..\..\..\mfc\include\afxmsg_.h  \
		..\..\..\mfc\include\16-bit\afxmsg_.h ..\..\..\mfc\include\afxdd_.h ..\..\..\mfc\include\16-bit\afxdd_.h ..\..\..\include\ole2.h  \
		..\..\..\include\win16\OLE2.H ..\..\..\include\compobj.h ..\..\..\include\win16\COMPOBJ.H ..\..\..\include\win16\scode.h  \
		..\..\..\include\win16\coguid.h ..\..\..\include\win16\oleguid.h ..\..\..\include\dvobj.h ..\..\..\include\win16\DVOBJ.H  \
		..\..\..\include\storage.h ..\..\..\include\win16\STORAGE.H ..\..\..\include\moniker.h ..\..\..\include\win16\MONIKER.H  \
		resource.h utils.h dbghndlr.h object.h  \
		classfct.h cdebug.h 

DEFFILE		= dbghndlr.def

!IF $(DEBUG)
OUTPUTDIR	= .
!IF EXIST (.)
CREATEOUTPUTDIR	=
!ELSE
CREATEOUTPUTDIR	= if not exist $(OUTPUTDIR)\*.* md $(OUTPUTDIR)
!ENDIF
TARGETDIR	= ..\bin
!IF EXIST (..\bin)
CREATETARGETDIR	=
!ELSE
CREATETARGETDIR	= if not exist $(TARGETDIR)\*.* md $(TARGETDIR)
!ENDIF

SYMROOT		=  .\stdafx 
SYMS		= $(SYMROOT).SYM 
LIBS		= LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDWD.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 

CFLAGS		=  -cpp -HO -mlw -C -WD -S -2 -a2 -c -H -w- -w2 -w6 -w7 -g 
LFLAGS		=  /CO /PAC:65530 /DE /PACKF /XU /A:16 /IMPL:$(TARGETDIR)\$$SCW$$.LIB /RC -k -31 :.\dbghndlr.RES
DEFINES		= -D_DEBUG=1 -D_WINDLL=1 -D_USRDLL=1
!ELSE
OUTPUTDIR	= .
!IF EXIST (.)
CREATEOUTPUTDIR	=
!ELSE
CREATEOUTPUTDIR	= if not exist $(OUTPUTDIR)\*.* md $(OUTPUTDIR)
!ENDIF
TARGETDIR	= ..\bin
!IF EXIST (..\bin)
CREATETARGETDIR	=
!ELSE
CREATETARGETDIR	= if not exist $(TARGETDIR)\*.* md $(TARGETDIR)
!ENDIF

SYMROOT		=  .\stdafx 
SYMS		= $(SYMROOT).SYM 
LIBS		= LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDW.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 

CFLAGS		=  -cpp -HO -mlw -C -o+time -WD -2 -a2 -c -H -w- -w2 -w6 -w7 
LFLAGS		=  /PAC:65530 /DE /PACKF /XU /A:16 /IMPL:$(TARGETDIR)\$$SCW$$.LIB /RC -k -31 :.\dbghndlr.RES
DEFINES		= -D_WINDLL=1 -D_USRDLL=1
!ENDIF

HFLAGS		= $(CFLAGS) 
MFLAGS		= MASTERPROJ=$(PROJ) 
LIBFLAGS	=  /C 
RESFLAGS	=  
DEBUGGERFLAGS	=  
AFLAGS		= $(CFLAGS) 
HELPFLAGS	= 

MODEL		= L

PAR		= PROJS BATS OBJS

RCDEFINES	= 

INCLUDES	= -I.

INCLUDEDOBJS	= 

OBJS		=  $(OUTPUTDIR)\cdebug.OBJ  $(OUTPUTDIR)\classfct.OBJ  $(OUTPUTDIR)\dbghndlr.OBJ  \
		 $(OUTPUTDIR)\object.OBJ  $(OUTPUTDIR)\stdafx.OBJ  $(OUTPUTDIR)\utils.OBJ 

RCFILES		= $(OUTPUTDIR)\dbghndlr.RES

RESFILES	= 

HELPFILES	= 

PROJS		= installr\installr.prj 

BATS		= 

PRECOMPILE	=  installr?Binstallr?Pprj 

POSTCOMPILE	= 

POSTLINK	=  movelib?Pbat 

.SUFFIXES: .C .CP .CPP .CXX .CC .H .HPP .HXX .COM .EXE .DLL .LIB .RTF .DLG .ASM .RES .RC .OBJ 

.C.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.c

.CPP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cpp

.CXX.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cxx

.CC.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cc

.CP.OBJ:
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.cp

.H.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o.\$(*B).sym $*.h

.HPP.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o.\$(*B).sym $*.hpp

.HXX.SYM:
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF -o.\$(*B).sym $*.hxx

.C.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)   $*.c   -o$*.lst

.CPP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cpp -o$*.lst

.CXX.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.cxx -o$*.lst

.CP.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cp  -o$*.lst

.CC.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES)  $*.cc  -o$*.lst

.ASM.EXP:
	$(CPP) $(CFLAGS) $(DEFINES) $(INCLUDES) $*.asm -o$*.lst

.OBJ.COD:
	$(DISASM) $*.OBJ -c

!IF $(DEBUG)
.OBJ.EXE:
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
.\cdebug.OBJ+
.\classfct.OBJ+
.\dbghndlr.OBJ+
.\object.OBJ+
.\stdafx.OBJ+
.\utils.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDWD.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 
dbghndlr.def;
<<
!ELSE
.OBJ.EXE:
		$(LNK) $(LFLAGS) @$(PROJ).LNK<<
.\stdafx.PCO+
.\cdebug.OBJ+
.\classfct.OBJ+
.\dbghndlr.OBJ+
.\object.OBJ+
.\stdafx.OBJ+
.\utils.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDW.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 
dbghndlr.def;
<<
!ENDIF

.RTF.HLP:
	$(HC) $(HELPFLAGS) $*.HPJ

.ASM.OBJ:
	$(ASM) $(AFLAGS) $(DEFINES) $(INCLUDES) -o$*.obj $*.asm

.RC.RES: 
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $*.rc -o$*.res

.DLG.RES:
	echo ^#include "windows.h" >$$$*.rc
	echo ^IF EXIST "$*.h" >>$$$*.rc
	echo ^#include "$*.h" >>$$$*.rc
	echo ^#include "$*.dlg" >>$$$*.rc
	$(RC) $(RCDEFINES) $(RESFLAGS) $(INCLUDES) $$$*.rc
	-del $*.res
	-ren $$$*.res $*.res



all:	noteout createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done


all2:	createdir $(PRECOMPILE) $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(POSTCOMPILE) $(TARGETDIR)\$(PROJ).$(PROJTYPE) $(POSTLINK) _done

noteout:
	REM Output to $(OUTPUTDIR)

createdir:
	$(CREATEOUTPUTDIR)
	$(CREATETARGETDIR)
	
$(TARGETDIR)\$(PROJ).$(PROJTYPE): $(SYMS) $(OBJS) $(INCLUDEDOBJS) $(RCFILES) $(RESFILES) $(HELPFILES) $(DEFFILE)
			-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
.\cdebug.OBJ+
.\classfct.OBJ+
.\dbghndlr.OBJ+
.\object.OBJ+
.\stdafx.OBJ+
.\utils.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDWD.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 
dbghndlr.def;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
.\cdebug.OBJ+
.\classfct.OBJ+
.\dbghndlr.OBJ+
.\object.OBJ+
.\stdafx.OBJ+
.\utils.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDW.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 
dbghndlr.def;
<<
!ENDIF

			-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)
			-del $(TARGETDIR)\$(PROJ).LIB
			-ren $(TARGETDIR)\$$SCW$$.LIB $(PROJ).LIB
			-echo $(TARGETDIR)\$(PROJ).$(PROJTYPE) built

_done:
		REM  Project is up to date

buildall:	clean	all


clean:
		-del $(TARGETDIR)\$$SCW$$.$(PROJTYPE)
		-del $(PROJ).CLE
		-del $(OUTPUTDIR)\SCPH.SYM
		-del DBGHNDLR.dpd
		-del $(OBJS)
		-del $(SYMROOT).SYM
		-del $(SYMROOT).PCO
		-del $(OUTPUTDIR)\dbghndlr.RES
		cd installr\.
		$(MAKE) -finstallr.mak $(MFLAGS) "SUB_DEBUG=$(DEBUG)" $@

cleanres:
		-del $(OUTPUTDIR)\dbghndlr.RES

res:		cleanres $(RCFILES) all


link:
!IF $(DEBUG)
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
.\cdebug.OBJ+
.\classfct.OBJ+
.\dbghndlr.OBJ+
.\object.OBJ+
.\stdafx.OBJ+
.\utils.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDWD.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 
dbghndlr.def;
<<
!ELSE
		$(LNK) $(LFLAGS) @<<$(PROJ).LNK
.\stdafx.PCO+
.\cdebug.OBJ+
.\classfct.OBJ+
.\dbghndlr.OBJ+
.\object.OBJ+
.\stdafx.OBJ+
.\utils.OBJ
..\bin\$$SCW$$.DLL
NUL
.\ LIBW.LIB COMMDLG.LIB SHELL.LIB LAFXDW.LIB OLE2.LIB OLECLI.LIB OLESVR.LIB SHELL.LIB OLE2DISP.LIB OLE2NLS.LIB COMPOBJ.LIB STORAGE.LIB TYPELIB.LIB  MFCOLEUI.LIB 
dbghndlr.def;
<<
!ENDIF

		-del $(TARGETDIR)\$(PROJ).$(PROJTYPE)
		-ren $(TARGETDIR)\$$SCW$$.$(PROJTYPE) $(PROJ).$(PROJTYPE)
			-del $(TARGETDIR)\$(PROJ).LIB
			-ren $(TARGETDIR)\$$SCW$$.LIB $(PROJ).LIB



installr?Binstallr?Pprj:
		cd installr\.
		$(MAKE) -finstallr.mak "SUB_DEBUG=$(DEBUG)"





movelib?Pbat:
		..\bin\movelib.bat 



!IF EXIST (DBGHNDLR.dpd)
!INCLUDE DBGHNDLR.dpd
!ENDIF



$(OUTPUTDIR)\cdebug.OBJ:	cdebug.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\cdebug.obj cdebug.cpp



$(OUTPUTDIR)\classfct.OBJ:	classfct.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\classfct.obj classfct.cpp



$(OUTPUTDIR)\dbghndlr.OBJ:	dbghndlr.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\dbghndlr.obj dbghndlr.cpp



$(OUTPUTDIR)\object.OBJ:	object.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\object.obj object.cpp



$(OUTPUTDIR)\stdafx.OBJ:	stdafx.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\stdafx.obj stdafx.cpp



$(OUTPUTDIR)\utils.OBJ:	utils.cpp
		$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -o$(OUTPUTDIR)\utils.obj utils.cpp



$(OUTPUTDIR)\dbghndlr.RES:	dbghndlr.rc
		$(RC) $(RESFLAGS) $(RCDEFINES) $(INCLUDES) -o$(OUTPUTDIR)\dbghndlr.res dbghndlr.rc


$(SYMROOT).SYM: stdafx.h
	$(CC) $(HFLAGS) $(DEFINES) $(INCLUDES) -HF$(SYMROOT).SYM -o$(SYMROOT).PCO stdafx.h



