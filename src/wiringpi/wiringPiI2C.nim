#*
#* wiringPiI2C.h:
#*	Simplified I2C access routines
#*	Copyright (c) 2013 Gordon Henderson
#***********************************************************************
#* This file is part of wiringPi:
#*	https://projects.drogon.net/raspberry-pi/wiringpi/
#*
#*    wiringPi is free software: you can redistribute it and/or modify
#*    it under the terms of the GNU Lesser General Public License as
#*    published by the Free Software Foundation, either version 3 of the
#*    License, or (at your option) any later version.
#*
#*    wiringPi is distributed in the hope that it will be useful,
#*    but WITHOUT ANY WARRANTY; without even the implied warranty of
#*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#*    GNU Lesser General Public License for more details.
#*
#*    You should have received a copy of the GNU Lesser General Public
#*    License along with wiringPi.
#*    If not, see <http://www.gnu.org/licenses/>.
#***********************************************************************
#*



proc wiringPiI2CRead*           (fd: cint) : cint {.importc, header: "wiringPiI2C.h".}
proc wiringPiI2CReadReg8*       (fd: cint, reg: cint) : cint {.importc, header: "wiringPiI2C.h".}
proc wiringPiI2CReadReg16*      (fd: cint, reg: cint) : cint {.importc, header: "wiringPiI2C.h".}

proc wiringPiI2CWrite*          (fd: cint, data: cint) : cint {.importc, header: "wiringPiI2C.h".}
proc wiringPiI2CWriteReg8*      (fd: cint, reg: cint, data: cint) : cint {.importc, header: "wiringPiI2C.h".}
proc wiringPiI2CWriteReg16*     (fd: cint, reg: cint, data: cint) : cint {.importc, header: "wiringPiI2C.h".}

proc wiringPiI2CSetupInterface* (device: cstring, devId: cint) : cint {.importc, header: "wiringPiI2C.h".}
proc wiringPiI2CSetup*          (devId: cint) : cint {.importc, header: "wiringPiI2C.h".}
