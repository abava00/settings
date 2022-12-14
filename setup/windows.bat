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

echo %TEMP%

choice /CS /C  anvshu

if %errorlevel% == 1 (
  echo all setup
  call:func_all
  echo done!
  exit /b
)
if %errorlevel% == 2 (
  echo neovim setup
  call:func_neovim
  echo done!
  exit /b
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
  cd /D %work%

  rem make nvim dir
  mkdir %LOCALAPPDATA%\nvim\
  mkdir %LOCALAPPDATA%\undodir\
  mkdir %LOCALAPPDATA%\nvim\plugin_settings\
  rem copy nvim config file
  copy ..\nvimfiles\nvim-latest\init.vim	%LOCALAPPDATA%\nvim\init.vim
  copy ..\nvimfiles\nvim-latest\ginit.vim	%LOCALAPPDATA%\nvim\ginit.vim
  copy ..\nvimfiles\nvim-latest\plugrc		%LOCALAPPDATA%\nvim\plugrc
  copy ..\nvimfiles\nvim-latest\plugged		%LOCALAPPDATA%\nvim\plugin_settings

  rem add plugin manager
  curl.exe -fLo %LOCALAPPDATA%\nvim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  rem neovim alias
  mkdir %userprofile%\Documents\Powershell
  echo ..\nvimfiles\nvim-latest\Microsoft.PowerShell_profile.ps1 >> %userprofile%\Documents\Powershell\Microsoft.PowerShell_profile.ps1
  

  cd /D %work%
exit /b

:func_vim
  cd /D %work%

  rem make vim dir
  mkdir %rootdir%\vimfiles
  mkdir %rootdir%\vimfiles\plugin
  mkdir %rootdir%\vimfiles\undodir
  rem copy vim config file
  copy ..\vimfiles\vimrc									%rootdir%\vimfiles\vimrc                
  copy ..\vimfiles\gvimrc									%rootdir%\vimfiles\gvimrc               
  copy ..\vimfiles\vundlerc								%rootdir%\vimfiles\vundlerc             
  copy ..\vimfiles\plugin\InThisWord.vim	%rootdir%\vimfiles\plugin\InThisWord.vim

  rem install plugin manager 
  git clone https://github.com/VundleVim/Vundle.vim.git %rootdir%\vimfiels\bundle\Vundle.vim
  
  cd /D %work%
exit /b

:func_starship
  cd /D %work%

  rem install starship
  winget install starship

  rem write powershell setting
  mkdir %userprofile%\Documents\Powershell
  echo ..\starship\Microsoft.PowerShell_profile.ps1 >> %userprofile%\Documents\Powershell\Microsoft.PowerShell_profile.ps1

  cd /D %work%
exit /b

:func_help
exit /b

:func_update
exit /b

