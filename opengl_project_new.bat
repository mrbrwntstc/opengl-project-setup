@echo off
setlocal enabledelayedexpansion

xcopy /E /Q /EXCLUDE:xcopy_exclusion.txt %CD% %1
pushd %1

git init
git submodule add https://github.com/Microsoft/vcpkg.git

set "file=CMakeLists.txt"
set "tempfile=temp.txt"
set "search=${GAME_NAME}"
set "replace=%2"

(for /f "usebackq delims=" %%a in ("%file%") do (
    set "line=%%a"
    set "line=!line:%search%=%replace%!"
    echo !line!
)) > %tempfile%

del %file%
ren %tempfile% %file%

popd
