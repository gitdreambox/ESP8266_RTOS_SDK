@echo off
.\..\..\bin\esptool.exe -b 1500000 --port COM20 write_flash 0x00000 ./../../bin/boot_v1.6.bin 0x1000 ./bin/upgrade/user1.4096.new.6.bin 0x3fc000 ./../../bin/esp_init_data_default.bin 0x3fe000 ./../../bin/blank.bin
::.\..\..\bin\esptool.exe --port COM20 write_flash 0x1000 ./bin/upgrade/user1.4096.new.6.bin
pause