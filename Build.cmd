
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

cd \downloads\zlib-%zlib_version%
nmake -f win32/Makefile.msc clean
nmake -f win32/Makefile.msc
copy *.lib \Apache24\lib
copy *.dll \Apache24\bin

set lib=C:\OpenSSL-v111-Win64\lib;\downloads\zlib-%zlib_version%;\Apache24\lib;%lib%
set include=C:\OpenSSL-v111-Win64\include;\downloads\zlib-%zlib_version%;\Apache24\include;%include%

cd \svn\subversion-%svn_version%
echo python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\OpenSSL-v111-Win64 --with-zlib=C:\Apache24 --with-sqlite=C:\downloads\sqlite-amalgamation-%sqlite_version%
python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\OpenSSL-v111-Win64 --with-zlib=C:\Apache24 --with-sqlite=C:\downloads\sqlite-amalgamation-%sqlite_version%
devenv subversion_vcnet.sln /Build "Release|x64" || exit 0
