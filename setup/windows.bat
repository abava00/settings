@echo off

rem set current dir
set work="%cd%"

rem set root dir
rem  C:%HOMEPATH%\aaaa       C:\Users\NAME\aaaa
set rootdir="C:%HOMEPATH%"

echo "多分管理者権限が必要になるかも"
echo "choice setting"
echo "a : all"
echo "n : neovim"
echo "v : vim"
echo "s : starship"
echo "h : help"
echo "u : update"

choice /CS /C  anvshu

if %errorlevel% == 1 (
  echo all setup
  call:func_all
  echo done!
  exit /b
)
if %errorlevel% == 2 (
  rem neovim
  echo done!
)
if %errorlevel% == 3 (
  echo vim setup
  call:func_vim
  echo done!
  exit /b
)
if %errorlevel% == 4 (
  rem starship
  echo done!
)
if %errorlevel% == 5 (
  rem help
  echo done!
)
if %errorlevel% == 6 (
  rem update
  echo done!
)





:func_all
  cd /D %work%

  cd /D %work%
exit /b

:func_neovim
exit /b

:func_vim
  cd /D %work%

  rem make vim file
  mkdir %rootdir%\nvimfiles
  mkdir %rootdir%\nvimfiles\plugin
  mkdir %rootdir%\nvimfiles\undodir
  
  rem make hardlink    mklink /H  lnk ..\vimfiles\origin
  rem Mabye, we can make hardlink when we exist in C drive
  rem if drive = C:
rem   mklink /H %rootdir%\nvimfiles\vimrc                 ..\vimfiles\vimrc
rem   mklink /H %rootdir%\nvimfiles\gvimrc                ..\vimfiles\gvimrc
rem   mklink /H %rootdir%\nvimfiles\vundlerc              ..\vimfiles\vundlerc
rem   mklink /H %rootdir%\nvimfiles\plugin\InThisWord.vim ..\vimfiles\plugin\InThisWord.vim
  rem when we in other drive make copy file,
  rem else:
rem   copy ..\vimfiles\vimrc                  %rootdir%\nvimfiles\vimrc                
rem   copy ..\vimfiles\gvimrc                 %rootdir%\nvimfiles\gvimrc               
rem   copy ..\vimfiles\vundlerc               %rootdir%\nvimfiles\vundlerc             
rem   copy ..\vimfiles\plugin\InThisWord.vim  %rootdir%\nvimfiles\plugin\InThisWord.vim
  
  cd /D %work%
exit /b

:func_starship
exit /b

:func_help
exit /b

:func_update
exit /b
