md \svn\bin
md \svn\lib
md \svn\modules
cd \svn\subversion-%svn_version%
for /r %%f in (*.dll, *.exe) do @copy "%%f" \svn\bin /y
for /r %%f in (*.lib) do @copy "%%f" \svn\lib /y
for /r %%f in (*.so) do @copy "%%f" \svn\modules /y
cd \svn
7z a svn-%svn_version%-%vcversion%-%platform%.zip bin/* lib/* modules/*
