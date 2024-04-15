pushd %USERPROFILE%

set PATH=C:/green/mintty/mintty-3.7.0/usr/bin;%PATH%;

mintty --exec cmd //k winpty -- powershell -NoExit -Command "chcp 65001 ; $PSDefaultParameterValues['*:Encoding'] = 'utf8'" 
