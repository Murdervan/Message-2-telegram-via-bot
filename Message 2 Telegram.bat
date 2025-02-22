@ECHO OFF
REM MADE BY @MURDERVAN - www.unit.link/murdervan/ - www.github.com/murdervan/

SETLOCAL ENABLEDELAYEDEXPANSION

ECHO.
ECHO ------------------------------
ECHO Message 2 Telegram via your own bot 
ECHO MADE BY @MURDERVAN
ECHO www.unit.link/murdervan/
ECHO www.github.com/murdervan/
ECHO ------------------------------
ECHO.

REM Telegram API URL
SET baseURL=https://api.telegram.org/bot<TELEGRAM_TOKEN>/sendMessage

REM Chat ID
SET chatId=@<CHANNEL/GROUP_NAME>

:loop
SET /P "userInput=Indtast din besked ('exit' for at afslutte): "

IF "%userInput%"=="exit" GOTO :eof

REM Brug forsinket ekspansion til at håndtere input korrekt
SET "encodedInput=!userInput: =%%20!"

REM Send besked via Telegram API uden at vise output i CMD
curl -s "%baseURL%?chat_id=%chatId%&text=!encodedInput!" > nul 2>&1

ECHO Besked sendt!
GOTO :loop

:eof
ECHO Scriptet er afsluttet.
PAUSE
