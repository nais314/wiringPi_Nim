#/*
# * wiringSerial.h:
# *	Handle a serial port
# ***********************************************************************
# * This file is part of wiringPi:
# *	https://projects.drogon.net/raspberry-pi/wiringpi/
# *
# *    wiringPi is free software: you can redistribute it and/or modify
# *    it under the terms of the GNU Lesser General Public License as published by
# *    the Free Software Foundation, either version 3 of the License, or
# *    (at your option) any later version.
# *
# *    wiringPi is distributed in the hope that it will be useful,
# *    but WITHOUT ANY WARRANTY; without even the implied warranty of
# *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# *    GNU Lesser General Public License for more details.
# *
# *    You should have received a copy of the GNU Lesser General Public License
# *    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
# ***********************************************************************
# */


proc serialOpen*      (device: cstring, baud: cint) : cint {.importc, header: "wiringSerial.h".}
proc serialClose*     (fd: cint) {.importc, header: "wiringSerial.h".}
proc serialFlush*     (fd: cint) {.importc, header: "wiringSerial.h".}
proc serialPutchar*   (fd: cint, c: cuchar) {.importc, header: "wiringSerial.h".}
proc serialPuts*      (fd: cint, s: cchar) {.importc, header: "wiringSerial.h".}
proc serialPrintf*    (fd: cint, message: cstring) {.importc, varargs, header: "wiringSerial.h".}
proc serialDataAvail* (fd: cint) : cint {.importc, header: "wiringSerial.h".}
proc serialGetchar*   (fd: cint) : cint {.importc, header: "wiringSerial.h".}

