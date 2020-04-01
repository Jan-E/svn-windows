@echo off

cd
cd \

echo Downloading %httpd_dist%
appveyor DownloadFile %httpd_dist%
echo extracting httpd to \Apache24
7z x -y %httpd_zip%
dir \Apache24\httpd.h /s

md \downloads
cd \downloads

echo Downloading https://www.openssl.org/source/openssl-%openssl_version%.tar.gz
appveyor DownloadFile https://www.openssl.org/source/openssl-%openssl_version%.tar.gz
7z x -y openssl-%openssl_version%.tar.gz
7z x -y openssl-%openssl_version%.tar

echo Downloading %sqlite_dist%
appveyor DownloadFile %sqlite_dist%
7z x -y "sqlite-amalgamation-%sqlite_version%.zip"

echo Downloading https://www.zlib.net/zlib-%zlib_version%.tar.gz
appveyor DownloadFile https://www.zlib.net/zlib-%zlib_version%.tar.gz
7z x -y zlib-%zlib_version%.tar.gz
7z x -y zlib-%zlib_version%.tar

echo Downloading https://github.com/libexpat/libexpat/releases/download/%expat_release%/expat-%expat_version%.tar.gz
appveyor DownloadFile https://github.com/libexpat/libexpat/releases/download/%expat_release%/expat-%expat_version%.tar.gz
7z x -y expat-%expat_version%.tar.gz
7z x -y expat-%expat_version%.tar
copy expat-%expat_version%\lib\*.h \Apache24\include /y > nul

cd \downloads
dir
copy zlib-%zlib_version%\*.h \Apache24\include > nul
xcopy openssl-%openssl_version%\include\openssl\*.h \Apache24\include\openssl\ /y > nul
copy sqlite-amalgamation-%sqlite_version%\*.* \Apache24\include /y > nul

cd \svn
echo Downloading https://downloads.apache.org/subversion/subversion-%svn_version%.tar.gz
appveyor DownloadFile https://downloads.apache.org/subversion/subversion-%svn_version%.tar.gz
7z x -y subversion-%svn_version%.tar.gz
7z x -y subversion-%svn_version%.tar

cd subversion-%svn_version%
dir

