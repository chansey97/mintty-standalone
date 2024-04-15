pushd %USERPROFILE%

set PATH=C:/green/mintty/mintty-3.7.0/usr/bin;%PATH%;

mintty --exec cmd "/k winpty -- cmd /k chcp 65001" 