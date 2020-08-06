echo build.cmd

if "%vcversion%"=="vs16" if "%platform%"=="x64" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
if "%vcversion%"=="vs16" if "%platform%"=="x86" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"

if "%vcversion%"=="vc15" if "%platform%"=="x64" call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
if "%vcversion%"=="vc15" if "%platform%"=="x86" call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"

dir \downloads
if exist \downloads\zlib-%zlib_version% dir \downloads\zlib-%zlib_version%
dir \downloads\subversion-%svn_version%
if exist \downloads\subversion-%svn_version%\Release dir \downloads\subversion-%svn_version%\Release

if "%platform%"=="x64" set lib=C:\OpenSSL-v111-Win64\lib;\downloads\zlib-%zlib_version%\%platform%;\Apache24\lib;%lib%
if "%platform%"=="x64" set include=C:\OpenSSL-v111-Win64\include;\downloads\zlib-%zlib_version%;\Apache24\include;%include%

if "%platform%"=="x86" set lib=C:\OpenSSL-v111-Win32\lib;\downloads\zlib-%zlib_version%\%platform%;\Apache24\lib;%lib%
if "%platform%"=="x86" set include=C:\OpenSSL-v111-Win32\include;\downloads\zlib-%zlib_version%;\Apache24\include;%include%

cd \downloads\subversion-%svn_version%

if "%run_build%"=="no" exit 0

if "%platform%"=="x64" echo C:\Python27-x64\python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\OpenSSL-v111-Win64 --with-zlib=C:\Apache24 --with-sqlite=C:\downloads\sqlite-amalgamation-%sqlite_version% --with-jdk="C:\Program Files\Java\jdk9"
if "%platform%"=="x64" C:\Python27-x64\python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\OpenSSL-v111-Win64 --with-zlib=C:\Apache24 --with-sqlite=C:\downloads\sqlite-amalgamation-%sqlite_version% --with-jdk="C:\Program Files\Java\jdk9"
if "%run_tests%"=="no" if "%platform%"=="x64" devenv subversion_vcnet.sln /Clean "Release|x64" || exit 0
if "%run_tests%"=="no" if "%platform%"=="x64" devenv subversion_vcnet.sln /Clean "Release|Win32" || exit 0
if "%platform%"=="x64" devenv subversion_vcnet.sln /Build "Release|x64" || exit 0

if "%platform%"=="x86" echo C:\Python27\python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\OpenSSL-v111-Win32 --with-zlib=C:\Apache24 --with-sqlite=C:\downloads\sqlite-amalgamation-%sqlite_version% --with-jdk="C:\Program Files\Java\jdk9"
if "%platform%"=="x86" C:\Python27\python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\OpenSSL-v111-Win32 --with-zlib=C:\Apache24 --with-sqlite=C:\downloads\sqlite-amalgamation-%sqlite_version% --with-jdk="C:\Program Files\Java\jdk9"
if "%platform%"=="x86" devenv subversion_vcnet.sln /Clean "Release|x64" || exit 0
if "%platform%"=="x86" devenv subversion_vcnet.sln /Clean "Release|Win32" || exit 0
if "%platform%"=="x86" devenv subversion_vcnet.sln /Build "Release|Win32" || exit 0
