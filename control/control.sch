EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32f072cbt6
LIBS:swd
LIBS:ad8495
LIBS:rotenc
LIBS:er-oled015-2b
LIBS:cga0402mlc-12g
LIBS:esp8266
LIBS:adp3335
LIBS:control-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Supervide Control Board"
Date "Mon 02 Feb 2015"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L STM32F072CBT6 IC1
U 1 1 54CFFCF5
P 2900 1800
F 0 "IC1" H 2450 100 60  0000 C CNN
F 1 "STM32F072CBT6" H 2750 2900 60  0000 C CNN
F 2 "" H 2850 1800 60  0000 C CNN
F 3 "" H 2850 1800 60  0000 C CNN
	1    2900 1800
	1    0    0    -1  
$EndComp
$Comp
L USB-MICRO-B CON1
U 1 1 54CFFDE1
P 7600 2750
F 0 "CON1" H 7300 3100 50  0000 C CNN
F 1 "USB-MICRO-B" H 7450 2400 50  0000 C CNN
F 2 "" H 7600 2650 50  0000 C CNN
F 3 "" H 7600 2650 50  0000 C CNN
	1    7600 2750
	1    0    0    -1  
$EndComp
$Comp
L SWD P1
U 1 1 54CFFE52
P 5350 1300
F 0 "P1" H 5600 1600 60  0000 C CNN
F 1 "SWD" H 5050 1600 60  0000 C CNN
F 2 "" H 5700 1100 60  0000 C CNN
F 3 "" H 5700 1100 60  0000 C CNN
	1    5350 1300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 54CFFEEF
P 650 5200
F 0 "P3" H 650 5350 50  0000 C CNN
F 1 "CONN_01X02" V 750 5200 50  0000 C CNN
F 2 "" H 650 5200 60  0000 C CNN
F 3 "" H 650 5200 60  0000 C CNN
	1    650  5200
	-1   0    0    1   
$EndComp
$Comp
L AD8495 IC2
U 1 1 54CFFF5A
P 2650 5200
F 0 "IC2" H 2850 5450 60  0000 C CNN
F 1 "AD8495" H 2900 4950 60  0000 C CNN
F 2 "" H 2650 5200 60  0000 C CNN
F 3 "" H 2650 5200 60  0000 C CNN
	1    2650 5200
	1    0    0    -1  
$EndComp
$Comp
L SPEAKER SP1
U 1 1 54D000AD
P 10700 1200
F 0 "SP1" H 10600 1450 50  0000 C CNN
F 1 "SPEAKER" H 10600 950 50  0000 C CNN
F 2 "" H 10700 1200 60  0000 C CNN
F 3 "" H 10700 1200 60  0000 C CNN
	1    10700 1200
	1    0    0    -1  
$EndComp
$Comp
L ROTENC U1
U 1 1 54D00B8D
P 7300 1150
F 0 "U1" H 7150 650 60  0000 C CNN
F 1 "ROTENC" H 7250 1250 60  0000 C CNN
F 2 "" H 7800 1150 60  0000 C CNN
F 3 "" H 7800 1150 60  0000 C CNN
	1    7300 1150
	1    0    0    -1  
$EndComp
$Comp
L ER-OLED015-2B U3
U 1 1 54D011DE
P 10350 3000
F 0 "U3" H 10500 600 60  0000 C CNN
F 1 "ER-OLED015-2B" H 10600 3100 60  0000 C CNN
F 2 "" H 10350 3000 60  0000 C CNN
F 3 "" H 10350 3000 60  0000 C CNN
	1    10350 3000
	1    0    0    -1  
$EndComp
$Comp
L CGA0402MLC-12G D1
U 1 1 54D01279
P 900 4850
F 0 "D1" H 1000 4750 60  0000 C CNN
F 1 "CGA0402MLC-12G" H 1000 4960 60  0001 C CNN
F 2 "" H 900 4850 60  0000 C CNN
F 3 "" H 900 4850 60  0000 C CNN
	1    900  4850
	0    1    1    0   
$EndComp
$Comp
L CGA0402MLC-12G D2
U 1 1 54D013F6
P 900 5350
F 0 "D2" H 1000 5250 60  0000 C CNN
F 1 "CGA0402MLC-12G" H 1000 5460 60  0001 C CNN
F 2 "" H 900 5350 60  0000 C CNN
F 3 "" H 900 5350 60  0000 C CNN
	1    900  5350
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 54D015F8
P 1200 5100
F 0 "R5" V 1280 5100 50  0000 C CNN
F 1 "1k" V 1207 5101 50  0000 C CNN
F 2 "" V 1130 5100 30  0000 C CNN
F 3 "" H 1200 5100 30  0000 C CNN
	1    1200 5100
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 54D01636
P 1200 5300
F 0 "R7" V 1280 5300 50  0000 C CNN
F 1 "1k" V 1207 5301 50  0000 C CNN
F 2 "" V 1130 5300 30  0000 C CNN
F 3 "" H 1200 5300 30  0000 C CNN
	1    1200 5300
	0    1    1    0   
$EndComp
$Comp
L C C17
U 1 1 54D01666
P 1700 5200
F 0 "C17" H 1750 5300 50  0000 L CNN
F 1 "1µ" H 1750 5100 50  0000 L CNN
F 2 "" H 1738 5050 30  0000 C CNN
F 3 "" H 1700 5200 60  0000 C CNN
	1    1700 5200
	1    0    0    -1  
$EndComp
$Comp
L C C16
U 1 1 54D0169F
P 1700 4700
F 0 "C16" H 1750 4800 50  0000 L CNN
F 1 "100n" H 1750 4600 50  0000 L CNN
F 2 "" H 1738 4550 30  0000 C CNN
F 3 "" H 1700 4700 60  0000 C CNN
	1    1700 4700
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 54D016D3
P 1700 5700
F 0 "C22" H 1750 5800 50  0000 L CNN
F 1 "100n" H 1750 5600 50  0000 L CNN
F 2 "" H 1738 5550 30  0000 C CNN
F 3 "" H 1700 5700 60  0000 C CNN
	1    1700 5700
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 54D0171F
P 2050 5750
F 0 "R9" V 2130 5750 50  0000 C CNN
F 1 "1M" V 2057 5751 50  0000 C CNN
F 2 "" V 1980 5750 30  0000 C CNN
F 3 "" H 2050 5750 30  0000 C CNN
	1    2050 5750
	-1   0    0    1   
$EndComp
$Comp
L C C14
U 1 1 54D0178D
P 2850 4500
F 0 "C14" H 2900 4600 50  0000 L CNN
F 1 "100n" H 2900 4400 50  0000 L CNN
F 2 "" H 2888 4350 30  0000 C CNN
F 3 "" H 2850 4500 60  0000 C CNN
	1    2850 4500
	1    0    0    -1  
$EndComp
$Comp
L C C15
U 1 1 54D017E2
P 3150 4500
F 0 "C15" H 3200 4600 50  0000 L CNN
F 1 "10µ" H 3200 4400 50  0000 L CNN
F 2 "" H 3188 4350 30  0000 C CNN
F 3 "" H 3150 4500 60  0000 C CNN
	1    3150 4500
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 54D032F8
P 3700 5200
F 0 "R6" V 3780 5200 50  0000 C CNN
F 1 "10k" V 3707 5201 50  0000 C CNN
F 2 "" V 3630 5200 30  0000 C CNN
F 3 "" H 3700 5200 30  0000 C CNN
	1    3700 5200
	0    1    1    0   
$EndComp
$Comp
L C C18
U 1 1 54D033E8
P 4050 5450
F 0 "C18" H 4100 5550 50  0000 L CNN
F 1 "1µ" H 4100 5350 50  0000 L CNN
F 2 "" H 4088 5300 30  0000 C CNN
F 3 "" H 4050 5450 60  0000 C CNN
	1    4050 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR35
U 1 1 54D03572
P 900 5600
F 0 "#PWR35" H 900 5350 60  0001 C CNN
F 1 "GND" H 900 5450 60  0000 C CNN
F 2 "" H 900 5600 60  0000 C CNN
F 3 "" H 900 5600 60  0000 C CNN
	1    900  5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR28
U 1 1 54D035F2
P 900 4800
F 0 "#PWR28" H 900 4550 60  0001 C CNN
F 1 "GND" H 900 4650 60  0000 C CNN
F 2 "" H 900 4800 60  0000 C CNN
F 3 "" H 900 4800 60  0000 C CNN
	1    900  4800
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR27
U 1 1 54D03D82
P 1700 4450
F 0 "#PWR27" H 1700 4200 60  0001 C CNN
F 1 "GND" H 1700 4300 60  0000 C CNN
F 2 "" H 1700 4450 60  0000 C CNN
F 3 "" H 1700 4450 60  0000 C CNN
	1    1700 4450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR40
U 1 1 54D03DA3
P 1700 5950
F 0 "#PWR40" H 1700 5700 60  0001 C CNN
F 1 "GND" H 1700 5800 60  0000 C CNN
F 2 "" H 1700 5950 60  0000 C CNN
F 3 "" H 1700 5950 60  0000 C CNN
	1    1700 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR41
U 1 1 54D03ED9
P 2050 6050
F 0 "#PWR41" H 2050 5800 60  0001 C CNN
F 1 "GND" H 2050 5900 60  0000 C CNN
F 2 "" H 2050 6050 60  0000 C CNN
F 3 "" H 2050 6050 60  0000 C CNN
	1    2050 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR32
U 1 1 54D03FC7
P 2200 5500
F 0 "#PWR32" H 2200 5250 60  0001 C CNN
F 1 "GND" H 2200 5350 60  0000 C CNN
F 2 "" H 2200 5500 60  0000 C CNN
F 3 "" H 2200 5500 60  0000 C CNN
	1    2200 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR29
U 1 1 54D040B6
P 3150 4800
F 0 "#PWR29" H 3150 4550 60  0001 C CNN
F 1 "GND" H 3150 4650 60  0000 C CNN
F 2 "" H 3150 4800 60  0000 C CNN
F 3 "" H 3150 4800 60  0000 C CNN
	1    3150 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR36
U 1 1 54D0436B
P 2650 5600
F 0 "#PWR36" H 2650 5350 60  0001 C CNN
F 1 "GND" H 2650 5450 60  0000 C CNN
F 2 "" H 2650 5600 60  0000 C CNN
F 3 "" H 2650 5600 60  0000 C CNN
	1    2650 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR37
U 1 1 54D04449
P 4050 5700
F 0 "#PWR37" H 4050 5450 60  0001 C CNN
F 1 "GND" H 4050 5550 60  0000 C CNN
F 2 "" H 4050 5700 60  0000 C CNN
F 3 "" H 4050 5700 60  0000 C CNN
	1    4050 5700
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 54D055AB
P 1150 1050
F 0 "C3" H 1200 1150 50  0000 L CNN
F 1 "4µ7" H 1200 950 50  0000 L CNN
F 2 "" H 1188 900 30  0000 C CNN
F 3 "" H 1150 1050 60  0000 C CNN
	1    1150 1050
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 54D0579F
P 1350 1050
F 0 "C4" H 1400 1150 50  0000 L CNN
F 1 "1µ" H 1400 950 50  0000 L CNN
F 2 "" H 1388 900 30  0000 C CNN
F 3 "" H 1350 1050 60  0000 C CNN
	1    1350 1050
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 54D057CF
P 1750 1050
F 0 "C6" H 1800 1150 50  0000 L CNN
F 1 "100n" H 1800 950 50  0000 L CNN
F 2 "" H 1788 900 30  0000 C CNN
F 3 "" H 1750 1050 60  0000 C CNN
	1    1750 1050
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 54D05800
P 1950 1050
F 0 "C7" H 2000 1150 50  0000 L CNN
F 1 "10n" H 2000 950 50  0000 L CNN
F 2 "" H 1988 900 30  0000 C CNN
F 3 "" H 1950 1050 60  0000 C CNN
	1    1950 1050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 54D05D18
P 1650 1350
F 0 "#PWR6" H 1650 1100 60  0001 C CNN
F 1 "GND" H 1650 1200 60  0000 C CNN
F 2 "" H 1650 1350 60  0000 C CNN
F 3 "" H 1650 1350 60  0000 C CNN
	1    1650 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 54D06073
P 2100 1550
F 0 "#PWR7" H 2100 1300 60  0001 C CNN
F 1 "GND" H 2100 1400 60  0000 C CNN
F 2 "" H 2100 1550 60  0000 C CNN
F 3 "" H 2100 1550 60  0000 C CNN
	1    2100 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR12
U 1 1 54D06450
P 2150 1900
F 0 "#PWR12" H 2150 1650 60  0001 C CNN
F 1 "GND" H 2150 1750 60  0000 C CNN
F 2 "" H 2150 1900 60  0000 C CNN
F 3 "" H 2150 1900 60  0000 C CNN
	1    2150 1900
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 54D064F7
P 1700 1800
F 0 "C9" H 1750 1900 50  0000 L CNN
F 1 "100n" H 1750 1700 50  0000 L CNN
F 2 "" H 1738 1650 30  0000 C CNN
F 3 "" H 1700 1800 60  0000 C CNN
	1    1700 1800
	0    1    1    0   
$EndComp
$Comp
L GND #PWR10
U 1 1 54D065B8
P 1450 1850
F 0 "#PWR10" H 1450 1600 60  0001 C CNN
F 1 "GND" H 1450 1700 60  0000 C CNN
F 2 "" H 1450 1850 60  0000 C CNN
F 3 "" H 1450 1850 60  0000 C CNN
	1    1450 1850
	1    0    0    -1  
$EndComp
Text Label 1550 1650 0    60   ~ 0
nRST
$Comp
L CONN_02X04 P2
U 1 1 54D06BFB
P 6450 4050
F 0 "P2" H 6450 4300 50  0000 C CNN
F 1 "CONN_02X04" H 6450 3800 50  0000 C CNN
F 2 "" H 6450 2850 60  0000 C CNN
F 3 "" H 6450 2850 60  0000 C CNN
	1    6450 4050
	1    0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 54D06E14
P 1100 2200
F 0 "X1" H 1100 2350 50  0000 C CNN
F 1 "8MHz" H 1100 2050 50  0000 C CNN
F 2 "" H 1100 2200 60  0000 C CNN
F 3 "" H 1100 2200 60  0000 C CNN
	1    1100 2200
	0    1    1    0   
$EndComp
$Comp
L C C10
U 1 1 54D06F5C
P 850 1900
F 0 "C10" H 900 2000 50  0000 L CNN
F 1 "15p" H 900 1800 50  0000 L CNN
F 2 "" H 888 1750 30  0000 C CNN
F 3 "" H 850 1900 60  0000 C CNN
	1    850  1900
	0    -1   -1   0   
$EndComp
$Comp
L C C11
U 1 1 54D06FE0
P 850 2500
F 0 "C11" H 900 2600 50  0000 L CNN
F 1 "15p" H 900 2400 50  0000 L CNN
F 2 "" H 888 2350 30  0000 C CNN
F 3 "" H 850 2500 60  0000 C CNN
	1    850  2500
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 54D0713C
P 1700 2500
F 0 "R4" V 1780 2500 50  0000 C CNN
F 1 "100" V 1707 2501 50  0000 C CNN
F 2 "" V 1630 2500 30  0000 C CNN
F 3 "" H 1700 2500 30  0000 C CNN
	1    1700 2500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR17
U 1 1 54D08130
P 600 2550
F 0 "#PWR17" H 600 2300 60  0001 C CNN
F 1 "GND" H 600 2400 60  0000 C CNN
F 2 "" H 600 2550 60  0000 C CNN
F 3 "" H 600 2550 60  0000 C CNN
	1    600  2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 54D08243
P 600 1950
F 0 "#PWR14" H 600 1700 60  0001 C CNN
F 1 "GND" H 600 1800 60  0000 C CNN
F 2 "" H 600 1950 60  0000 C CNN
F 3 "" H 600 1950 60  0000 C CNN
	1    600  1950
	1    0    0    -1  
$EndComp
NoConn ~ 2250 2100
NoConn ~ 2250 2200
NoConn ~ 2250 2300
$Comp
L C C13
U 1 1 54D0925A
P 9500 3650
F 0 "C13" H 9550 3750 50  0000 L CNN
F 1 "100n" H 9550 3550 50  0000 L CNN
F 2 "" H 9538 3500 30  0000 C CNN
F 3 "" H 9500 3650 60  0000 C CNN
	1    9500 3650
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 54D0950C
P 9250 3650
F 0 "C12" H 9300 3750 50  0000 L CNN
F 1 "4µ7" H 9300 3550 50  0000 L CNN
F 2 "" H 9288 3500 30  0000 C CNN
F 3 "" H 9250 3650 60  0000 C CNN
	1    9250 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR31
U 1 1 54D0A29F
P 10300 5350
F 0 "#PWR31" H 10300 5100 60  0001 C CNN
F 1 "GND" H 10300 5200 60  0000 C CNN
F 2 "" H 10300 5350 60  0000 C CNN
F 3 "" H 10300 5350 60  0000 C CNN
	1    10300 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR20
U 1 1 54D0A433
P 10250 3000
F 0 "#PWR20" H 10250 2750 60  0001 C CNN
F 1 "GND" H 10250 2850 60  0000 C CNN
F 2 "" H 10250 3000 60  0000 C CNN
F 3 "" H 10250 3000 60  0000 C CNN
	1    10250 3000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR23
U 1 1 54D0ABAA
P 9250 3950
F 0 "#PWR23" H 9250 3700 60  0001 C CNN
F 1 "GND" H 9250 3800 60  0000 C CNN
F 2 "" H 9250 3950 60  0000 C CNN
F 3 "" H 9250 3950 60  0000 C CNN
	1    9250 3950
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 54D0AFA6
P 9950 5450
F 0 "C21" H 10000 5550 50  0000 L CNN
F 1 "100n" H 10000 5350 50  0000 L CNN
F 2 "" H 9988 5300 30  0000 C CNN
F 3 "" H 9950 5450 60  0000 C CNN
	1    9950 5450
	1    0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 54D0B12A
P 9700 5450
F 0 "C20" H 9750 5550 50  0000 L CNN
F 1 "10µ" H 9750 5350 50  0000 L CNN
F 2 "" H 9738 5300 30  0000 C CNN
F 3 "" H 9700 5450 60  0000 C CNN
	1    9700 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR38
U 1 1 54D0B292
P 9700 5750
F 0 "#PWR38" H 9700 5500 60  0001 C CNN
F 1 "GND" H 9700 5600 60  0000 C CNN
F 2 "" H 9700 5750 60  0000 C CNN
F 3 "" H 9700 5750 60  0000 C CNN
	1    9700 5750
	1    0    0    -1  
$EndComp
$Comp
L C C19
U 1 1 54D0B93B
P 9450 5450
F 0 "C19" H 9500 5550 50  0000 L CNN
F 1 "4µ7" H 9500 5350 50  0000 L CNN
F 2 "" H 9488 5300 30  0000 C CNN
F 3 "" H 9450 5450 60  0000 C CNN
	1    9450 5450
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 54D0BBC7
P 9200 5400
F 0 "R8" V 9280 5400 50  0000 C CNN
F 1 "910k" V 9207 5401 50  0000 C CNN
F 2 "" V 9130 5400 30  0000 C CNN
F 3 "" H 9200 5400 30  0000 C CNN
	1    9200 5400
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR21
U 1 1 54D0CDBE
P 9200 3350
F 0 "#PWR21" H 9200 3200 60  0001 C CNN
F 1 "VDD" H 9200 3500 60  0000 C CNN
F 2 "" H 9200 3350 60  0000 C CNN
F 3 "" H 9200 3350 60  0000 C CNN
	1    9200 3350
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR2
U 1 1 54D0CF33
P 900 750
F 0 "#PWR2" H 900 600 60  0001 C CNN
F 1 "VDD" H 900 900 60  0000 C CNN
F 2 "" H 900 750 60  0000 C CNN
F 3 "" H 900 750 60  0000 C CNN
	1    900  750 
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR24
U 1 1 54D0D2A4
P 3200 4200
F 0 "#PWR24" H 3200 4050 60  0001 C CNN
F 1 "VDD" H 3200 4350 60  0000 C CNN
F 2 "" H 3200 4200 60  0000 C CNN
F 3 "" H 3200 4200 60  0000 C CNN
	1    3200 4200
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR3
U 1 1 54D0D617
P 4800 1050
F 0 "#PWR3" H 4800 900 60  0001 C CNN
F 1 "VDD" H 4800 1200 60  0000 C CNN
F 2 "" H 4800 1050 60  0000 C CNN
F 3 "" H 4800 1050 60  0000 C CNN
	1    4800 1050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR15
U 1 1 54D0D8D2
P 4750 2400
F 0 "#PWR15" H 4750 2250 60  0001 C CNN
F 1 "VDD" H 4750 2550 60  0000 C CNN
F 2 "" H 4750 2400 60  0000 C CNN
F 3 "" H 4750 2400 60  0000 C CNN
	1    4750 2400
	1    0    0    -1  
$EndComp
$Comp
L ESP8266 U2
U 1 1 54D0DDC7
P 4800 2450
F 0 "U2" H 4950 2050 60  0000 C CNN
F 1 "ESP8266" H 5100 2550 60  0000 C CNN
F 2 "" H 4800 2450 60  0000 C CNN
F 3 "" H 4800 2450 60  0000 C CNN
	1    4800 2450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR30
U 1 1 54D0E302
P 9600 5150
F 0 "#PWR30" H 9600 5000 60  0001 C CNN
F 1 "VCC" H 9600 5300 60  0000 C CNN
F 2 "" H 9600 5150 60  0000 C CNN
F 3 "" H 9600 5150 60  0000 C CNN
	1    9600 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR22
U 1 1 54D0F836
P 5850 3900
F 0 "#PWR22" H 5850 3650 60  0001 C CNN
F 1 "GND" H 5850 3750 60  0000 C CNN
F 2 "" H 5850 3900 60  0000 C CNN
F 3 "" H 5850 3900 60  0000 C CNN
	1    5850 3900
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR25
U 1 1 54D0FA8C
P 6100 4200
F 0 "#PWR25" H 6100 4050 60  0001 C CNN
F 1 "VCC" H 6100 4350 60  0000 C CNN
F 2 "" H 6100 4200 60  0000 C CNN
F 3 "" H 6100 4200 60  0000 C CNN
	1    6100 4200
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR16
U 1 1 54D0FC76
P 7050 2500
F 0 "#PWR16" H 7050 2350 60  0001 C CNN
F 1 "+5V" H 7050 2640 60  0000 C CNN
F 2 "" H 7050 2500 60  0000 C CNN
F 3 "" H 7050 2500 60  0000 C CNN
	1    7050 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR26
U 1 1 54D0FED5
P 6800 4200
F 0 "#PWR26" H 6800 4050 60  0001 C CNN
F 1 "+5V" H 6800 4340 60  0000 C CNN
F 2 "" H 6800 4200 60  0000 C CNN
F 3 "" H 6800 4200 60  0000 C CNN
	1    6800 4200
	0    1    1    0   
$EndComp
NoConn ~ 6700 4100
Text Label 6850 3900 0    60   ~ 0
RELAY
Text Label 6850 4000 0    60   ~ 0
TRIAC
Text Label 6050 4000 2    60   ~ 0
SYNC
Text Label 6050 4100 2    60   ~ 0
CURRENT
$Comp
L GND #PWR8
U 1 1 54D11313
P 4800 1550
F 0 "#PWR8" H 4800 1300 60  0001 C CNN
F 1 "GND" H 4800 1400 60  0000 C CNN
F 2 "" H 4800 1550 60  0000 C CNN
F 3 "" H 4800 1550 60  0000 C CNN
	1    4800 1550
	1    0    0    -1  
$EndComp
Text Label 5900 1500 0    60   ~ 0
nRST
Text Label 5900 1200 0    60   ~ 0
SWDCLK
Text Label 5900 1100 0    60   ~ 0
SWDIO
NoConn ~ 5800 1300
NoConn ~ 5800 1400
Text Label 3650 1300 0    60   ~ 0
SWDIO
Text Label 3650 1400 0    60   ~ 0
SWDCLK
Text Label 4150 5200 0    60   ~ 0
THERMO
Text Label 2150 2700 2    60   ~ 0
THERMO
Text Label 2150 3200 2    60   ~ 0
PIEZO
Text Label 3650 900  0    60   ~ 0
WIFI_RX
Text Label 3650 1000 0    60   ~ 0
WIFI_TX
Text Label 5550 2550 0    60   ~ 0
WIFI_RX
Text Label 5550 2450 0    60   ~ 0
WIFI_TX
Text Label 3650 1100 0    60   ~ 0
USB_DM
Text Label 3650 1200 0    60   ~ 0
USB_DP
Text Label 7000 2650 2    60   ~ 0
USB_DM
Text Label 7000 2750 2    60   ~ 0
USB_DP
$Comp
L GND #PWR19
U 1 1 54D13608
P 7050 3000
F 0 "#PWR19" H 7050 2750 60  0001 C CNN
F 1 "GND" H 7050 2850 60  0000 C CNN
F 2 "" H 7050 3000 60  0000 C CNN
F 3 "" H 7050 3000 60  0000 C CNN
	1    7050 3000
	1    0    0    -1  
$EndComp
Text Label 2150 3300 2    60   ~ 0
ENC_A
Text Label 2150 3400 2    60   ~ 0
ENC_B
Text Label 8000 1150 0    60   ~ 0
ENC_A
Text Label 8000 1350 0    60   ~ 0
ENC_B
$Comp
L GND #PWR18
U 1 1 54D13E93
P 4750 2800
F 0 "#PWR18" H 4750 2550 60  0001 C CNN
F 1 "GND" H 4750 2650 60  0000 C CNN
F 2 "" H 4750 2800 60  0000 C CNN
F 3 "" H 4750 2800 60  0000 C CNN
	1    4750 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 54D13FE6
P 8500 1300
F 0 "#PWR5" H 8500 1050 60  0001 C CNN
F 1 "GND" H 8500 1150 60  0000 C CNN
F 2 "" H 8500 1300 60  0000 C CNN
F 3 "" H 8500 1300 60  0000 C CNN
	1    8500 1300
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR9
U 1 1 54D1423E
P 6850 1550
F 0 "#PWR9" H 6850 1400 60  0001 C CNN
F 1 "VDD" H 6850 1700 60  0000 C CNN
F 2 "" H 6850 1550 60  0000 C CNN
F 3 "" H 6850 1550 60  0000 C CNN
	1    6850 1550
	0    -1   -1   0   
$EndComp
Text Label 9300 1600 2    60   ~ 0
PIEZO
$Comp
L NPN Q1
U 1 1 54D14719
P 10200 1600
F 0 "Q1" H 10200 1450 50  0000 R CNN
F 1 "NPN" H 10200 1750 50  0000 R CNN
F 2 "" H 10200 1600 60  0000 C CNN
F 3 "" H 10200 1600 60  0000 C CNN
	1    10200 1600
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 54D147CC
P 9650 1600
F 0 "R2" V 9730 1600 50  0000 C CNN
F 1 "R" V 9657 1601 50  0000 C CNN
F 2 "" V 9580 1600 30  0000 C CNN
F 3 "" H 9650 1600 30  0000 C CNN
	1    9650 1600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR11
U 1 1 54D148B3
P 10300 1850
F 0 "#PWR11" H 10300 1600 60  0001 C CNN
F 1 "GND" H 10300 1700 60  0000 C CNN
F 2 "" H 10300 1850 60  0000 C CNN
F 3 "" H 10300 1850 60  0000 C CNN
	1    10300 1850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR4
U 1 1 54D149F6
P 10300 1050
F 0 "#PWR4" H 10300 900 60  0001 C CNN
F 1 "VCC" H 10300 1200 60  0000 C CNN
F 2 "" H 10300 1050 60  0000 C CNN
F 3 "" H 10300 1050 60  0000 C CNN
	1    10300 1050
	1    0    0    -1  
$EndComp
Text Label 6850 1150 2    60   ~ 0
ENC_RED
Text Label 6850 1250 2    60   ~ 0
ENC_GRN
Text Label 6850 1350 2    60   ~ 0
ENC_BLU
Text Label 6850 1450 2    60   ~ 0
ENC_SW
Text Label 3650 3100 0    60   ~ 0
ENC_RED
Text Label 3650 3200 0    60   ~ 0
ENC_GRN
Text Label 3650 3300 0    60   ~ 0
ENC_BLU
Text Label 2150 3100 2    60   ~ 0
ENC_SW
Text Label 2150 3000 2    60   ~ 0
SYNC
Text Label 2150 2800 2    60   ~ 0
CURRENT
Text Label 3650 800  0    60   ~ 0
RELAY
Text Label 3650 1500 0    60   ~ 0
TRIAC
Text Label 10250 4200 2    60   ~ 0
OLED_D0
Text Label 10250 4300 2    60   ~ 0
OLED_D1
Text Label 10250 4400 2    60   ~ 0
OLED_D2
Text Label 10250 4500 2    60   ~ 0
OLED_D3
Text Label 10250 4600 2    60   ~ 0
OLED_D4
Text Label 10250 4700 2    60   ~ 0
OLED_D5
Text Label 10250 4800 2    60   ~ 0
OLED_D6
Text Label 10250 4900 2    60   ~ 0
OLED_D7
Text Label 3650 1700 0    60   ~ 0
OLED_D0
Text Label 3650 1800 0    60   ~ 0
OLED_D1
Text Label 3650 1900 0    60   ~ 0
OLED_D2
Text Label 3650 2000 0    60   ~ 0
OLED_D3
Text Label 3650 2100 0    60   ~ 0
OLED_D4
Text Label 3650 2200 0    60   ~ 0
OLED_D5
Text Label 3650 2300 0    60   ~ 0
OLED_D6
Text Label 3650 2400 0    60   ~ 0
OLED_D7
Text Label 10250 3700 2    60   ~ 0
OLED_CS
Text Label 10250 3800 2    60   ~ 0
OLED_RES
Text Label 10250 3900 2    60   ~ 0
OLED_D/C
Text Label 10250 4000 2    60   ~ 0
OLED_R/W
Text Label 10250 4100 2    60   ~ 0
OLED_E/RD
Text Label 3650 2600 0    60   ~ 0
OLED_CS
Text Label 3650 2700 0    60   ~ 0
OLED_RES
Text Label 3650 2800 0    60   ~ 0
OLED_D/C
Text Label 3650 2900 0    60   ~ 0
OLED_R/W
Text Label 3650 3000 0    60   ~ 0
OLED_E/RD
NoConn ~ 2250 2900
NoConn ~ 7100 2850
NoConn ~ 8100 2550
NoConn ~ 8100 2650
NoConn ~ 8100 2850
NoConn ~ 8100 2950
Text Notes 4200 1600 3    60   ~ 0
Check PB[0:7] DMA
Text Notes 5550 4550 0    60   ~ 0
+5V from USB here so can be shorted to\nVCC for development, leave NC on power
Text Notes 5650 3700 0    60   ~ 0
Check SYNC, CURRENT, RELAY, TRIAC\nvoltage levels/specs\n(might need biasing on SYNC)
Text Notes 3550 3550 0    60   ~ 0
Check TIM1_CH[1:3]N\nOK for PWM
Text Notes 6600 2300 0    60   ~ 0
add USB protection circuitry?
Text Notes 1100 3000 0    60   ~ 0
Check SYNC OK\nwith COMP here
Text Notes 700  3300 0    60   ~ 0
Check TIM3_CH[1:2] OK\nfor rotary encoder
$Comp
L C C2
U 1 1 54D1D963
P 950 1050
F 0 "C2" H 1000 1150 50  0000 L CNN
F 1 "4µ7" H 1000 950 50  0000 L CNN
F 2 "" H 988 900 30  0000 C CNN
F 3 "" H 950 1050 60  0000 C CNN
	1    950  1050
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 54D1E2D0
P 1550 1050
F 0 "C5" H 1600 1150 50  0000 L CNN
F 1 "100n" H 1600 950 50  0000 L CNN
F 2 "" H 1588 900 30  0000 C CNN
F 3 "" H 1550 1050 60  0000 C CNN
	1    1550 1050
	1    0    0    -1  
$EndComp
Text Notes 9000 2750 0    60   ~ 0
Consider 4wire SPI instead\n(might DMA better wrt clocks)\n\nThink about display interface,\n68xx or 80xx?
Text Notes 9150 1250 0    60   ~ 0
Spec transistor driving
Text Notes 5700 4800 0    60   ~ 0
Assumes 5V from power, but\nmaybe we need 12V for OLED
Text Notes 2550 5950 0    60   ~ 0
This is probably all OK
Text Notes 9050 5750 1    60   ~ 0
IREF might want\nchanging for 5V VCC
Text Notes 550  3750 0    100  ~ 0
MICROCONTROLLER
Text Notes 4650 2050 0    100  ~ 0
SWD
Text Notes 6450 2050 0    100  ~ 0
ROTARY ENCODER
Text Notes 8700 2150 0    100  ~ 0
PIEZO SOUNDER
Text Notes 8700 6400 0    100  ~ 0
OLED SCREEN
Text Notes 550  6400 0    100  ~ 0
THERMOCOUPLE
Text Notes 4650 3200 0    100  ~ 0
WIFI
Text Notes 6050 3200 0    100  ~ 0
USB
Text Notes 4650 5000 0    100  ~ 0
POWER BOARD
$Comp
L ADP3335 IC3
U 1 1 54D25BCE
P 6350 5650
F 0 "IC3" H 6150 5350 60  0000 C CNN
F 1 "ADP3335" H 6300 5850 60  0000 C CNN
F 2 "" H 6750 5250 60  0000 C CNN
F 3 "" H 6750 5250 60  0000 C CNN
	1    6350 5650
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 54D25C39
P 5700 5800
F 0 "C23" H 5750 5900 50  0000 L CNN
F 1 "2µ2" H 5750 5700 50  0000 L CNN
F 2 "" H 5738 5650 30  0000 C CNN
F 3 "" H 5700 5800 60  0000 C CNN
	1    5700 5800
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 54D25D98
P 6950 5800
F 0 "C24" H 7000 5900 50  0000 L CNN
F 1 "1n" H 7000 5700 50  0000 L CNN
F 2 "" H 6988 5650 30  0000 C CNN
F 3 "" H 6950 5800 60  0000 C CNN
	1    6950 5800
	1    0    0    -1  
$EndComp
$Comp
L C C25
U 1 1 54D25FC3
P 7200 5800
F 0 "C25" H 7250 5900 50  0000 L CNN
F 1 "2µ2" H 7250 5700 50  0000 L CNN
F 2 "" H 7238 5650 30  0000 C CNN
F 3 "" H 7200 5800 60  0000 C CNN
	1    7200 5800
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 54D26038
P 7450 5800
F 0 "C26" H 7500 5900 50  0000 L CNN
F 1 "10µ" H 7500 5700 50  0000 L CNN
F 2 "" H 7488 5650 30  0000 C CNN
F 3 "" H 7450 5800 60  0000 C CNN
	1    7450 5800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR33
U 1 1 54D2616F
P 5600 5500
F 0 "#PWR33" H 5600 5350 60  0001 C CNN
F 1 "VCC" H 5600 5650 60  0000 C CNN
F 2 "" H 5600 5500 60  0000 C CNN
F 3 "" H 5600 5500 60  0000 C CNN
	1    5600 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR42
U 1 1 54D26585
P 5700 6050
F 0 "#PWR42" H 5700 5800 60  0001 C CNN
F 1 "GND" H 5700 5900 60  0000 C CNN
F 2 "" H 5700 6050 60  0000 C CNN
F 3 "" H 5700 6050 60  0000 C CNN
	1    5700 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR39
U 1 1 54D26706
P 5950 5900
F 0 "#PWR39" H 5950 5650 60  0001 C CNN
F 1 "GND" H 5950 5750 60  0000 C CNN
F 2 "" H 5950 5900 60  0000 C CNN
F 3 "" H 5950 5900 60  0000 C CNN
	1    5950 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR43
U 1 1 54D274D2
P 7200 6050
F 0 "#PWR43" H 7200 5800 60  0001 C CNN
F 1 "GND" H 7200 5900 60  0000 C CNN
F 2 "" H 7200 6050 60  0000 C CNN
F 3 "" H 7200 6050 60  0000 C CNN
	1    7200 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR44
U 1 1 54D27668
P 7450 6050
F 0 "#PWR44" H 7450 5800 60  0001 C CNN
F 1 "GND" H 7450 5900 60  0000 C CNN
F 2 "" H 7450 6050 60  0000 C CNN
F 3 "" H 7450 6050 60  0000 C CNN
	1    7450 6050
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR34
U 1 1 54D27889
P 7500 5500
F 0 "#PWR34" H 7500 5350 60  0001 C CNN
F 1 "VDD" H 7500 5650 60  0000 C CNN
F 2 "" H 7500 5500 60  0000 C CNN
F 3 "" H 7500 5500 60  0000 C CNN
	1    7500 5500
	1    0    0    -1  
$EndComp
Text Notes 4650 6400 0    100  ~ 0
VOLTAGE REGULATION
$Comp
L R R1
U 1 1 54D298B1
P 7850 850
F 0 "R1" V 7930 850 50  0000 C CNN
F 1 "10k" V 7857 851 50  0000 C CNN
F 2 "" V 7780 850 30  0000 C CNN
F 3 "" H 7850 850 30  0000 C CNN
	1    7850 850 
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 54D29E22
P 7850 1650
F 0 "R3" V 7930 1650 50  0000 C CNN
F 1 "10k" V 7857 1651 50  0000 C CNN
F 2 "" V 7780 1650 30  0000 C CNN
F 3 "" H 7850 1650 30  0000 C CNN
	1    7850 1650
	-1   0    0    1   
$EndComp
$Comp
L C C8
U 1 1 54D29F7C
P 8200 1450
F 0 "C8" H 8250 1550 50  0000 L CNN
F 1 "100n" H 8250 1350 50  0000 L CNN
F 2 "" H 8238 1300 30  0000 C CNN
F 3 "" H 8200 1450 60  0000 C CNN
	1    8200 1450
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 54D2A0F2
P 8200 1000
F 0 "C1" H 8250 1100 50  0000 L CNN
F 1 "100n" H 8250 900 50  0000 L CNN
F 2 "" H 8238 850 30  0000 C CNN
F 3 "" H 8200 1000 60  0000 C CNN
	1    8200 1000
	0    -1   -1   0   
$EndComp
$Comp
L VDD #PWR13
U 1 1 54D2AABE
P 8000 1900
F 0 "#PWR13" H 8000 1750 60  0001 C CNN
F 1 "VDD" H 8000 2050 60  0000 C CNN
F 2 "" H 8000 1900 60  0000 C CNN
F 3 "" H 8000 1900 60  0000 C CNN
	1    8000 1900
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR1
U 1 1 54D2AC8B
P 8000 600
F 0 "#PWR1" H 8000 450 60  0001 C CNN
F 1 "VDD" H 8000 750 60  0000 C CNN
F 2 "" H 8000 600 60  0000 C CNN
F 3 "" H 8000 600 60  0000 C CNN
	1    8000 600 
	-1   0    0    1   
$EndComp
Wire Wire Line
	900  5150 850  5150
Wire Wire Line
	900  5050 900  5150
Wire Wire Line
	900  5100 950  5100
Connection ~ 900  5100
Wire Wire Line
	850  5250 900  5250
Wire Wire Line
	900  5250 900  5350
Wire Wire Line
	900  5300 950  5300
Connection ~ 900  5300
Wire Wire Line
	900  4800 900  4850
Wire Wire Line
	900  5550 900  5600
Wire Wire Line
	1450 5100 1500 5100
Wire Wire Line
	1500 5100 1500 4950
Wire Wire Line
	1500 4950 2050 4950
Wire Wire Line
	1700 4900 1700 5000
Connection ~ 1700 4950
Wire Wire Line
	1450 5300 1500 5300
Wire Wire Line
	1500 5300 1500 5450
Wire Wire Line
	1500 5450 2050 5450
Wire Wire Line
	1700 5400 1700 5500
Connection ~ 1700 5450
Wire Wire Line
	2050 5300 2050 5500
Wire Wire Line
	2050 5300 2200 5300
Connection ~ 2050 5450
Wire Wire Line
	1700 5900 1700 5950
Wire Wire Line
	1700 4500 1700 4450
Wire Wire Line
	2050 4950 2050 5100
Wire Wire Line
	2050 5100 2200 5100
Wire Wire Line
	2050 6000 2050 6050
Wire Wire Line
	2200 5450 2200 5500
Wire Wire Line
	3150 4700 3150 4800
Wire Wire Line
	2850 4700 2850 4750
Wire Wire Line
	2850 4750 3150 4750
Connection ~ 3150 4750
Wire Wire Line
	2650 4850 2650 4250
Wire Wire Line
	2650 4250 3200 4250
Wire Wire Line
	3150 4250 3150 4300
Wire Wire Line
	2850 4300 2850 4250
Connection ~ 2850 4250
Wire Wire Line
	2650 5550 2650 5600
Wire Wire Line
	3300 5200 3450 5200
Wire Wire Line
	3950 5200 4150 5200
Wire Wire Line
	4050 5200 4050 5250
Wire Wire Line
	4050 5650 4050 5700
Wire Wire Line
	1350 800  1350 850 
Wire Wire Line
	1550 800  1550 850 
Connection ~ 1550 800 
Wire Wire Line
	1750 800  1750 850 
Connection ~ 1750 800 
Wire Wire Line
	1950 800  1950 850 
Connection ~ 1950 800 
Wire Wire Line
	2200 800  2200 1100
Wire Wire Line
	2200 900  2250 900 
Connection ~ 2200 800 
Wire Wire Line
	2200 1000 2250 1000
Connection ~ 2200 900 
Wire Wire Line
	2200 1100 2250 1100
Connection ~ 2200 1000
Wire Wire Line
	1350 1300 1350 1250
Wire Wire Line
	950  1300 1950 1300
Wire Wire Line
	1650 1300 1650 1350
Wire Wire Line
	1550 1250 1550 1300
Connection ~ 1550 1300
Wire Wire Line
	1750 1300 1750 1250
Connection ~ 1650 1300
Wire Wire Line
	1950 1300 1950 1250
Connection ~ 1750 1300
Wire Wire Line
	2100 1300 2250 1300
Wire Wire Line
	2250 1400 2200 1400
Wire Wire Line
	2200 1300 2200 1600
Connection ~ 2200 1300
Wire Wire Line
	2200 1500 2250 1500
Connection ~ 2200 1400
Wire Wire Line
	2200 1600 2250 1600
Connection ~ 2200 1500
Wire Wire Line
	2100 1300 2100 1550
Wire Wire Line
	2250 1900 2150 1900
Wire Wire Line
	1900 1800 2250 1800
Wire Wire Line
	1500 1800 1450 1800
Wire Wire Line
	1450 1800 1450 1850
Wire Wire Line
	1950 1800 1950 1650
Wire Wire Line
	1950 1650 1550 1650
Connection ~ 1950 1800
Wire Wire Line
	600  2500 650  2500
Wire Wire Line
	600  2500 600  2550
Wire Wire Line
	650  1900 600  1900
Wire Wire Line
	600  1900 600  1950
Wire Wire Line
	1050 1900 1350 1900
Wire Wire Line
	1050 2500 1450 2500
Connection ~ 1100 2500
Wire Wire Line
	1950 2500 2250 2500
Wire Wire Line
	1350 1900 1350 2400
Wire Wire Line
	1350 2400 2250 2400
Connection ~ 1100 1900
Wire Wire Line
	10350 5300 10300 5300
Wire Wire Line
	10300 5300 10300 5350
Wire Wire Line
	10250 3000 10350 3000
Wire Wire Line
	10350 3100 10300 3100
Wire Wire Line
	10300 3000 10300 3200
Connection ~ 10300 3000
Wire Wire Line
	10300 3200 10350 3200
Connection ~ 10300 3100
Wire Wire Line
	9200 3400 10350 3400
Wire Wire Line
	9250 3400 9250 3450
Wire Wire Line
	9250 3850 9250 3950
Wire Wire Line
	9250 3900 9500 3900
Connection ~ 9250 3900
Wire Wire Line
	9600 5200 10350 5200
Wire Wire Line
	9700 5200 9700 5250
Wire Wire Line
	9950 5250 9950 5200
Connection ~ 9950 5200
Wire Wire Line
	9200 3350 9200 3400
Connection ~ 9250 3400
Connection ~ 1350 800 
Wire Wire Line
	3200 4250 3200 4200
Connection ~ 3150 4250
Wire Wire Line
	4800 1050 4800 1100
Wire Wire Line
	4800 1100 4850 1100
Wire Wire Line
	4750 2400 4750 2450
Wire Wire Line
	4750 2450 4800 2450
Wire Wire Line
	9600 5150 9600 5200
Connection ~ 9700 5200
Wire Wire Line
	10350 5100 9750 5100
Wire Wire Line
	9750 5100 9750 4900
Wire Wire Line
	9750 4900 9450 4900
Wire Wire Line
	9450 4900 9450 5250
Wire Wire Line
	10350 5000 9800 5000
Wire Wire Line
	9800 5000 9800 4850
Wire Wire Line
	9800 4850 9200 4850
Wire Wire Line
	9200 4850 9200 5150
Wire Wire Line
	9700 5650 9700 5750
Wire Wire Line
	9450 5650 9450 5700
Wire Wire Line
	9200 5700 9950 5700
Connection ~ 9700 5700
Wire Wire Line
	9950 5700 9950 5650
Connection ~ 9450 5700
Wire Wire Line
	9200 5650 9200 5700
Wire Wire Line
	5850 3900 6200 3900
Wire Wire Line
	6100 4200 6200 4200
Wire Wire Line
	7050 2500 7050 2550
Wire Wire Line
	7050 2550 7100 2550
Wire Wire Line
	6700 4200 6800 4200
Wire Wire Line
	6700 3900 6850 3900
Wire Wire Line
	6700 4000 6850 4000
Wire Wire Line
	6200 4000 6050 4000
Wire Wire Line
	6200 4100 6050 4100
Wire Wire Line
	4800 1500 4850 1500
Wire Wire Line
	4800 1200 4800 1550
Wire Wire Line
	4850 1300 4800 1300
Connection ~ 4800 1500
Wire Wire Line
	4850 1200 4800 1200
Connection ~ 4800 1300
Wire Wire Line
	5800 1500 5900 1500
Wire Wire Line
	5800 1200 5900 1200
Wire Wire Line
	5800 1100 5900 1100
Wire Wire Line
	3650 1400 3550 1400
Wire Wire Line
	3550 1300 3650 1300
Connection ~ 4050 5200
Wire Wire Line
	2150 2700 2250 2700
Wire Wire Line
	2150 3100 2250 3100
Wire Wire Line
	5450 2450 5550 2450
Wire Wire Line
	5450 2550 5550 2550
Wire Wire Line
	3650 1000 3550 1000
Wire Wire Line
	3650 900  3550 900 
Wire Wire Line
	3550 1100 3650 1100
Wire Wire Line
	3550 1200 3650 1200
Wire Wire Line
	7000 2650 7100 2650
Wire Wire Line
	7000 2750 7100 2750
Wire Wire Line
	7100 2950 7050 2950
Wire Wire Line
	7050 2950 7050 3000
Wire Wire Line
	2150 3300 2250 3300
Wire Wire Line
	2150 3400 2250 3400
Wire Wire Line
	7800 1150 8000 1150
Wire Wire Line
	7800 1350 8000 1350
Wire Wire Line
	4800 2550 4750 2550
Wire Wire Line
	4750 2550 4750 2800
Wire Wire Line
	7800 1250 8500 1250
Wire Wire Line
	6850 1550 6950 1550
Wire Wire Line
	10300 1050 10300 1100
Wire Wire Line
	10300 1100 10400 1100
Wire Wire Line
	10400 1300 10300 1300
Wire Wire Line
	10300 1300 10300 1400
Wire Wire Line
	9900 1600 10000 1600
Wire Wire Line
	10300 1800 10300 1850
Wire Wire Line
	9300 1600 9400 1600
Wire Wire Line
	6850 1150 6950 1150
Wire Wire Line
	6850 1250 6950 1250
Wire Wire Line
	6850 1350 6950 1350
Wire Wire Line
	6850 1450 6950 1450
Wire Wire Line
	10250 4900 10350 4900
Wire Wire Line
	10250 4800 10350 4800
Wire Wire Line
	10250 4700 10350 4700
Wire Wire Line
	10250 4600 10350 4600
Wire Wire Line
	10250 4500 10350 4500
Wire Wire Line
	10250 4400 10350 4400
Wire Wire Line
	10250 4300 10350 4300
Wire Wire Line
	10250 4200 10350 4200
Wire Wire Line
	10250 3700 10350 3700
Wire Wire Line
	10250 3800 10350 3800
Wire Wire Line
	10250 3900 10350 3900
Wire Wire Line
	10250 4000 10350 4000
Wire Wire Line
	10250 4100 10350 4100
Wire Wire Line
	9500 3900 9500 3850
Wire Wire Line
	9500 3450 9500 3400
Connection ~ 9500 3400
Wire Wire Line
	2150 2800 2250 2800
Wire Wire Line
	2150 3000 2250 3000
Wire Wire Line
	2150 3200 2250 3200
Wire Wire Line
	3550 1500 3650 1500
Wire Wire Line
	3550 800  3650 800 
Wire Wire Line
	3550 1700 3650 1700
Wire Wire Line
	3550 1800 3650 1800
Wire Wire Line
	3550 1900 3650 1900
Wire Wire Line
	3550 2000 3650 2000
Wire Wire Line
	3550 2100 3650 2100
Wire Wire Line
	3550 2200 3650 2200
Wire Wire Line
	3550 2300 3650 2300
Wire Wire Line
	3550 2400 3650 2400
Wire Wire Line
	3550 2600 3650 2600
Wire Wire Line
	3550 2700 3650 2700
Wire Wire Line
	3550 2800 3650 2800
Wire Wire Line
	3550 2900 3650 2900
Wire Wire Line
	3550 3000 3650 3000
Wire Wire Line
	3550 3100 3650 3100
Wire Wire Line
	3550 3200 3650 3200
Wire Wire Line
	3550 3300 3650 3300
Wire Wire Line
	10250 3600 10350 3600
Wire Wire Line
	10250 3400 10250 3600
Connection ~ 10250 3400
Wire Wire Line
	10350 3500 10250 3500
Connection ~ 10250 3500
Wire Wire Line
	900  800  2250 800 
Wire Wire Line
	1150 800  1150 850 
Wire Wire Line
	1150 1300 1150 1250
Connection ~ 1350 1300
Connection ~ 1150 800 
Wire Wire Line
	950  800  950  850 
Wire Wire Line
	950  1250 950  1300
Connection ~ 1150 1300
Wire Wire Line
	900  800  900  750 
Connection ~ 950  800 
Wire Notes Line
	500  3800 4550 3800
Wire Notes Line
	4550 500  500  500 
Wire Notes Line
	4550 3800 4550 500 
Wire Notes Line
	500  500  500  3800
Wire Notes Line
	6350 500  4600 500 
Wire Notes Line
	8650 500  11200 500 
Wire Notes Line
	11200 500  11200 2200
Wire Notes Line
	11200 2200 8650 2200
Wire Notes Line
	8650 2200 8650 500 
Wire Notes Line
	8650 2250 11200 2250
Wire Notes Line
	11200 6450 8650 6450
Wire Notes Line
	11200 2250 11200 6450
Wire Notes Line
	8650 6450 8650 2250
Wire Notes Line
	4600 2150 4600 3250
Wire Notes Line
	8600 2150 8600 3250
Wire Notes Line
	4600 3300 4600 5050
Wire Notes Line
	4600 5050 8600 5050
Wire Notes Line
	8600 5050 8600 3300
Wire Notes Line
	8600 3300 4600 3300
Wire Notes Line
	500  3850 4550 3850
Wire Notes Line
	4550 3850 4550 6450
Wire Notes Line
	4550 6450 500  6450
Wire Notes Line
	500  6450 500  3850
Wire Wire Line
	5600 5500 5600 5550
Wire Wire Line
	5600 5550 6000 5550
Wire Wire Line
	5700 5600 5700 5550
Connection ~ 5700 5550
Wire Wire Line
	5700 6000 5700 6050
Wire Wire Line
	6000 5850 5950 5850
Wire Wire Line
	5950 5850 5950 5900
Wire Wire Line
	6000 5650 5950 5650
Wire Wire Line
	5950 5550 5950 5750
Connection ~ 5950 5550
Wire Wire Line
	5950 5750 6000 5750
Connection ~ 5950 5650
Wire Wire Line
	6700 5850 6700 6000
Wire Wire Line
	6700 6000 6950 6000
Wire Wire Line
	6700 5550 7500 5550
Wire Wire Line
	6950 5550 6950 5600
Wire Wire Line
	6700 5750 6750 5750
Wire Wire Line
	6750 5750 6750 5550
Connection ~ 6750 5550
Wire Wire Line
	6700 5650 6750 5650
Connection ~ 6750 5650
Wire Wire Line
	7200 5550 7200 5600
Connection ~ 6950 5550
Wire Wire Line
	7450 5550 7450 5600
Connection ~ 7200 5550
Wire Wire Line
	7200 6000 7200 6050
Wire Wire Line
	7450 6000 7450 6050
Wire Wire Line
	7500 5550 7500 5500
Connection ~ 7450 5550
Wire Notes Line
	8600 6450 4600 6450
Wire Wire Line
	7850 1100 7850 1150
Connection ~ 7850 1150
Wire Wire Line
	7850 1350 7850 1400
Connection ~ 7850 1350
Wire Wire Line
	7850 600  8000 600 
Wire Wire Line
	7850 1900 8000 1900
Wire Wire Line
	8000 1000 7950 1000
Wire Wire Line
	7950 1000 7950 1150
Connection ~ 7950 1150
Wire Wire Line
	8000 1450 7950 1450
Wire Wire Line
	7950 1450 7950 1350
Connection ~ 7950 1350
Wire Wire Line
	8400 1000 8400 1450
Connection ~ 8400 1250
Wire Notes Line
	8600 6450 8600 5100
Wire Notes Line
	8600 5100 4600 5100
Wire Notes Line
	4600 5100 4600 6450
Wire Notes Line
	4600 2150 5950 2150
Wire Notes Line
	5950 2150 5950 3250
Wire Notes Line
	5950 3250 4600 3250
Wire Notes Line
	8600 3250 6000 3250
Wire Notes Line
	6000 3250 6000 2150
Wire Notes Line
	6000 2150 8600 2150
Wire Notes Line
	4600 500  4600 2100
Wire Notes Line
	4600 2100 6350 2100
Wire Notes Line
	6350 2100 6350 500 
Wire Notes Line
	6400 500  8600 500 
Wire Notes Line
	8600 500  8600 2100
Wire Notes Line
	8600 2100 6400 2100
Wire Notes Line
	6400 2100 6400 500 
Wire Wire Line
	8500 1250 8500 1300
Text Notes 6100 2550 0    60   ~ 0
no need for\nDP/DM resistors
Text Notes 6500 750  0    60   ~ 0
reconsider the 100n Cs
$EndSCHEMATC
