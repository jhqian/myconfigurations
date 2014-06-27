@echo off
setlocal enabledelayedexpansion

if {"%VIM%"}=={} (
    No VIM installation path is found  
    goto end
)

if exist "%VIM%\gvimrc" (
    del "%VIM%\gvimrc" /F /S /Q
)

if exist "%VIM%\vimrc" (
    del "%VIM%\vimrc" /F /S /Q
)
copy "vim\.vimrc" "%VIM%\vimrc"
copy "vim\_gvimrc" "%VIM%\gvimrc"

if exist "%VIM%\vimfiles" (
    rd "%VIM%\vimfiles" /S /Q
)
md "%VIM%\vimfiles"
xcopy "vim\.vim" "%VIM%\vimfiles\" /S /Q

:end
endlocal
