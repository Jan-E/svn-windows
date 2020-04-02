@echo off

cd \
echo Downloading %httpd_dist%
appveyor DownloadFile %httpd_dist%
echo extracting httpd to \Apache24
7z x -y %httpd_zip%
dir \Apache24\httpd.h /s

md \downloads
cd \downloads

if "%platform%"=="x64" C:\OpenSSL-v111-Win64\bin\openssl version
if "%platform%"=="x86" C:\OpenSSL-v111-Win32\bin\openssl version

echo Downloading %sqlite_dist%
appveyor DownloadFile %sqlite_dist%
7z x -y "sqlite-amalgamation-%sqlite_version%.zip"

echo Downloading https://www.zlib.net/zlib-%zlib_version%.tar.gz
appveyor DownloadFile https://www.zlib.net/zlib-%zlib_version%.tar.gz
7z x -y zlib-%zlib_version%.tar.gz
7z x -y zlib-%zlib_version%.tar
copy zlib-%zlib_version%\*.h \Apache24\include > nul

echo Downloading https://github.com/libexpat/libexpat/releases/download/%expat_release%/expat-%expat_version%.tar.gz
appveyor DownloadFile https://github.com/libexpat/libexpat/releases/download/%expat_release%/expat-%expat_version%.tar.gz
7z x -y expat-%expat_version%.tar.gz
7z x -y expat-%expat_version%.tar
copy expat-%expat_version%\lib\*.h \Apache24\include /y > nul

cd \svn
echo Downloading https://downloads.apache.org/subversion/subversion-%svn_version%.tar.gz
appveyor DownloadFile https://downloads.apache.org/subversion/subversion-%svn_version%.tar.gz
7z x -y subversion-%svn_version%.tar.gz
7z x -y subversion-%svn_version%.tar

dir

cd \svn\subversion-%svn_version%
dir
