@ECHO OFF
REM MADE BY @MURDERVAN - www.unit.link/murdervan/ - www.github.com/murdervan/

ECHO.
ECHO ------------------------------
ECHO Message 2 Telegram via your own bot 
ECHO MADE BY @MURDERVAN
ECHO www.unit.link/murdervan/
ECHO www.github.com/murdervan/
ECHO ------------------------------
ECHO.

REM Telegram Bot Token
SET "botToken=TELEGRAM_TOKEN_HERE"

REM Chat ID til modtageren
SET "chatId=CHAT_ID_HERE"

REM Loop for at indtaste beskeder
:loop
SET /P "userInput=Indtast din besked ('exit' for at afslutte): "

REM Tjek om brugeren vil afslutte
IF "%userInput%"=="exit" (
    GOTO :eof
)

REM Send besked til Telegram via bot og webhook
curl -s -X POST https://api.telegram.org/bot%botToken%/sendMessage -d chat_id=%chatId% -d text="%userInput%" > nul

REM Tjek om beskeden blev sendt korrekt
IF %errorlevel% EQU 0 (
    ECHO Besked sendt til Telegram!
) ELSE (
    ECHO Fejl: Besked blev ikke sendt til Telegram.
)

REM Gå tilbage til loop for at indtaste flere beskeder
GOTO :loop

:eof
ECHO Scriptet er afsluttet.
PAUSE
