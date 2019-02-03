# ORIGINAL HEADER:
#    
# wiringPi:
#	Arduino look-a-like Wiring library for the Raspberry Pi
#	Copyright (c) 2012-2017 Gordon Henderson
#	Additional code for pwmSetClock by Chris Hall <chris@kchall.plus.com>
#
#	Thanks to code samples from Gert Jan van Loo and the
#	BCM2835 ARM Peripherals manual, however it's missing
#	the clock section /grr/mutter/
#**********************************************************************
# This file is part of wiringPi:
#	https://projects.drogon.net/raspberry-pi/wiringpi/
#
#    wiringPi is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    wiringPi is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public
#    License along with wiringPi.
#    If not, see <http://www.gnu.org/licenses/>.
#**********************************************************************


{.passL: "-lwiringPi".}
# hint import wiringPi as wpi



## Mask for the bottom 64 pins which belong to the Raspberry Pi
##  The others are available for the other devices

const  PI_GPIO_MASK*  = (0xFFFFFFC0)


## Handy defines

const  LOW*      = 0
const  HIGH*     = 1


## wiringPi modes
type WPI_MODE* = enum
    UNINITIALISED  = -1
    PINS     = 0
    GPIO     = 1
    GPIO_SYS = 2
    PHYS     = 3
    PIFACE   = 4



## Pin modes
type
    PinMode* {.pure.} = enum 
        INPUT            = 0,
        OUTPUT           = 1,
        PWM_OUTPUT       = 2,
        GPIO_CLOCK       = 3,
        SOFT_PWM_OUTPUT  = 4,
        SOFT_TONE_OUTPUT = 5,
        PWM_TONE_OUTPUT  = 6


## Pull up/down/none
type PUD* {.pure.} = enum
    OFF = 0
    DOWN = 1
    UP = 2
    

## PWM
type PWM_MODE* {.pure.} = enum
    MS = 0
    BAL = 1


## Interrupt levels
type INT_EDGE* = enum
    SETUP    = 0
    FALLING  = 1
    RISING   = 2
    BOTH     = 3


## Pi model types and version numbers
##  Intended for the GPIO program Use at your own risk.
type PI_MODEL* {.pure.} = enum
    A       = 0
    B       = 1
    AP      = 2
    BP      = 3
    V2      = 4
    ALPHA   = 5
    CM      = 6
    v07     = 7
    V3      = 8
    ZERO    =  9
    CM3     = 10
    ZERO_W  = 12
    V3P     = 13


const  PI_VERSION_1*    = 0
const  PI_VERSION_1_1*  = 1
const  PI_VERSION_1_2*  = 2
const  PI_VERSION_2*    = 3

type PI_MAKER* = enum
    SONY    = 0
    EGOMAN  = 1
    EMBEST  = 2
    UNKNOWN = 3



#-------------------------------------------------------------------------------



proc wiringPiSetup*(): cint  {.importc, header: "wiringPi.h".}
proc wiringPiSetupSys*(): cint  {.importc, header: "wiringPi.h".} 
proc wiringPiSetupGpio*(): cint  {.importc, header: "wiringPi.h".} 
proc wiringPiSetupPhys*(): cint  {.importc, header: "wiringPi.h".} 

proc wiringPiVersion*(major: ptr cint, minor: ptr cint)  {.importc, header: "wiringPi.h".} 

#......................

proc pinModeAlt*         (pin: cint, mode: cint) {.importc, header: "wiringPi.h".}
proc pinMode*            (pin: cint, mode: cint) {.importc, header: "wiringPi.h".}
proc pinMode*            (pin: cint, mode: PinMode) {.importc, header: "wiringPi.h".}
proc pullUpDnControl*     (pin: cint, pud: cint) {.importc, header: "wiringPi.h".}
proc pullUpDnControl*     (pin: cint, pud: PUD) {.importc, header: "wiringPi.h".}

proc digitalRead*         (pin: cint): cint {.importc, header: "wiringPi.h".}
proc digitalWrite*        (pin: cint, value: cint) {.importc, header: "wiringPi.h".}
proc digitalRead8*        (pin: cint): cuint {.importc, header: "wiringPi.h".}
proc digitalWrite8*       (pin: cint, value: cint) {.importc, header: "wiringPi.h".}
proc pwmWrite*            (pin: cint, value: cint) {.importc, header: "wiringPi.h".}
proc analogRead*          (pin: cint): cint {.importc, header: "wiringPi.h".}
proc analogWrite*         (pin: cint, value: cint) {.importc, header: "wiringPi.h".}


## On-Board Raspberry Pi hardware specific stuff

proc piGpioLayout*        (): cint {.importc, header: "wiringPi.h".}
proc piBoardRev*          (): cint {.importc, header: "wiringPi.h".} ## Deprecated
proc piBoardId*           (model: ptr cint, rev: ptr cint, mem: ptr cint, maker: ptr cint, overVolted: ptr cint) {.importc, header: "wiringPi.h".}

proc wpiPinToGpio*        (wpiPin: cint): cint {.importc, header: "wiringPi.h".}
proc physPinToGpio*       (physPin: cint): cint {.importc, header: "wiringPi.h".}

proc setPadDrive*         (group: cint, value: cint) {.importc, header: "wiringPi.h".}
proc getAlt*              (pin: cint): cint {.importc, header: "wiringPi.h".}

proc pwmToneWrite*        (pin: cint, freq: int) {.importc, header: "wiringPi.h".}
proc pwmSetMode*          (mode: cint) {.importc, header: "wiringPi.h".}
proc pwmSetRange*         (range: cuint) {.importc, header: "wiringPi.h".}
proc pwmSetClock*         (divisor: cint) {.importc, header: "wiringPi.h".}

proc gpioClockSet*        (pin: cint, freq: cint) {.importc, header: "wiringPi.h".}

proc digitalReadByte*     (): cuint {.importc, header: "wiringPi.h".}
proc digitalReadByte2*    (): cuint {.importc, header: "wiringPi.h".}
proc digitalWriteByte*    (value: cint) {.importc, header: "wiringPi.h".}
proc digitalWriteByte2*   (value: cint) {.importc, header: "wiringPi.h".}

## Interrupts
##	(Also Pi hardware specific)

proc waitForInterrupt*    ( pin: cint,  mS: cint): cint {.importc, header: "wiringPi.h".}
proc wiringPiISR*         ( pin: cint,  mode: cint, function: ptr proc): cint {.importc, header: "wiringPi.h".}

## Threads

proc piThreadCreate*      (function: ptr proc): cint {.importc, header: "wiringPi.h".}
proc piLock*              (key: cint) {.importc, header: "wiringPi.h".}
proc piUnlock*            (key: cint) {.importc, header: "wiringPi.h".}

## Schedulling priority

proc piHiPri* (pri: cint): cint {.importc, header: "wiringPi.h".}

## Extras from arduino land

proc delay*             (howLong: cuint) {.importc, header: "wiringPi.h".}
proc delayMicroseconds* (howLong: cuint) {.importc, header: "wiringPi.h".}
proc millis*            (): cuint {.importc, header: "wiringPi.h".}
proc micros*            (): cuint {.importc, header: "wiringPi.h".}

#########################################################################################x

when isMainModule:
    proc printf(format: cstring): cint {.importc, varargs, header: "stdio.h".}
    discard printf("My name is %s and I am %d years old!\n", "Ben", 30)
    #echo wiringPiSetup()

    var
        major, minor: cint

    wiringPiVersion(addr major, addr minor)
    echo "wiringPiVersion: ", major, ".", minor

    echo INT_EDGE.FALLING, ": ", cint INT_EDGE.FALLING

