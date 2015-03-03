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
LIBS:acs710
LIBS:ltc1966
LIBS:ltc6910
LIBS:relay_spst
LIBS:vtx214
LIBS:thermal_switch
LIBS:power-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Supervide Power Board"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TRIAC U4
U 1 1 54E5283F
P 9900 4700
F 0 "U4" H 9650 5050 50  0000 C CNN
F 1 "TIC206M" H 10100 4950 50  0000 C CNN
F 2 "Transistors_TO-220:TO-220_Neutral123_Vertical_LargePads" H 9900 4700 60  0001 C CNN
F 3 "" H 9900 4700 60  0000 C CNN
	1    9900 4700
	1    0    0    -1  
$EndComp
$Comp
L OPTO-TRIAC U3
U 1 1 54E528C7
P 7350 4450
F 0 "U3" H 7550 4750 60  0000 C CNN
F 1 "MOC3163-M" H 7150 4750 60  0000 C CNN
F 2 "Sockets_DIP:DIP-6__300_ELL" H 7350 4450 60  0001 C CNN
F 3 "" H 7350 4450 60  0000 C CNN
F 4 "1467853" H 7350 4450 60  0001 C CNN "Farnell"
	1    7350 4450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 54E52E94
P 8250 4250
F 0 "R3" V 8330 4250 50  0000 C CNN
F 1 "390R" V 8150 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8180 4250 30  0001 C CNN
F 3 "" H 8250 4250 30  0000 C CNN
F 4 "2331790" H 8250 4250 60  0001 C CNN "Farnell"
	1    8250 4250
	0    1    1    0   
$EndComp
Text GLabel 8750 1450 0    60   Input ~ 0
MAINS_LIVE
$Comp
L R R4
U 1 1 54E5366C
P 10500 4750
F 0 "R4" V 10580 4750 50  0000 C CNN
F 1 "47R" V 10507 4751 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206" V 10430 4750 30  0001 C CNN
F 3 "" H 10500 4750 30  0000 C CNN
F 4 "1887414" H 10500 4750 60  0001 C CNN "Farnell"
	1    10500 4750
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 54E536C9
P 10500 4250
F 0 "C4" H 10550 4350 50  0000 L CNN
F 1 "22nF" H 10550 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210" H 10538 4100 30  0001 C CNN
F 3 "" H 10500 4250 60  0000 C CNN
F 4 "2057310" H 10500 4250 60  0001 C CNN "Farnell"
	1    10500 4250
	1    0    0    -1  
$EndComp
Text GLabel 10550 5250 2    60   Input ~ 0
LOAD_LIVE
Text GLabel 6500 4250 0    60   Input ~ 0
TRIAC_TRIG
$Comp
L R R5
U 1 1 54E53E1C
P 6500 4800
F 0 "R5" V 6580 4800 50  0000 C CNN
F 1 "220R" V 6400 4800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" V 6430 4800 30  0001 C CNN
F 3 "" H 6500 4800 30  0000 C CNN
F 4 "2331787" H 6500 4800 60  0001 C CNN "Farnell"
	1    6500 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 54E54152
P 6500 5100
F 0 "#PWR01" H 6500 4850 60  0001 C CNN
F 1 "GND" H 6500 4950 60  0000 C CNN
F 2 "" H 6500 5100 60  0000 C CNN
F 3 "" H 6500 5100 60  0000 C CNN
	1    6500 5100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 54E57BFD
P 1300 6450
F 0 "#PWR02" H 1300 6300 60  0001 C CNN
F 1 "+5V" H 1300 6590 60  0000 C CNN
F 2 "" H 1300 6450 60  0000 C CNN
F 3 "" H 1300 6450 60  0000 C CNN
	1    1300 6450
	1    0    0    -1  
$EndComp
Text GLabel 2300 5850 2    60   Input ~ 0
MASTER_RELAY
$Comp
L GND #PWR03
U 1 1 54E58366
P 1300 5700
F 0 "#PWR03" H 1300 5450 60  0001 C CNN
F 1 "GND" H 1300 5550 60  0000 C CNN
F 2 "" H 1300 5700 60  0000 C CNN
F 3 "" H 1300 5700 60  0000 C CNN
	1    1300 5700
	1    0    0    -1  
$EndComp
Text GLabel 2300 6150 2    60   Input ~ 0
TRIAC_TRIG
Text GLabel 6750 1450 0    60   Input ~ 0
MASTER_RELAY
Text GLabel 1950 3100 0    60   Input ~ 0
LOAD_NEUTRAL
Text GLabel 1950 3500 0    60   Input ~ 0
MAINS_NEUTRAL
NoConn ~ 3550 3050
NoConn ~ 3550 3250
$Comp
L +5V #PWR04
U 1 1 54E6A742
P 4750 3100
F 0 "#PWR04" H 4750 2950 60  0001 C CNN
F 1 "+5V" H 4750 3240 60  0000 C CNN
F 2 "" H 4750 3100 60  0000 C CNN
F 3 "" H 4750 3100 60  0000 C CNN
	1    4750 3100
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 54E6A771
P 4750 3800
F 0 "C3" H 4800 3900 50  0000 L CNN
F 1 "100nF" H 4800 3700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4788 3650 30  0001 C CNN
F 3 "" H 4750 3800 60  0000 C CNN
F 4 "1759166" H 4750 3800 60  0001 C CNN "Farnell"
	1    4750 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 54E6AA04
P 4750 4050
F 0 "#PWR05" H 4750 3800 60  0001 C CNN
F 1 "GND" H 4750 3900 60  0000 C CNN
F 2 "" H 4750 4050 60  0000 C CNN
F 3 "" H 4750 4050 60  0000 C CNN
	1    4750 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 54E6AAC6
P 3750 2950
F 0 "#PWR06" H 3750 2700 60  0001 C CNN
F 1 "GND" H 3750 2800 60  0000 C CNN
F 2 "" H 3750 2950 60  0000 C CNN
F 3 "" H 3750 2950 60  0000 C CNN
	1    3750 2950
	1    0    0    -1  
$EndComp
Text GLabel 3700 3300 2    60   Input ~ 0
I_SENSE
$Comp
L C C2
U 1 1 54E6D133
P 4500 3800
F 0 "C2" H 4550 3900 50  0000 L CNN
F 1 "100nF" H 4200 3700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4538 3650 30  0001 C CNN
F 3 "" H 4500 3800 60  0000 C CNN
F 4 "1759166" H 4500 3800 60  0001 C CNN "Farnell"
	1    4500 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 54E6D672
P 4500 4050
F 0 "#PWR07" H 4500 3800 60  0001 C CNN
F 1 "GND" H 4500 3900 60  0000 C CNN
F 2 "" H 4500 4050 60  0000 C CNN
F 3 "" H 4500 4050 60  0000 C CNN
	1    4500 4050
	1    0    0    -1  
$EndComp
Text GLabel 3850 3550 2    60   Input ~ 0
V_OFFSET
$Comp
L C C1
U 1 1 54E6E944
P 3800 3800
F 0 "C1" H 3850 3900 50  0000 L CNN
F 1 "1nF" H 3850 3700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3838 3650 30  0001 C CNN
F 3 "" H 3800 3800 60  0000 C CNN
F 4 "1759226" H 3800 3800 60  0001 C CNN "Farnell"
	1    3800 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 54E6EA77
P 3800 4050
F 0 "#PWR08" H 3800 3800 60  0001 C CNN
F 1 "GND" H 3800 3900 60  0000 C CNN
F 2 "" H 3800 4050 60  0000 C CNN
F 3 "" H 3800 4050 60  0000 C CNN
	1    3800 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 54E6EBEB
P 3600 4050
F 0 "#PWR09" H 3600 3800 60  0001 C CNN
F 1 "GND" H 3600 3900 60  0000 C CNN
F 2 "" H 3600 4050 60  0000 C CNN
F 3 "" H 3600 4050 60  0000 C CNN
	1    3600 4050
	1    0    0    -1  
$EndComp
$Comp
L ACS710 U2
U 1 1 54E71955
P 2900 3300
F 0 "U2" V 2900 3450 60  0000 C CNN
F 1 "ACS710" V 2900 3100 60  0000 C CNN
F 2 "power:SOIC16W-chunky" H 3900 3850 60  0001 C CNN
F 3 "" H 3900 3850 60  0000 C CNN
F 4 "1791411" H 2900 3300 60  0001 C CNN "Farnell"
	1    2900 3300
	1    0    0    -1  
$EndComp
Text GLabel 10150 1550 2    60   Input ~ 0
TRIAC_MAINS
Text GLabel 9800 3900 0    60   Input ~ 0
TRIAC_MAINS
Text GLabel 1600 6150 0    60   Input ~ 0
I_SENSE
Text Notes 8050 6450 0    157  ~ 0
LOAD CONTROL
Text Notes 2100 2150 0    157  ~ 0
POWER SUPPLY
Text Notes 2050 5350 0    157  ~ 0
CURRENT SENSE
Text Notes 3550 5750 0    157  ~ 0
CONNECTORS
$Comp
L PWR_FLAG #FLG010
U 1 1 54E8D577
P 1650 6950
F 0 "#FLG010" H 1650 7045 30  0001 C CNN
F 1 "PWR_FLAG" H 1650 7130 30  0000 C CNN
F 2 "" H 1650 6950 60  0000 C CNN
F 3 "" H 1650 6950 60  0000 C CNN
	1    1650 6950
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG011
U 1 1 54E8D5A7
P 1900 6950
F 0 "#FLG011" H 1900 7045 30  0001 C CNN
F 1 "PWR_FLAG" H 1900 7130 30  0000 C CNN
F 2 "" H 1900 6950 60  0000 C CNN
F 3 "" H 1900 6950 60  0000 C CNN
	1    1900 6950
	1    0    0    -1  
$EndComp
Text GLabel 2300 6000 2    60   Input ~ 0
PREHEAT_RELAY
Text GLabel 8850 2650 0    60   Input ~ 0
TRIAC_MAINS
Text GLabel 10250 2750 2    60   Input ~ 0
LOAD_LIVE
Text GLabel 6900 2650 0    60   Input ~ 0
PREHEAT_RELAY
$Comp
L +5V #PWR012
U 1 1 54E9E5A8
P 7800 2400
F 0 "#PWR012" H 7800 2250 60  0001 C CNN
F 1 "+5V" H 7800 2540 60  0000 C CNN
F 2 "" H 7800 2400 60  0000 C CNN
F 3 "" H 7800 2400 60  0000 C CNN
	1    7800 2400
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 54E9E5AF
P 7200 2650
F 0 "R2" V 7280 2650 50  0000 C CNN
F 1 "390R" V 7207 2651 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7130 2650 30  0001 C CNN
F 3 "" H 7200 2650 30  0000 C CNN
F 4 "2331790" H 7200 2650 60  0001 C CNN "Farnell"
	1    7200 2650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 54E9E5B7
P 9050 3000
F 0 "#PWR013" H 9050 2750 60  0001 C CNN
F 1 "GND" H 9050 2850 60  0000 C CNN
F 2 "" H 9050 3000 60  0000 C CNN
F 3 "" H 9050 3000 60  0000 C CNN
	1    9050 3000
	1    0    0    -1  
$EndComp
NoConn ~ 2200 6200
$Comp
L BC817-40 Q2
U 1 1 54EA7C9D
P 7700 2650
F 0 "Q2" H 7700 2501 40  0000 R CNN
F 1 "BC817-40" H 7700 2800 40  0000 R CNN
F 2 "power:SOT23" H 7500 2752 29  0001 C CNN
F 3 "" H 7700 2650 60  0000 C CNN
F 4 "1081223" H 7700 2650 60  0001 C CNN "Farnell"
	1    7700 2650
	1    0    0    -1  
$EndComp
$Comp
L RELAY_SPST K2
U 1 1 54E81150
P 9450 2850
F 0 "K2" H 9450 3150 50  0000 C CNN
F 1 "PREHEAT" H 9600 2600 50  0000 C CNN
F 2 "power:RZ03-1A4" H 9450 3100 60  0001 C CNN
F 3 "" H 9450 3100 60  0000 C CNN
F 4 "2325624" H 9450 2850 60  0001 C CNN "Farnell"
	1    9450 2850
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR014
U 1 1 54E81E7C
P 7700 1200
F 0 "#PWR014" H 7700 1050 60  0001 C CNN
F 1 "+5V" H 7700 1340 60  0000 C CNN
F 2 "" H 7700 1200 60  0000 C CNN
F 3 "" H 7700 1200 60  0000 C CNN
	1    7700 1200
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 54E81E83
P 7100 1450
F 0 "R1" V 7180 1450 50  0000 C CNN
F 1 "390R" V 7107 1451 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7030 1450 30  0001 C CNN
F 3 "" H 7100 1450 30  0000 C CNN
F 4 "2331790" H 7100 1450 60  0001 C CNN "Farnell"
	1    7100 1450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR015
U 1 1 54E81E8B
P 8950 1800
F 0 "#PWR015" H 8950 1550 60  0001 C CNN
F 1 "GND" H 8950 1650 60  0000 C CNN
F 2 "" H 8950 1800 60  0000 C CNN
F 3 "" H 8950 1800 60  0000 C CNN
	1    8950 1800
	1    0    0    -1  
$EndComp
$Comp
L BC817-40 Q1
U 1 1 54E81E97
P 7600 1450
F 0 "Q1" H 7600 1301 40  0000 R CNN
F 1 "BC817-40" H 7600 1600 40  0000 R CNN
F 2 "power:SOT23" H 7400 1552 29  0001 C CNN
F 3 "" H 7600 1450 60  0000 C CNN
F 4 "1081223" H 7600 1450 60  0001 C CNN "Farnell"
	1    7600 1450
	1    0    0    -1  
$EndComp
$Comp
L RELAY_SPST K1
U 1 1 54E82543
P 9350 1650
F 0 "K1" H 9350 1950 50  0000 C CNN
F 1 "MASTER_LIVE" H 9500 1400 50  0000 C CNN
F 2 "power:RZ03-1A4" H 9350 1900 60  0001 C CNN
F 3 "" H 9350 1900 60  0000 C CNN
F 4 "2325624" H 9350 1650 60  0001 C CNN "Farnell"
	1    9350 1650
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X04 P1
U 1 1 54E909DD
P 1950 6050
F 0 "P1" H 1950 6300 50  0000 C CNN
F 1 "CONTROL" H 1950 5800 50  0000 C CNN
F 2 "power:TS821X08XXS100" H 1950 4850 60  0001 C CNN
F 3 "" H 1950 4850 60  0000 C CNN
F 4 "2215303" H 1950 6050 60  0001 C CNN "Farnell"
	1    1950 6050
	1    0    0    -1  
$EndComp
Text Notes 2450 3950 0    60   ~ 0
56mV/A version:\nACS710KLATR-12CB-T
Text Notes 3900 4600 0    60   ~ 0
Sets bandwidth with\ninternal filter R
$Comp
L VTX214 U1
U 1 1 54EA4561
P 3950 1250
F 0 "U1" H 3950 1150 60  0000 C CNN
F 1 "VTX214" H 3950 1350 60  0000 C CNN
F 2 "power:VTX214" H 3950 1250 60  0001 C CNN
F 3 "" H 3950 1250 60  0000 C CNN
F 4 "2401030" H 3950 1250 60  0001 C CNN "Farnell"
	1    3950 1250
	1    0    0    -1  
$EndComp
Text GLabel 2150 1200 0    60   Input ~ 0
MAINS_LIVE
Text GLabel 2150 1350 0    60   Input ~ 0
MAINS_NEUTRAL
$Comp
L +5V #PWR016
U 1 1 54EA4FAC
P 4900 1150
F 0 "#PWR016" H 4900 1000 60  0001 C CNN
F 1 "+5V" H 4900 1290 60  0000 C CNN
F 2 "" H 4900 1150 60  0000 C CNN
F 3 "" H 4900 1150 60  0000 C CNN
	1    4900 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 54EA4FE1
P 4900 1350
F 0 "#PWR017" H 4900 1100 60  0001 C CNN
F 1 "GND" H 4900 1200 60  0000 C CNN
F 2 "" H 4900 1350 60  0000 C CNN
F 3 "" H 4900 1350 60  0000 C CNN
	1    4900 1350
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG018
U 1 1 54EA5407
P 3250 1150
F 0 "#FLG018" H 3250 1245 30  0001 C CNN
F 1 "PWR_FLAG" H 3250 1330 30  0000 C CNN
F 2 "" H 3250 1150 60  0000 C CNN
F 3 "" H 3250 1150 60  0000 C CNN
	1    3250 1150
	1    0    0    -1  
$EndComp
Text Notes 3700 1500 0    60   ~ 0
MAGIC BOX
Text Notes 3500 1100 0    60   ~ 0
      5V 3W\nVTX-214-003-105
$Comp
L FUSE F2
U 1 1 54F25289
P 2150 7150
F 0 "F2" H 2250 7200 50  0000 C CNN
F 1 "13A" H 2050 7100 50  0000 C CNN
F 2 "power:BS1362_clip" H 2150 7150 60  0001 C CNN
F 3 "" H 2150 7150 60  0000 C CNN
F 4 "1603990" H 2150 7150 60  0001 C CNN "Farnell"
	1    2150 7150
	1    0    0    -1  
$EndComp
$Comp
L FUSE F1
U 1 1 54F252EE
P 2600 1200
F 0 "F1" H 2700 1250 50  0000 C CNN
F 1 "100mA" H 2450 1150 50  0000 C CNN
F 2 "power:5x20_clip" H 2600 1200 60  0001 C CNN
F 3 "" H 2600 1200 60  0000 C CNN
F 4 "1162740" H 2600 1200 60  0001 C CNN "Farnell"
	1    2600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4250 8000 4250
Wire Wire Line
	7950 4650 8150 4650
Wire Wire Line
	10500 4450 10500 4500
Wire Wire Line
	9900 5050 10500 5050
Wire Wire Line
	10500 5050 10500 5000
Wire Wire Line
	9900 5250 10550 5250
Connection ~ 9900 5050
Wire Wire Line
	6500 4250 6700 4250
Wire Wire Line
	6700 4550 6500 4550
Wire Wire Line
	6500 5050 6500 5100
Wire Wire Line
	2050 3100 1950 3100
Wire Wire Line
	2050 2950 2050 3250
Wire Wire Line
	2050 2950 2300 2950
Wire Wire Line
	2050 3250 2300 3250
Connection ~ 2050 3100
Wire Wire Line
	2050 3050 2300 3050
Connection ~ 2050 3050
Wire Wire Line
	2050 3150 2300 3150
Connection ~ 2050 3150
Wire Wire Line
	2050 3500 1950 3500
Wire Wire Line
	2050 3350 2050 3650
Wire Wire Line
	2050 3350 2300 3350
Wire Wire Line
	2050 3650 2300 3650
Connection ~ 2050 3500
Wire Wire Line
	2050 3450 2300 3450
Connection ~ 2050 3450
Wire Wire Line
	2300 3550 2050 3550
Connection ~ 2050 3550
Wire Wire Line
	4750 3100 4750 3600
Connection ~ 4750 3150
Wire Wire Line
	4750 4000 4750 4050
Wire Wire Line
	3550 2950 3550 2900
Wire Wire Line
	3550 2900 3750 2900
Wire Wire Line
	3750 2900 3750 2950
Wire Wire Line
	3550 3350 3650 3350
Wire Wire Line
	3650 3350 3650 3300
Wire Wire Line
	3650 3300 3700 3300
Wire Wire Line
	4500 3450 4500 3600
Wire Wire Line
	4500 4050 4500 4000
Wire Wire Line
	3800 3550 3800 3600
Connection ~ 3800 3550
Wire Wire Line
	3800 4000 3800 4050
Wire Wire Line
	3550 3650 3600 3650
Wire Wire Line
	3600 3650 3600 4050
Wire Wire Line
	3550 3550 3850 3550
Wire Wire Line
	3550 3450 4500 3450
Wire Wire Line
	4750 3150 3550 3150
Wire Wire Line
	1550 5650 1550 5900
Wire Wire Line
	1550 5650 1300 5650
Wire Wire Line
	1300 5650 1300 5700
Wire Wire Line
	1550 5900 1700 5900
Wire Wire Line
	1700 6100 1650 6100
Wire Wire Line
	1650 6100 1650 6150
Wire Wire Line
	1650 6150 1600 6150
Wire Wire Line
	2200 6000 2300 6000
Wire Wire Line
	2200 6100 2250 6100
Wire Wire Line
	2250 6100 2250 6150
Wire Wire Line
	2250 6150 2300 6150
Wire Wire Line
	8150 4650 8150 4900
Wire Wire Line
	9900 4950 9900 5250
Wire Wire Line
	8150 4900 9400 4900
Connection ~ 9900 4250
Wire Wire Line
	10500 3900 10500 4050
Wire Wire Line
	8850 2650 9050 2650
Wire Wire Line
	7800 2400 7800 2450
Wire Wire Line
	7450 2650 7500 2650
Wire Wire Line
	6900 2650 6950 2650
Wire Wire Line
	9050 3000 9050 2950
Wire Wire Line
	7800 2850 9050 2850
Wire Wire Line
	9850 2750 10250 2750
Wire Wire Line
	1650 6200 1650 6450
Wire Wire Line
	1650 6200 1700 6200
Wire Wire Line
	8750 1450 8950 1450
Wire Wire Line
	7700 1200 7700 1250
Wire Wire Line
	7350 1450 7400 1450
Wire Wire Line
	6750 1450 6850 1450
Wire Wire Line
	8950 1800 8950 1750
Wire Wire Line
	7700 1650 8950 1650
Wire Wire Line
	9750 1550 10150 1550
Wire Wire Line
	2200 5900 2250 5900
Wire Wire Line
	2250 5900 2250 5850
Wire Wire Line
	2250 5850 2300 5850
Wire Wire Line
	1650 6450 1300 6450
Wire Notes Line
	4200 3850 4200 4400
Wire Notes Line
	4200 3850 4450 3850
Wire Notes Line
	4450 3850 4450 3950
Wire Notes Line
	4450 3950 4200 3950
Wire Wire Line
	2850 1200 3400 1200
Wire Wire Line
	3100 1350 3100 1300
Wire Wire Line
	3100 1300 3400 1300
Wire Wire Line
	4500 1300 4900 1300
Wire Wire Line
	4900 1300 4900 1350
Wire Wire Line
	4500 1200 4900 1200
Wire Wire Line
	4900 1200 4900 1150
Wire Notes Line
	5850 7750 5850 500 
Wire Notes Line
	5850 2250 500  2250
Wire Notes Line
	5850 5450 500  5450
Wire Wire Line
	2150 1200 2350 1200
Wire Wire Line
	2150 1350 3100 1350
Text Notes 6750 5100 0    60   ~ 0
1000V/us min critical rise\n5mA trigger current\n12V typical inhibit voltage\nDIP-6
Wire Wire Line
	3250 1200 3250 1150
Connection ~ 3250 1200
$Comp
L CONN_01X03 P2
U 1 1 54F26236
P 1500 7350
F 0 "P2" H 1500 7550 50  0000 C CNN
F 1 "MAINS_INLET" V 1600 7350 50  0000 C CNN
F 2 "power:GSP1_9103" H 1500 7350 60  0001 C CNN
F 3 "" H 1500 7350 60  0000 C CNN
F 4 "2080426" H 1500 7350 60  0001 C CNN "Farnell"
	1    1500 7350
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 54F262A6
P 4500 7350
F 0 "P3" H 4500 7550 50  0000 C CNN
F 1 "LOAD_OUTLET" V 4600 7350 50  0000 C CNN
F 2 "power:5001" H 4500 7350 60  0001 C CNN
F 3 "" H 4500 7350 60  0000 C CNN
F 4 "2080465" H 4500 7350 60  0001 C CNN "Farnell"
	1    4500 7350
	1    0    0    1   
$EndComp
Wire Wire Line
	1700 7450 4300 7450
Text Label 3200 7450 0    60   ~ 0
EARTH
Text GLabel 2450 7300 2    60   Input ~ 0
MAINS_NEUTRAL
Text GLabel 4150 7300 0    60   Input ~ 0
LOAD_NEUTRAL
Text GLabel 2450 7150 2    60   Input ~ 0
MAINS_LIVE
Text GLabel 3950 7150 0    60   Input ~ 0
LOAD_LIVE
Wire Wire Line
	2400 7150 2450 7150
Wire Wire Line
	1700 7350 1950 7350
Wire Wire Line
	1950 7350 1950 7300
Wire Wire Line
	1950 7300 2450 7300
Wire Wire Line
	1900 7250 1900 7150
Wire Wire Line
	1700 7250 1900 7250
Wire Wire Line
	1650 6950 1750 6950
Wire Wire Line
	1750 6950 1750 7250
Connection ~ 1750 7250
Wire Wire Line
	1900 6950 1850 6950
Wire Wire Line
	1850 6950 1850 7350
Connection ~ 1850 7350
Wire Wire Line
	4150 7300 4200 7300
Wire Wire Line
	4200 7300 4200 7350
Wire Wire Line
	4200 7350 4300 7350
Wire Wire Line
	3950 7150 4250 7150
Wire Wire Line
	4250 7150 4250 7250
Wire Wire Line
	4250 7250 4300 7250
$Comp
L thermal_switch U5
U 1 1 54F50713
P 9000 4250
F 0 "U5" H 8850 4400 60  0000 C CNN
F 1 "70°C" H 9050 3950 60  0000 C CNN
F 2 "Wire_Connections_Bridges:WireConnection_1mmDrill" H 8950 4800 60  0001 C CNN
F 3 "" H 8950 4800 60  0000 C CNN
F 4 "SN36219" H 9000 4250 60  0001 C CNN "Farnell"
	1    9000 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4250 9900 4250
Wire Wire Line
	9800 3900 10500 3900
Wire Wire Line
	9900 3900 9900 4300
Wire Wire Line
	8550 4250 8500 4250
NoConn ~ 1700 6000
Connection ~ 9900 3900
$EndSCHEMATC
