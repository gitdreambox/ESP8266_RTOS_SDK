#!/bin/bash

:<<!
******NOTICE******
MUST set SDK_PATH & BIN_PATH firstly!!!
example:
export SDK_PATH=~/esp_iot_sdk_freertos
export BIN_PATH=~/esp8266_bin
!

export SDK_PATH=./../../../ESP8266_RTOS_SDK
export BIN_PATH=./bin
echo "SDK_PATH:$SDK_PATH"
echo "BIN_PATH:$BIN_PATH"

boot=new
echo "boot mode: $boot"
app=1
echo "app:$app"
spi_speed=40
echo "spi speed: $spi_speed MHz"
spi_mode=QIO
echo "spi mode: $spi_mode"
spi_size_map=6
echo "spi_size_map:$spi_size_map"
echo "spi size: 4096KB"
echo "spi ota map:1024KB + 1024KB"

make clean
make BOOT=$boot APP=$app SPI_SPEED=$spi_speed SPI_MODE=$spi_mode SPI_SIZE_MAP=$spi_size_map
