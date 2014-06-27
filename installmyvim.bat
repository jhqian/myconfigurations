@echo off
setlocal enabledelayedexpansion

if {"%VIM%"}=={} (
    No VIM installation path is found  
    goto end
)

if exist "%VIM%\_vimrc" (
    del "%VIM%\_vimrc" /F /S /Q
)
copy "vim\.vimrc" "%VIM%\_vimrc"

if exist "%VIM%\vimfiles" (
    rd "%VIM%\vimfiles" /S /Q
)
md "%VIM%\vimfiles"
xcopy "vim\.vim" "%VIM%\vimfiles\" /S /Q

:end
endlocal
