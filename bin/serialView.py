#!/usr/bin/python
# -*- coding: utf-8 -*-
import serial
import serial.tools.list_ports
import os
import sys
import argparse
import signal

def handler(signal_num,frame):
    print '\nYou Pressed Ctrl-C.'
    sys.exit(signal_num)


def arg_auto_int(x):
    return int(x, 0)

def main():
    signal.signal(signal.SIGINT, handler)
    parser = argparse.ArgumentParser(description='serialView.py')
    parser.add_argument(
        '--port', '-p',
        help='Serial port device',
        default=os.environ.get('ESPTOOL_PORT', 'COM5'))

    parser.add_argument(
        '--baud', '-b',
        help='Serial port baud rate',
        type=arg_auto_int,
        default=os.environ.get('ESPTOOL_BAUD', 74880))
    args = parser.parse_args()
    if args.port is None:
        parser.print_help()
        sys.exit(1)

    print 'Serial open port=%s   baud=%d'%(args.port,args.baud)

    try:
        com=serial.Serial(args.port,args.baud,timeout=1)
    # com.setDTR(False)
    # # com.setRTS(True)
    # time.sleep(0.05)
    # com.setDTR(True)
    # # com.setRTS(False)
    # time.sleep(0.05)
    # com.setDTR(False)
        while True:
            d=com.read(1)
            #data= str(binascii.b2a_hex(com.read()))[2:-1]
            #print(str(d,'utf-8').strip())
            #print d.strip(' '),
            sys.stdout.write(d)
        com.close()
    except KeyboardInterrupt, e:
        print 'keyboardInterrupt'
    print 'Serial port close'


if __name__ == '__main__':
    main()
  