@ECHO OFF

@REM Print introductory information

@REM Print opening menu

:OPENING_MENU

CALL ARTISTRY.BAT

@REM COLOR E4
CECHO {0D}MAIN MENU{\n}{#}
CECHO {0D}Please select an option:{\n}{#}
ECHO:
ECHO A. Iterative file renaming
ECHO B. Iterative folder renaming
@REM ECHO C. Preservica folder appended naming
ECHO C. Print help documentation (Recommended for first time users!)
ECHO D. Quit the program
ECHO:

@REM Allow user to select menu option

CHOICE /C abcd /N /M "Enter option: "
IF %ERRORLEVEL% EQU 1 ECHO: && SET Type=FILE && GOTO :NAMING
IF %ERRORLEVEL% EQU 2 ECHO: && SET Type=FOLDER && GOTO :NAMING
@REM IF %ERRORLEVEL% EQU 3 ECHO: && SET Type=APPEND && GOTO :FOLDER_APPEND
IF %ERRORLEVEL% EQU 3 (
    ECHO: && CALL HELP.BAT
    ECHO: && ECHO: && GOTO :OPENING_MENU)
IF %ERRORLEVEL% EQU 4 GOTO :EXIT

@REM Section for renaming files
:NAMING

CECHO {05}%Type%RENAMING{\n}{#} && ECHO:

IF %Type% EQU FILE (
    SET Suffix=+ '^)' + $_.Extension
    SET SuffixReplace=+ $_.Extension
    SET GCIArgument=-File
) ELSE (
    SET Suffix=+ '^)'
    SET SuffixReplace=
    SET GCIArgument=-Directory
)

:CHOOSE_DIRECTORY

@REM Get user input for the location of objects
SET /P Location=Input the directory containing the objects that are to be renamed (Copy and paste out of Windows Explorer): 

@REM Check if location exists
IF NOT EXIST "%Location%\" (
    ECHO Directory does not exist! Please enter a valid directory... && ECHO:
    GOTO :CHOOSE_DIRECTORY
)
IF %Type% EQU APPEND (
    GOTO :PS_FOLDER_APPEND
)
ECHO:

SET /P Catalogue=Input the root catalogue reference for the objects, without the numbering for each file (i.e. B1018.1, where objects will be B1018.1.1, B1018.1.2 etc. - Slashes will be replaced with dots by default): 
SET "Catalogue=%Catalogue:/=.%"
ECHO:

:CHOOSE_ITERATION

SET /P FirstIteration=Input the number from which you want to start iterative file naming (i.e. the first number in the series): 

IF 1%FirstIteration% NEQ +1%FirstIteration% (
    ECHO Please enter a number! If unsure, choose '1' to start numbering objects from 1... && ECHO:
    GOTO :CHOOSE_ITERATION
)

ECHO:
CHOICE /N /M "Would you like to preserve the original object names? If yes, the original names will be placed in brackets after the catalogue reference. (Y/N) "
IF %ERRORLEVEL% EQU 1 (
    ECHO: && <NUL SET /P "=Press any key to execute the renaming process..."
    PAUSE >NUL
    powershell "cd '%Location%'; $nr=%FirstIteration%; Get-ChildItem * %GCIArgument% | %%{Rename-Item $_ -NewName (('%Catalogue%.{0} (' + $_.BaseName %Suffix%) -f $nr++)}" && ECHO: && ECHO:
    CECHO {0A}Renaming process completed!{\n}{\n}{#}
)
IF %ERRORLEVEL% EQU 2 (
    ECHO: && <NUL SET /P "=Press any key to execute the renaming process..."
    PAUSE >NUL
    powershell "cd '%Location%'; $nr=%FirstIteration%; Get-ChildItem * %GCIArgument% | %%{Rename-Item $_ -NewName (('%Catalogue%.{0}' %SuffixReplace%) -f $nr++)}" && ECHO: && ECHO:
    CECHO {0A}Renaming process completed!{\n}{\n}{#}
)

GOTO :EXIT_MENU

@REM :FOLDER_APPEND

@REM CECHO {05}FOLDER SUFFIX APPENDMENT{\n}{#} && ECHO:

@REM GOTO :CHOOSE_DIRECTORY

@REM :PS_FOLDER_APPEND

@REM ECHO: && <NUL SET /P "=Press any key to execute the append process..."
@REM PAUSE >NUL
@REM powershell "cd '%Location%'; Get-ChildItem * -Directory | %%{Rename-Item $_ -NewName ($_.BaseName + '.DEL')}" && ECHO: && ECHO:
@REM CECHO {0A}Append process completed!{\n}{\n}{#}

@REM GOTO :EXIT_MENU

@REM Print exit menu

:EXIT_MENU

CECHO {0C}EXIT MENU{\n}{#}
CECHO {0C}Please select an option:{\n}{#}
ECHO:
ECHO A. Return to main menu
ECHO B. Quit the program
ECHO:

CHOICE /C ab /N /M "Enter option: "
IF %ERRORLEVEL% EQU 1 ECHO: && GOTO :OPENING_MENU
IF %ERRORLEVEL% EQU 2 GOTO :EXIT

@REM Allow user to select menu option

:EXIT