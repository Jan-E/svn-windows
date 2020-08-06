@echo off
echo install.cmd

cd \
echo Downloading %httpd_dist%
appveyor DownloadFile %httpd_dist%
echo extracting httpd to \Apache24
7z x -y %httpd_zip%
dir \Apache24\httpd.h /s

if not exist \downloads md \downloads
cd \downloads

if "%platform%"=="x64" C:\OpenSSL-v111-Win64\bin\openssl version
if "%platform%"=="x86" C:\OpenSSL-v111-Win32\bin\openssl version

echo Downloading %sqlite_dist%
if not exist sqlite-amalgamation-%sqlite_version%.zip appveyor DownloadFile %sqlite_dist%
7z x -y "sqlite-amalgamation-%sqlite_version%.zip"

if not exist expat-%expat_version%\lib\expat.h echo Downloading https://github.com/libexpat/libexpat/releases/download/%expat_release%/expat-%expat_version%.tar.gz
if not exist expat-%expat_version%\lib\expat.h appveyor DownloadFile https://github.com/libexpat/libexpat/releases/download/%expat_release%/expat-%expat_version%.tar.gz
if not exist expat-%expat_version%\lib\expat.h 7z x -y expat-%expat_version%.tar.gz
if not exist expat-%expat_version%\lib\expat.h 7z x -y expat-%expat_version%.tar
copy expat-%expat_version%\lib\*.h \Apache24\include /y

if not exist subversion-%svn_version%\gen-make.py echo Downloading https://downloads.apache.org/subversion/subversion-%svn_version%.tar.gz
if not exist subversion-%svn_version%\gen-make.py appveyor DownloadFile https://downloads.apache.org/subversion/subversion-%svn_version%.tar.gz
if not exist subversion-%svn_version%\gen-make.py 7z x -y subversion-%svn_version%.tar.gz
if not exist subversion-%svn_version%\gen-make.py 7z x -y subversion-%svn_version%.tar

dir \downloads
if exist \downloads\zlib-%zlib_version% dir \downloads\zlib-%zlib_version%
dir \downloads\subversion-%svn_version%
if exist \downloads\subversion-%svn_version%\Release dir \downloads\subversion-%svn_version%\Release
