md \svn\bin
md \svn\lib
md \svn\modules
cd \downloads\subversion-%svn_version%
for /r %%f in (*.dll, *.exe) do @copy "%%f" \svn\bin /y
for /r %%f in (*.lib) do @copy "%%f" \svn\lib /y
for /r %%f in (*.so) do @copy "%%f" \svn\modules /y
cd \svn
if "%platform%"=="x64" copy C:\OpenSSL-v111-Win64\lib*x64.dll \svn\bin\ /y
if "%platform%"=="x86" del \svn\bin\lib*x64.dll
copy \Apache24\bin\libapr*.dll \svn\bin\ /y
copy \Apache24\lib\libapr*.lib \svn\lib\ /y
7z a svn-%svn_version%-%vcversion%-%platform%.zip bin/* lib/* modules/*
cd \svn\bin
svn --version || exit 0
