@ECHO OFF

REM ###########################################################
REM #                                                         #
REM # Title        : Message to telegram via your bot.        #
REM # Author       : Murdervan                                #
REM # Link         : github.com/murdervan                     #
REM # Target       : Windows 10/11                            #
REM # Description  : This bat can send message to a telegram  #
REM #                channel or group via your bot.           #
REM #                replace your token and chat id.          #
REM #                                                         #
REM ###########################################################



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
