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
LIBS:er-oledm024-2
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
P 3150 2350
F 0 "IC1" H 2700 650 60  0000 C CNN
F 1 "STM32F072CBT6" H 3000 3450 60  0000 C CNN
F 2 "" H 3100 2350 60  0000 C CNN
F 3 "" H 3100 2350 60  0000 C CNN
	1    3150 2350
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
P 650 6450
F 0 "P3" H 650 6600 50  0000 C CNN
F 1 "CONN_01X02" V 750 6450 50  0000 C CNN
F 2 "" H 650 6450 60  0000 C CNN
F 3 "" H 650 6450 60  0000 C CNN
	1    650  6450
	-1   0    0    1   
$EndComp
$Comp
L AD8495 IC2
U 1 1 54CFFF5A
P 2650 6450
F 0 "IC2" H 2850 6700 60  0000 C CNN
F 1 "AD8495" H 2900 6200 60  0000 C CNN
F 2 "" H 2650 6450 60  0000 C CNN
F 3 "" H 2650 6450 60  0000 C CNN
	1    2650 6450
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
L CGA0402MLC-12G D1
U 1 1 54D01279
P 900 6100
F 0 "D1" H 1000 6000 60  0000 C CNN
F 1 "CGA0402MLC-12G" H 1000 6210 60  0001 C CNN
F 2 "" H 900 6100 60  0000 C CNN
F 3 "" H 900 6100 60  0000 C CNN
	1    900  6100
	0    1    1    0   
$EndComp
$Comp
L CGA0402MLC-12G D2
U 1 1 54D013F6
P 900 6600
F 0 "D2" H 1000 6500 60  0000 C CNN
F 1 "CGA0402MLC-12G" H 1000 6710 60  0001 C CNN
F 2 "" H 900 6600 60  0000 C CNN
F 3 "" H 900 6600 60  0000 C CNN
	1    900  6600
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 54D015F8
P 1200 6350
F 0 "R5" V 1280 6350 50  0000 C CNN
F 1 "1k" V 1207 6351 50  0000 C CNN
F 2 "" V 1130 6350 30  0000 C CNN
F 3 "" H 1200 6350 30  0000 C CNN
	1    1200 6350
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 54D01636
P 1200 6550
F 0 "R7" V 1280 6550 50  0000 C CNN
F 1 "1k" V 1207 6551 50  0000 C CNN
F 2 "" V 1130 6550 30  0000 C CNN
F 3 "" H 1200 6550 30  0000 C CNN
	1    1200 6550
	0    1    1    0   
$EndComp
$Comp
L C C17
U 1 1 54D01666
P 1700 6450
F 0 "C17" H 1750 6550 50  0000 L CNN
F 1 "1µ" H 1750 6350 50  0000 L CNN
F 2 "" H 1738 6300 30  0000 C CNN
F 3 "" H 1700 6450 60  0000 C CNN
	1    1700 6450
	1    0    0    -1  
$EndComp
$Comp
L C C16
U 1 1 54D0169F
P 1700 5950
F 0 "C16" H 1750 6050 50  0000 L CNN
F 1 "100n" H 1750 5850 50  0000 L CNN
F 2 "" H 1738 5800 30  0000 C CNN
F 3 "" H 1700 5950 60  0000 C CNN
	1    1700 5950
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 54D016D3
P 1700 6950
F 0 "C22" H 1750 7050 50  0000 L CNN
F 1 "100n" H 1750 6850 50  0000 L CNN
F 2 "" H 1738 6800 30  0000 C CNN
F 3 "" H 1700 6950 60  0000 C CNN
	1    1700 6950
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 54D0171F
P 2050 7000
F 0 "R9" V 2130 7000 50  0000 C CNN
F 1 "1M" V 2057 7001 50  0000 C CNN
F 2 "" V 1980 7000 30  0000 C CNN
F 3 "" H 2050 7000 30  0000 C CNN
	1    2050 7000
	-1   0    0    1   
$EndComp
$Comp
L C C14
U 1 1 54D0178D
P 2850 5750
F 0 "C14" H 2900 5850 50  0000 L CNN
F 1 "100n" H 2900 5650 50  0000 L CNN
F 2 "" H 2888 5600 30  0000 C CNN
F 3 "" H 2850 5750 60  0000 C CNN
	1    2850 5750
	1    0    0    -1  
$EndComp
$Comp
L C C15
U 1 1 54D017E2
P 3150 5750
F 0 "C15" H 3200 5850 50  0000 L CNN
F 1 "10µ" H 3200 5650 50  0000 L CNN
F 2 "" H 3188 5600 30  0000 C CNN
F 3 "" H 3150 5750 60  0000 C CNN
	1    3150 5750
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 54D032F8
P 3700 6450
F 0 "R6" V 3780 6450 50  0000 C CNN
F 1 "10k" V 3707 6451 50  0000 C CNN
F 2 "" V 3630 6450 30  0000 C CNN
F 3 "" H 3700 6450 30  0000 C CNN
	1    3700 6450
	0    1    1    0   
$EndComp
$Comp
L C C18
U 1 1 54D033E8
P 4050 6700
F 0 "C18" H 4100 6800 50  0000 L CNN
F 1 "1µ" H 4100 6600 50  0000 L CNN
F 2 "" H 4088 6550 30  0000 C CNN
F 3 "" H 4050 6700 60  0000 C CNN
	1    4050 6700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR35
U 1 1 54D03572
P 900 6850
F 0 "#PWR35" H 900 6600 60  0001 C CNN
F 1 "GND" H 900 6700 60  0000 C CNN
F 2 "" H 900 6850 60  0000 C CNN
F 3 "" H 900 6850 60  0000 C CNN
	1    900  6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR28
U 1 1 54D035F2
P 900 6050
F 0 "#PWR28" H 900 5800 60  0001 C CNN
F 1 "GND" H 900 5900 60  0000 C CNN
F 2 "" H 900 6050 60  0000 C CNN
F 3 "" H 900 6050 60  0000 C CNN
	1    900  6050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR27
U 1 1 54D03D82
P 1700 5700
F 0 "#PWR27" H 1700 5450 60  0001 C CNN
F 1 "GND" H 1700 5550 60  0000 C CNN
F 2 "" H 1700 5700 60  0000 C CNN
F 3 "" H 1700 5700 60  0000 C CNN
	1    1700 5700
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR40
U 1 1 54D03DA3
P 1700 7200
F 0 "#PWR40" H 1700 6950 60  0001 C CNN
F 1 "GND" H 1700 7050 60  0000 C CNN
F 2 "" H 1700 7200 60  0000 C CNN
F 3 "" H 1700 7200 60  0000 C CNN
	1    1700 7200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR41
U 1 1 54D03ED9
P 2050 7300
F 0 "#PWR41" H 2050 7050 60  0001 C CNN
F 1 "GND" H 2050 7150 60  0000 C CNN
F 2 "" H 2050 7300 60  0000 C CNN
F 3 "" H 2050 7300 60  0000 C CNN
	1    2050 7300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR32
U 1 1 54D03FC7
P 2200 6750
F 0 "#PWR32" H 2200 6500 60  0001 C CNN
F 1 "GND" H 2200 6600 60  0000 C CNN
F 2 "" H 2200 6750 60  0000 C CNN
F 3 "" H 2200 6750 60  0000 C CNN
	1    2200 6750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR29
U 1 1 54D040B6
P 3150 6050
F 0 "#PWR29" H 3150 5800 60  0001 C CNN
F 1 "GND" H 3150 5900 60  0000 C CNN
F 2 "" H 3150 6050 60  0000 C CNN
F 3 "" H 3150 6050 60  0000 C CNN
	1    3150 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR36
U 1 1 54D0436B
P 2650 6850
F 0 "#PWR36" H 2650 6600 60  0001 C CNN
F 1 "GND" H 2650 6700 60  0000 C CNN
F 2 "" H 2650 6850 60  0000 C CNN
F 3 "" H 2650 6850 60  0000 C CNN
	1    2650 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR37
U 1 1 54D04449
P 4050 6950
F 0 "#PWR37" H 4050 6700 60  0001 C CNN
F 1 "GND" H 4050 6800 60  0000 C CNN
F 2 "" H 4050 6950 60  0000 C CNN
F 3 "" H 4050 6950 60  0000 C CNN
	1    4050 6950
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 54D055AB
P 1400 1600
F 0 "C3" H 1450 1700 50  0000 L CNN
F 1 "4µ7" H 1450 1500 50  0000 L CNN
F 2 "" H 1438 1450 30  0000 C CNN
F 3 "" H 1400 1600 60  0000 C CNN
	1    1400 1600
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 54D0579F
P 1600 1600
F 0 "C4" H 1650 1700 50  0000 L CNN
F 1 "1µ" H 1650 1500 50  0000 L CNN
F 2 "" H 1638 1450 30  0000 C CNN
F 3 "" H 1600 1600 60  0000 C CNN
	1    1600 1600
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 54D057CF
P 2000 1600
F 0 "C6" H 2050 1700 50  0000 L CNN
F 1 "100n" H 2050 1500 50  0000 L CNN
F 2 "" H 2038 1450 30  0000 C CNN
F 3 "" H 2000 1600 60  0000 C CNN
	1    2000 1600
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 54D05800
P 2200 1600
F 0 "C7" H 2250 1700 50  0000 L CNN
F 1 "10n" H 2250 1500 50  0000 L CNN
F 2 "" H 2238 1450 30  0000 C CNN
F 3 "" H 2200 1600 60  0000 C CNN
	1    2200 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 54D05D18
P 1900 1900
F 0 "#PWR6" H 1900 1650 60  0001 C CNN
F 1 "GND" H 1900 1750 60  0000 C CNN
F 2 "" H 1900 1900 60  0000 C CNN
F 3 "" H 1900 1900 60  0000 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 54D06073
P 2350 2100
F 0 "#PWR7" H 2350 1850 60  0001 C CNN
F 1 "GND" H 2350 1950 60  0000 C CNN
F 2 "" H 2350 2100 60  0000 C CNN
F 3 "" H 2350 2100 60  0000 C CNN
	1    2350 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR12
U 1 1 54D06450
P 2400 2450
F 0 "#PWR12" H 2400 2200 60  0001 C CNN
F 1 "GND" H 2400 2300 60  0000 C CNN
F 2 "" H 2400 2450 60  0000 C CNN
F 3 "" H 2400 2450 60  0000 C CNN
	1    2400 2450
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 54D064F7
P 1950 2350
F 0 "C9" H 2000 2450 50  0000 L CNN
F 1 "100n" H 2000 2250 50  0000 L CNN
F 2 "" H 1988 2200 30  0000 C CNN
F 3 "" H 1950 2350 60  0000 C CNN
	1    1950 2350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR10
U 1 1 54D065B8
P 1700 2400
F 0 "#PWR10" H 1700 2150 60  0001 C CNN
F 1 "GND" H 1700 2250 60  0000 C CNN
F 2 "" H 1700 2400 60  0000 C CNN
F 3 "" H 1700 2400 60  0000 C CNN
	1    1700 2400
	1    0    0    -1  
$EndComp
Text Label 1800 2200 0    60   ~ 0
nRST
$Comp
L CONN_02X04 P2
U 1 1 54D06BFB
P 7150 4150
F 0 "P2" H 7150 4400 50  0000 C CNN
F 1 "CONN_02X04" H 7150 3900 50  0000 C CNN
F 2 "" H 7150 2950 60  0000 C CNN
F 3 "" H 7150 2950 60  0000 C CNN
	1    7150 4150
	1    0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 54D06E14
P 1500 3850
F 0 "X1" H 1500 4000 50  0000 C CNN
F 1 "8MHz" H 1500 3700 50  0000 C CNN
F 2 "" H 1500 3850 60  0000 C CNN
F 3 "" H 1500 3850 60  0000 C CNN
	1    1500 3850
	-1   0    0    1   
$EndComp
$Comp
L C C10
U 1 1 54D06F5C
P 1150 4250
F 0 "C10" H 1200 4350 50  0000 L CNN
F 1 "15p" H 1200 4150 50  0000 L CNN
F 2 "" H 1188 4100 30  0000 C CNN
F 3 "" H 1150 4250 60  0000 C CNN
	1    1150 4250
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 54D06FE0
P 1850 4250
F 0 "C11" H 1900 4350 50  0000 L CNN
F 1 "15p" H 1900 4150 50  0000 L CNN
F 2 "" H 1888 4100 30  0000 C CNN
F 3 "" H 1850 4250 60  0000 C CNN
	1    1850 4250
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 54D0713C
P 1850 3450
F 0 "R4" V 1930 3450 50  0000 C CNN
F 1 "100" V 1857 3451 50  0000 C CNN
F 2 "" V 1780 3450 30  0000 C CNN
F 3 "" H 1850 3450 30  0000 C CNN
	1    1850 3450
	-1   0    0    1   
$EndComp
NoConn ~ 2500 2650
$Comp
L VDD #PWR2
U 1 1 54D0CF33
P 1150 1300
F 0 "#PWR2" H 1150 1150 60  0001 C CNN
F 1 "VDD" H 1150 1450 60  0000 C CNN
F 2 "" H 1150 1300 60  0000 C CNN
F 3 "" H 1150 1300 60  0000 C CNN
	1    1150 1300
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR24
U 1 1 54D0D2A4
P 3200 5450
F 0 "#PWR24" H 3200 5300 60  0001 C CNN
F 1 "VDD" H 3200 5600 60  0000 C CNN
F 2 "" H 3200 5450 60  0000 C CNN
F 3 "" H 3200 5450 60  0000 C CNN
	1    3200 5450
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
L GND #PWR22
U 1 1 54D0F836
P 6550 4000
F 0 "#PWR22" H 6550 3750 60  0001 C CNN
F 1 "GND" H 6550 3850 60  0000 C CNN
F 2 "" H 6550 4000 60  0000 C CNN
F 3 "" H 6550 4000 60  0000 C CNN
	1    6550 4000
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR25
U 1 1 54D0FA8C
P 6800 4300
F 0 "#PWR25" H 6800 4150 60  0001 C CNN
F 1 "VCC" H 6800 4450 60  0000 C CNN
F 2 "" H 6800 4300 60  0000 C CNN
F 3 "" H 6800 4300 60  0000 C CNN
	1    6800 4300
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
P 7500 4300
F 0 "#PWR26" H 7500 4150 60  0001 C CNN
F 1 "+5V" H 7500 4440 60  0000 C CNN
F 2 "" H 7500 4300 60  0000 C CNN
F 3 "" H 7500 4300 60  0000 C CNN
	1    7500 4300
	0    1    1    0   
$EndComp
NoConn ~ 7400 4200
Text Label 7550 4000 0    60   ~ 0
RELAY
Text Label 7550 4100 0    60   ~ 0
TRIAC
Text Label 4850 4100 2    60   ~ 0
SYNC
Text Label 6750 4200 2    60   ~ 0
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
Text Label 3900 1850 0    60   ~ 0
SWDIO
Text Label 3900 1950 0    60   ~ 0
SWDCLK
Text Label 4150 6450 0    60   ~ 0
THERMO
Text Label 2400 3250 2    60   ~ 0
THERMO
Text Label 2400 3750 2    60   ~ 0
PIEZO
Text Label 3900 1450 0    60   ~ 0
WIFI_RX
Text Label 3900 1550 0    60   ~ 0
WIFI_TX
Text Label 5550 2550 0    60   ~ 0
WIFI_RX
Text Label 5550 2450 0    60   ~ 0
WIFI_TX
Text Label 3900 1650 0    60   ~ 0
USB_DM
Text Label 3900 1750 0    60   ~ 0
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
Text Label 2400 3850 2    60   ~ 0
ENC_A
Text Label 2400 3950 2    60   ~ 0
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
F 1 "100" V 9657 1601 50  0000 C CNN
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
Text Label 3900 3650 0    60   ~ 0
ENC_RED
Text Label 3900 3750 0    60   ~ 0
ENC_GRN
Text Label 3900 3850 0    60   ~ 0
ENC_BLU
Text Label 2400 3650 2    60   ~ 0
ENC_SW
Text Label 2400 3550 2    60   ~ 0
SYNC
Text Label 2400 3350 2    60   ~ 0
CURRENT
Text Label 3900 1350 0    60   ~ 0
RELAY
Text Label 3900 2050 0    60   ~ 0
TRIAC
Text Label 3900 2250 0    60   ~ 0
OLED_D0
Text Label 3900 2350 0    60   ~ 0
OLED_D1
Text Label 3900 2450 0    60   ~ 0
OLED_D2
Text Label 3900 2550 0    60   ~ 0
OLED_D3
Text Label 3900 2650 0    60   ~ 0
OLED_D4
Text Label 3900 2750 0    60   ~ 0
OLED_D5
Text Label 3900 2850 0    60   ~ 0
OLED_D6
Text Label 3900 2950 0    60   ~ 0
OLED_D7
Text Label 3900 3150 0    60   ~ 0
~OLED_CS
Text Label 3900 3350 0    60   ~ 0
OLED_D/C
Text Label 3900 3450 0    60   ~ 0
OLED_R/W
Text Label 3900 3550 0    60   ~ 0
OLED_E
NoConn ~ 2500 3450
NoConn ~ 7100 2850
NoConn ~ 8100 2550
NoConn ~ 8100 2650
NoConn ~ 8100 2850
NoConn ~ 8100 2950
Text Notes 6250 4650 0    60   ~ 0
+5V from USB here so can be shorted to\nVCC for development, leave NC on power board
Text Notes 6350 3800 0    60   ~ 0
Check SYNC, CURRENT, RELAY, TRIAC\nvoltage levels/specs
$Comp
L C C2
U 1 1 54D1D963
P 1200 1600
F 0 "C2" H 1250 1700 50  0000 L CNN
F 1 "4µ7" H 1250 1500 50  0000 L CNN
F 2 "" H 1238 1450 30  0000 C CNN
F 3 "" H 1200 1600 60  0000 C CNN
	1    1200 1600
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 54D1E2D0
P 1800 1600
F 0 "C5" H 1850 1700 50  0000 L CNN
F 1 "100n" H 1850 1500 50  0000 L CNN
F 2 "" H 1838 1450 30  0000 C CNN
F 3 "" H 1800 1600 60  0000 C CNN
	1    1800 1600
	1    0    0    -1  
$EndComp
Text Notes 9150 1250 0    60   ~ 0
Spec transistor driving
Text Notes 550  5050 0    100  ~ 0
MICROCONTROLLER
Text Notes 4650 2050 0    100  ~ 0
SWD
Text Notes 6450 2050 0    100  ~ 0
ROTARY ENCODER
Text Notes 8700 2150 0    100  ~ 0
PIEZO SOUNDER
Text Notes 8700 6400 0    100  ~ 0
OLED SCREEN
Text Notes 550  7650 0    100  ~ 0
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
$Comp
L BATTERY BT?
U 1 1 54D56B94
P 2150 950
F 0 "BT?" H 2150 1150 50  0000 C CNN
F 1 "BATTERY" H 2150 760 50  0000 C CNN
F 2 "" H 2150 950 60  0000 C CNN
F 3 "" H 2150 950 60  0000 C CNN
	1    2150 950 
	-1   0    0    1   
$EndComp
$Comp
L CRYSTAL X?
U 1 1 54D57457
P 1400 2800
F 0 "X?" H 1400 2950 50  0000 C CNN
F 1 "32k768" H 1400 2650 50  0000 C CNN
F 2 "" H 1400 2800 60  0000 C CNN
F 3 "" H 1400 2800 60  0000 C CNN
	1    1400 2800
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 54D575FE
P 1000 3150
F 0 "C?" H 1050 3250 50  0000 L CNN
F 1 "5p" H 1050 3050 50  0000 L CNN
F 2 "" H 1038 3000 30  0000 C CNN
F 3 "" H 1000 3150 60  0000 C CNN
	1    1000 3150
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 54D57653
P 1000 2450
F 0 "C?" H 1050 2550 50  0000 L CNN
F 1 "5p" H 1050 2350 50  0000 L CNN
F 2 "" H 1038 2300 30  0000 C CNN
F 3 "" H 1000 2450 60  0000 C CNN
	1    1000 2450
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 54D576BD
P 750 3200
F 0 "#PWR?" H 750 2950 60  0001 C CNN
F 1 "GND" H 750 3050 60  0000 C CNN
F 2 "" H 750 3200 60  0000 C CNN
F 3 "" H 750 3200 60  0000 C CNN
	1    750  3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 54D576FE
P 750 2500
F 0 "#PWR?" H 750 2250 60  0001 C CNN
F 1 "GND" H 750 2350 60  0000 C CNN
F 2 "" H 750 2500 60  0000 C CNN
F 3 "" H 750 2500 60  0000 C CNN
	1    750  2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  6400 850  6400
Wire Wire Line
	900  6300 900  6400
Wire Wire Line
	900  6350 950  6350
Connection ~ 900  6350
Wire Wire Line
	850  6500 900  6500
Wire Wire Line
	900  6500 900  6600
Wire Wire Line
	900  6550 950  6550
Connection ~ 900  6550
Wire Wire Line
	900  6050 900  6100
Wire Wire Line
	900  6800 900  6850
Wire Wire Line
	1450 6350 1500 6350
Wire Wire Line
	1500 6350 1500 6200
Wire Wire Line
	1500 6200 2050 6200
Wire Wire Line
	1700 6150 1700 6250
Connection ~ 1700 6200
Wire Wire Line
	1450 6550 1500 6550
Wire Wire Line
	1500 6550 1500 6700
Wire Wire Line
	1500 6700 2050 6700
Wire Wire Line
	1700 6650 1700 6750
Connection ~ 1700 6700
Wire Wire Line
	2050 6550 2050 6750
Wire Wire Line
	2050 6550 2200 6550
Connection ~ 2050 6700
Wire Wire Line
	1700 7150 1700 7200
Wire Wire Line
	1700 5750 1700 5700
Wire Wire Line
	2050 6200 2050 6350
Wire Wire Line
	2050 6350 2200 6350
Wire Wire Line
	2050 7250 2050 7300
Wire Wire Line
	2200 6700 2200 6750
Wire Wire Line
	3150 5950 3150 6050
Wire Wire Line
	2850 5950 2850 6000
Wire Wire Line
	2850 6000 3150 6000
Connection ~ 3150 6000
Wire Wire Line
	2650 6100 2650 5500
Wire Wire Line
	2650 5500 3200 5500
Wire Wire Line
	3150 5500 3150 5550
Wire Wire Line
	2850 5550 2850 5500
Connection ~ 2850 5500
Wire Wire Line
	2650 6800 2650 6850
Wire Wire Line
	3300 6450 3450 6450
Wire Wire Line
	3950 6450 4150 6450
Wire Wire Line
	4050 6450 4050 6500
Wire Wire Line
	4050 6900 4050 6950
Wire Wire Line
	1600 1350 1600 1400
Wire Wire Line
	1800 1350 1800 1400
Connection ~ 1800 1350
Wire Wire Line
	2000 1350 2000 1400
Connection ~ 2000 1350
Wire Wire Line
	2200 1350 2200 1400
Connection ~ 2200 1350
Wire Wire Line
	2350 1450 2500 1450
Wire Wire Line
	2450 1550 2500 1550
Connection ~ 2450 1450
Wire Wire Line
	2450 1650 2500 1650
Connection ~ 2450 1550
Wire Wire Line
	1600 1850 1600 1800
Wire Wire Line
	1200 1850 2200 1850
Wire Wire Line
	1900 1850 1900 1900
Wire Wire Line
	1800 1800 1800 1850
Connection ~ 1800 1850
Wire Wire Line
	2000 1850 2000 1800
Connection ~ 1900 1850
Wire Wire Line
	2200 1850 2200 1800
Connection ~ 2000 1850
Wire Wire Line
	2350 1850 2500 1850
Wire Wire Line
	2500 1950 2450 1950
Wire Wire Line
	2450 1850 2450 2150
Connection ~ 2450 1850
Wire Wire Line
	2450 2050 2500 2050
Connection ~ 2450 1950
Wire Wire Line
	2450 2150 2500 2150
Connection ~ 2450 2050
Wire Wire Line
	2350 1850 2350 2100
Wire Wire Line
	2500 2450 2400 2450
Wire Wire Line
	2150 2350 2500 2350
Wire Wire Line
	1750 2350 1700 2350
Wire Wire Line
	1700 2350 1700 2400
Wire Wire Line
	2200 2350 2200 2200
Wire Wire Line
	2200 2200 1800 2200
Connection ~ 2200 2350
Connection ~ 1600 1350
Wire Wire Line
	3200 5500 3200 5450
Connection ~ 3150 5500
Wire Wire Line
	4800 1050 4800 1100
Wire Wire Line
	4800 1100 4850 1100
Wire Wire Line
	4750 2400 4750 2450
Wire Wire Line
	4750 2450 4800 2450
Wire Wire Line
	6550 4000 6900 4000
Wire Wire Line
	6800 4300 6900 4300
Wire Wire Line
	7050 2500 7050 2550
Wire Wire Line
	7050 2550 7100 2550
Wire Wire Line
	7400 4300 7500 4300
Wire Wire Line
	7400 4000 7550 4000
Wire Wire Line
	7400 4100 7550 4100
Wire Wire Line
	6000 4100 6900 4100
Wire Wire Line
	6900 4200 6750 4200
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
	3900 1950 3800 1950
Wire Wire Line
	3800 1850 3900 1850
Connection ~ 4050 6450
Wire Wire Line
	2400 3250 2500 3250
Wire Wire Line
	2400 3650 2500 3650
Wire Wire Line
	5450 2450 5550 2450
Wire Wire Line
	5450 2550 5550 2550
Wire Wire Line
	3900 1550 3800 1550
Wire Wire Line
	3900 1450 3800 1450
Wire Wire Line
	3800 1650 3900 1650
Wire Wire Line
	3800 1750 3900 1750
Wire Wire Line
	7000 2650 7100 2650
Wire Wire Line
	7000 2750 7100 2750
Wire Wire Line
	7100 2950 7050 2950
Wire Wire Line
	7050 2950 7050 3000
Wire Wire Line
	2400 3850 2500 3850
Wire Wire Line
	2400 3950 2500 3950
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
	2400 3350 2500 3350
Wire Wire Line
	2400 3550 2500 3550
Wire Wire Line
	2400 3750 2500 3750
Wire Wire Line
	3800 2050 3900 2050
Wire Wire Line
	3800 1350 3900 1350
Wire Wire Line
	3800 2250 3900 2250
Wire Wire Line
	3800 2350 3900 2350
Wire Wire Line
	3800 2450 3900 2450
Wire Wire Line
	3800 2550 3900 2550
Wire Wire Line
	3800 2650 3900 2650
Wire Wire Line
	3800 2750 3900 2750
Wire Wire Line
	3800 2850 3900 2850
Wire Wire Line
	3800 2950 3900 2950
Wire Wire Line
	3800 3150 3900 3150
Wire Wire Line
	3800 3250 3900 3250
Wire Wire Line
	3800 3350 3900 3350
Wire Wire Line
	3800 3450 3900 3450
Wire Wire Line
	3800 3550 3900 3550
Wire Wire Line
	3800 3650 3900 3650
Wire Wire Line
	3800 3750 3900 3750
Wire Wire Line
	3800 3850 3900 3850
Wire Wire Line
	1400 1350 1400 1400
Wire Wire Line
	1400 1850 1400 1800
Connection ~ 1600 1850
Connection ~ 1400 1350
Wire Wire Line
	1200 1350 1200 1400
Wire Wire Line
	1200 1800 1200 1850
Connection ~ 1400 1850
Wire Wire Line
	1150 1350 1150 1300
Connection ~ 1200 1350
Wire Notes Line
	4550 500  500  500 
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
	500  5100 4550 5100
Wire Notes Line
	4550 5100 4550 7700
Wire Notes Line
	4550 7700 500  7700
Wire Notes Line
	500  7700 500  5100
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
	6750 5750 6700 5750
Wire Wire Line
	6750 5550 6750 5750
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
Wire Wire Line
	1150 1350 2350 1350
Wire Wire Line
	2350 1350 2350 1450
Wire Wire Line
	2450 1450 2450 1650
Wire Wire Line
	2450 950  2450 1350
Wire Wire Line
	2450 1350 2500 1350
$Comp
L GND #PWR?
U 1 1 54D595D3
P 1800 1000
F 0 "#PWR?" H 1800 750 60  0001 C CNN
F 1 "GND" H 1800 850 60  0000 C CNN
F 2 "" H 1800 1000 60  0000 C CNN
F 3 "" H 1800 1000 60  0000 C CNN
	1    1800 1000
	1    0    0    -1  
$EndComp
Wire Notes Line
	500  500  500  5050
Wire Notes Line
	500  5050 4550 5050
Wire Notes Line
	4550 5050 4550 500 
Wire Wire Line
	1850 950  1800 950 
Wire Wire Line
	1800 950  1800 1000
$Comp
L GND #PWR?
U 1 1 54D6E968
P 1150 4500
F 0 "#PWR?" H 1150 4250 60  0001 C CNN
F 1 "GND" H 1150 4350 60  0000 C CNN
F 2 "" H 1150 4500 60  0000 C CNN
F 3 "" H 1150 4500 60  0000 C CNN
	1    1150 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 54D6EA81
P 1850 4500
F 0 "#PWR?" H 1850 4250 60  0001 C CNN
F 1 "GND" H 1850 4350 60  0000 C CNN
F 2 "" H 1850 4500 60  0000 C CNN
F 3 "" H 1850 4500 60  0000 C CNN
	1    1850 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2750 2500 2750
Wire Wire Line
	1550 2450 1550 2750
Wire Wire Line
	1200 2450 1550 2450
Wire Wire Line
	1400 2500 1400 2450
Connection ~ 1400 2450
Wire Wire Line
	800  2450 750  2450
Wire Wire Line
	750  2450 750  2500
Wire Wire Line
	800  3150 750  3150
Wire Wire Line
	750  3150 750  3200
Wire Wire Line
	1200 3150 1550 3150
Wire Wire Line
	1550 3150 1550 2850
Wire Wire Line
	1550 2850 2500 2850
Wire Wire Line
	1400 3100 1400 3150
Connection ~ 1400 3150
Wire Wire Line
	2500 3050 1850 3050
Wire Wire Line
	1850 3050 1850 3200
Wire Wire Line
	1850 3700 1850 4050
Wire Wire Line
	1850 4450 1850 4500
Wire Wire Line
	1800 3850 1850 3850
Connection ~ 1850 3850
Wire Wire Line
	1150 4450 1150 4500
Wire Wire Line
	1150 3250 1150 4050
Wire Wire Line
	1150 3250 1750 3250
Wire Wire Line
	1750 3250 1750 2950
Wire Wire Line
	1750 2950 2500 2950
Wire Wire Line
	1200 3850 1150 3850
Connection ~ 1150 3850
$Comp
L C C?
U 1 1 54DEC866
P 5200 4100
F 0 "C?" H 5250 4200 50  0000 L CNN
F 1 "100n" H 5250 4000 50  0000 L CNN
F 2 "" H 5238 3950 30  0000 C CNN
F 3 "" H 5200 4100 60  0000 C CNN
	1    5200 4100
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 54DEC901
P 4950 3800
F 0 "R?" V 5030 3800 50  0000 C CNN
F 1 "10k" V 4957 3801 50  0000 C CNN
F 2 "" V 4880 3800 30  0000 C CNN
F 3 "" H 4950 3800 30  0000 C CNN
	1    4950 3800
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 54DEC9A4
P 4950 4400
F 0 "R?" V 5030 4400 50  0000 C CNN
F 1 "10k" V 4957 4401 50  0000 C CNN
F 2 "" V 4880 4400 30  0000 C CNN
F 3 "" H 4950 4400 30  0000 C CNN
	1    4950 4400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 54DEE5E1
P 5750 4100
F 0 "R?" V 5830 4100 50  0000 C CNN
F 1 "30k" V 5757 4101 50  0000 C CNN
F 2 "" V 5680 4100 30  0000 C CNN
F 3 "" H 5750 4100 30  0000 C CNN
	1    5750 4100
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 54DEE5E7
P 5450 4400
F 0 "R?" V 5530 4400 50  0000 C CNN
F 1 "10k" V 5457 4401 50  0000 C CNN
F 2 "" V 5380 4400 30  0000 C CNN
F 3 "" H 5450 4400 30  0000 C CNN
	1    5450 4400
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR?
U 1 1 54DEEEEF
P 4950 3500
F 0 "#PWR?" H 4950 3350 60  0001 C CNN
F 1 "VDD" H 4950 3650 60  0000 C CNN
F 2 "" H 4950 3500 60  0000 C CNN
F 3 "" H 4950 3500 60  0000 C CNN
	1    4950 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 54DEF184
P 4950 4700
F 0 "#PWR?" H 4950 4450 60  0001 C CNN
F 1 "GND" H 4950 4550 60  0000 C CNN
F 2 "" H 4950 4700 60  0000 C CNN
F 3 "" H 4950 4700 60  0000 C CNN
	1    4950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4650 4950 4700
$Comp
L GND #PWR?
U 1 1 54DEF645
P 5450 4700
F 0 "#PWR?" H 5450 4450 60  0001 C CNN
F 1 "GND" H 5450 4550 60  0000 C CNN
F 2 "" H 5450 4700 60  0000 C CNN
F 3 "" H 5450 4700 60  0000 C CNN
	1    5450 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4650 5450 4700
Wire Wire Line
	5400 4100 5500 4100
Wire Wire Line
	5450 4150 5450 4100
Connection ~ 5450 4100
Wire Wire Line
	4850 4100 5000 4100
Wire Wire Line
	4950 4050 4950 4150
Connection ~ 4950 4100
Wire Wire Line
	4950 3550 4950 3500
$Comp
L ER-OLEDM024-2 U?
U 1 1 54DF23ED
P 10150 3100
F 0 "U?" H 10300 800 60  0000 C CNN
F 1 "ER-OLEDM024-2" H 10450 3200 60  0000 C CNN
F 2 "" H 10150 3100 60  0000 C CNN
F 3 "" H 10150 3100 60  0000 C CNN
	1    10150 3100
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR?
U 1 1 54DF2548
P 10000 3050
F 0 "#PWR?" H 10000 2900 60  0001 C CNN
F 1 "VDD" H 10000 3200 60  0000 C CNN
F 2 "" H 10000 3050 60  0000 C CNN
F 3 "" H 10000 3050 60  0000 C CNN
	1    10000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3050 10000 3100
Wire Wire Line
	10000 3100 10150 3100
$Comp
L GND #PWR?
U 1 1 54DF27E2
P 10000 3350
F 0 "#PWR?" H 10000 3100 60  0001 C CNN
F 1 "GND" H 10000 3200 60  0000 C CNN
F 2 "" H 10000 3350 60  0000 C CNN
F 3 "" H 10000 3350 60  0000 C CNN
	1    10000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 3300 10000 3300
Wire Wire Line
	10000 3200 10000 3350
Wire Wire Line
	10150 3200 10000 3200
Connection ~ 10000 3300
$Comp
L GND #PWR?
U 1 1 54DF2B6E
P 10050 3700
F 0 "#PWR?" H 10050 3450 60  0001 C CNN
F 1 "GND" H 10050 3550 60  0000 C CNN
F 2 "" H 10050 3700 60  0000 C CNN
F 3 "" H 10050 3700 60  0000 C CNN
	1    10050 3700
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR?
U 1 1 54DF2BB5
P 9900 3800
F 0 "#PWR?" H 9900 3650 60  0001 C CNN
F 1 "VDD" H 9900 3950 60  0000 C CNN
F 2 "" H 9900 3800 60  0000 C CNN
F 3 "" H 9900 3800 60  0000 C CNN
	1    9900 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 3700 10150 3700
Wire Wire Line
	9900 3800 10150 3800
Text Notes 9000 3800 0    60   ~ 0
6800 Mode:\nBS1=0 BS2=1
Text Label 10100 4600 2    60   ~ 0
OLED_D0
Text Label 10100 4700 2    60   ~ 0
OLED_D1
Text Label 10100 4800 2    60   ~ 0
OLED_D2
Text Label 10100 4900 2    60   ~ 0
OLED_D3
Text Label 10100 5000 2    60   ~ 0
OLED_D4
Text Label 10100 5100 2    60   ~ 0
OLED_D5
Text Label 10100 5200 2    60   ~ 0
OLED_D6
Text Label 10100 5300 2    60   ~ 0
OLED_D7
Wire Wire Line
	10100 4600 10150 4600
Wire Wire Line
	10100 4700 10150 4700
Wire Wire Line
	10100 4800 10150 4800
Wire Wire Line
	10100 4900 10150 4900
Wire Wire Line
	10100 5000 10150 5000
Wire Wire Line
	10100 5100 10150 5100
Wire Wire Line
	10100 5200 10150 5200
Wire Wire Line
	10100 5300 10150 5300
Text Label 10100 4100 2    60   ~ 0
OLED_D/C
Text Label 10100 4000 2    60   ~ 0
~OLED_RST
Text Label 10100 4400 2    60   ~ 0
~OLED_CS
Text Label 10100 4200 2    60   ~ 0
OLED_R/W
Text Label 10100 4300 2    60   ~ 0
OLED_E
Wire Wire Line
	10100 4000 10150 4000
Wire Wire Line
	10100 4100 10150 4100
Wire Wire Line
	10100 4200 10150 4200
Wire Wire Line
	10100 4300 10150 4300
Wire Wire Line
	10100 4400 10150 4400
Text Label 3900 3250 0    60   ~ 0
~OLED_RST
$Comp
L C C?
U 1 1 54DF5EF1
P 9650 3200
F 0 "C?" H 9700 3300 50  0000 L CNN
F 1 "100n" H 9700 3100 50  0000 L CNN
F 2 "" H 9688 3050 30  0000 C CNN
F 3 "" H 9650 3200 60  0000 C CNN
	1    9650 3200
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR?
U 1 1 54DF6093
P 9650 2950
F 0 "#PWR?" H 9650 2800 60  0001 C CNN
F 1 "VDD" H 9650 3100 60  0000 C CNN
F 2 "" H 9650 2950 60  0000 C CNN
F 3 "" H 9650 2950 60  0000 C CNN
	1    9650 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 54DF60DB
P 9650 3450
F 0 "#PWR?" H 9650 3200 60  0001 C CNN
F 1 "GND" H 9650 3300 60  0000 C CNN
F 2 "" H 9650 3450 60  0000 C CNN
F 3 "" H 9650 3450 60  0000 C CNN
	1    9650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 3400 9650 3450
Wire Wire Line
	9650 2950 9650 3000
$EndSCHEMATC
