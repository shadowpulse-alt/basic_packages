# Script made by ElectroFactory
# Do not share without prior permission
# Do not modify without prior permission
# Discord https://discord.gg/4PvNBzg

# -*- coding: utf-8 -*-
#!/usr/bin/env python3

import sys
import time
from time import sleep
import RPi.GPIO as GPIO

warn = 16
light_box = 18
fan = 22
alert = True

if len(sys.argv) != 2:
    print("Usage : " + sys.argv[0] + " <commande>")
    sys.exit(1)

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(warn, GPIO.OUT)
GPIO.setup(light_box, GPIO.OUT)

def warn_on():
    GPIO.output(warn, GPIO.HIGH)
    sleep(0.010)
    GPIO.output(warn, GPIO.LOW)
    sleep(1.000)
    GPIO.output(warn, GPIO.HIGH)
    sleep(0.010)
    GPIO.output(warn, GPIO.LOW)
    sleep(1.000)
    GPIO.output(warn, GPIO.HIGH)
    sleep(0.010)
    GPIO.output(warn, GPIO.LOW)
def warn_off():
    GPIO.output(warn, GPIO.LOW)

def light_box_on():
    GPIO.output(light_box, GPIO.HIGH)
def light_box_off():
    GPIO.output(light_box, GPIO.LOW)

def fan_on():
    GPIO.output(fan, GPIO.HIGH)
def fan_off():
    GPIO.output(fan, GPIO.LOW)

if sys.argv[1] == "warn_on":
    while alert:
        warn_on()
elif sys.argv[1] == "warn_off":
    warn_off()

elif sys.argv[1] == "light_box_on":
    light_box_on()
elif sys.argv[1] == "light_box_off":
    light_box_off()

elif sys.argv[1] == "fan_on":
    fan_on()
elif sys.argv[1] == "fan_off":
    fan_off()

else:
    print("Command Not Found.")
    print("Commands available :")

    print("warn on : python3 python3 /supervision-baie/main.py warn_on")
    print("warn off : python3 python3 /supervision-baie/main.py warn_off")

    print("light_box on : python3 /supervision-baie/main.py light_box_on")
    print("light_box off : python3 /supervision-baie/main.py light_box_off")
    
    print("fan on : python3 /supervision-baie/main.py fan_on")
    print("fan off : python3 /supervision-baie/main.py fan_off")