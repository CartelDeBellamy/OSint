@ECHO OFF
::https://www.truepeoplesearch.com/results?name=Charlene%20Wiggins&citystatezip=Marianna,%20FL
::https://www.truepeoplesearch.com/resultphone?phoneno=(850)693-5942
::https://www.truepeoplesearch.com/resultaddress?streetaddress=2940%20Dogwood%20St&citystatezip=Marianna,%20FL
set prc=%%20%
:menu
cls
color b
title OSINT CLI
echo 1) People
echo.
echo 2) Phone
echo.
echo 3) Address
echo.
set /p menu=Enter Option---
if %menu% == 1 goto people
if %menu% == 2 goto phone
if %menu% == 3 goto address

cls
color 71
echo %menu% is not an option...
timeout -t 3 >nul
goto menu

:address
cls
title OSINT CLI (Addresses)
color e
set /p address=Enter Address # (3456)---
echo.
set /p addressname=Enter Address Name (Oakland)---
echo.
set /p roadtype=Enter Road Type (St, Dr, Cr)---
echo.
set /p city=Enter City---
echo.
set /p state=Enter State (FL, GA, IO, etc.)---
echo.

:addresscheck
cls
color 4
set /p acheck=Is %address% %addressname% %roadtype% %city% %state% correct? ( Y / N )
if %acheck% == Y goto scopingaddy
if %acheck% == y goto scopingaddy
if %acheck% == N goto address
if %acheck% == n goto address

:scopingaddy
cls
start https://www.truepeoplesearch.com/resultaddress?streetaddress=%address%%prc%%addressname%%prc%St^&citystatezip=%city%,%prc%%state%
goto menu

cls
color 71
echo %acheck% is not an option...
timeout -t 3 >nul
goto addresscheck

:phone
cls
title OSINT CLI (Phones #'s)
set /p areacode=Enter Area Code---
echo.
set /p middigits=Enter 3 Mid Digits---
echo.
set /p lastdigits=Enter Last 4 Digits---
echo.

:phonecheck
cls
color 4
set /p pcheck=Is (%areacode%)%middigits%-%lastdigits% correct? ( Y / N )---
if %pcheck% == Y goto scoping#
if %pcheck% == y goto scoping#
if %pcheck% == N goto phone
if %pcheck% == n goto phone

cls
color 71
echo %pcheck% is not an option...
timeout -t 3 >nul
goto phonecheck

:scoping#
title SCOPING /// (%areacode%)%middigits%-%lastdigits%
start https://www.truepeoplesearch.com/resultphone?phoneno^=(%areacode%)%middigits%-%lastdigits%
goto menu


:people
color e
title OSINT CLI (Persons)
cls
set /p name=Enter First Name or (E) to Exit---
if %name% == E goto menu
if %name% == e goto menu
ELSE goto ncheck

:ncheck
color 4
cls
set /p ncheck=Is %name% correct? ( Y / N )---
if %ncheck% == Y goto lastname
if %ncheck% == y goto lastname
if %ncheck% == N goto people
if %ncheck% == n goto people

cls
color 71
echo %ncheck% is not an option...
timeout -t 3 >nul
goto ncheck

:lastname
color e
cls
set /p namelast=Enter Last Name---

:lnamecheck
color 4
cls
set /p lncheck=Is %namelast% correct? ( Y / N )---
if %lncheck% == Y goto city
if %lncheck% == y goto city
if %lncheck% == N goto lastname
if %lncheck% == n goto lastname

cls
color 71
echo %lncheck% is not an option...
timeout -t 3 >nul
goto lnamecheck

:city
cls
color e
set /p city=Enter City---

:ccheck
cls
color 4
set /p ccheck=Is %city% correct? ( Y / N )---
if %ccheck% == Y goto state
if %ccheck% == y goto state
if %ccheck% == N goto city
if %ccheck% == n goto city

cls
color 71
echo %ccheck% is not an option...
timeout -t 3 >nul
goto ccheck

:state
cls
color e
set /p state=Enter 2 State Intials; THIS IS CASE SENSITIVE USE CAPS!!! ( FL, GA, IO, etc. )---

:scheck
cls
color 4
set /p scheck=Is %state% correct? ( Y / N )---
if %scheck% == Y goto OSINT
if %scheck% == y goto OSINT
if %scheck% == N goto state
if %scheck% == n goto state

cls
color 71
echo %ccheck% is not an option...
timeout -t 3 >nul
goto scheck

:OSINT
title SCOPING /// %name% /// %namelast% /// %city% /// %state%
start https://www.truepeoplesearch.com/results?name^=%name%%prc%%namelast%^&citystatezip^=%city%,%prc%%state%
goto menu