@echo off

Rem ******NOTICE******
Rem MUST set SDK_PATH & BIN_PATH firstly!!!
Rem example:
Rem set SDK_PATH=/c/esp_iot_sdk_freertos
Rem set BIN_PATH=/c/esp8266_bin

::set SDK_PATH=/cygdrive/e/ESP8266_RTOS_SDK
::set SDK_PATH=./../../../ESP8266_RTOS_SDK
::set SDK_PATH=%~pd0..\..
for /f "delims=" %%i in ('pwd') do (
    set "SDK_PATH=/cygdrive%%i/../.."
)
set BIN_PATH=./bin
echo SDK_PATH:%SDK_PATH%
echo BIN_PATH:%BIN_PATH%

set boot=new
echo boot mode: %boot%
set app=1
echo app:%app%
set spi_speed=40
echo spi speed: %spi_speed% MHz
set spi_mode=QIO
echo spi mode: %spi_mode%
set spi_size_map=6
echo spi_size_map:%spi_size_map%
echo spi size: 4096KB
echo spi ota map:1024KB + 1024KB

make clean

make COMPILE=xcc BOOT=%boot% APP=%app% SPI_SPEED=%spi_speed% SPI_MODE=%spi_mode% SPI_SIZE_MAP=%spi_size_map%

:end