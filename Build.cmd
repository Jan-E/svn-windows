cd \svn\subversion-%svn_version%
python gen-make.py --release -t vcproj --vsnet-version=2017 --with-apr-util=C:\Apache24 --with-apr=C:\Apache24 --with-apr-iconv=C:\Apache24 --with-apr_memcache=C:\Apache24 --with-httpd=C:\Apache24 --with-openssl=C:\Apache24 --with-zlib=C:\Apache24 --with-sqlite=C:\Apache24

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
devenv subversion_vcnet.sln /Build "Release|x64"
