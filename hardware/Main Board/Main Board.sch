EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Closed Loop Motor Controller"
Date ""
Rev ""
Comp "Lukas Severinghaus"
Comment1 "EGR101 Honors Contract"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 5F59773B
P 1950 1100
F 0 "U1" H 1950 1342 50  0000 C CNN
F 1 "LM7805" H 1950 1251 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 1950 1325 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 1950 1050 50  0001 C CNN
	1    1950 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F59B5F0
P 950 1500
F 0 "#PWR0101" H 950 1250 50  0001 C CNN
F 1 "GND" H 955 1327 50  0000 C CNN
F 2 "" H 950 1500 50  0001 C CNN
F 3 "" H 950 1500 50  0001 C CNN
	1    950  1500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 5F59A6AC
P 950 700
F 0 "#PWR0102" H 950 550 50  0001 C CNN
F 1 "+12V" H 965 873 50  0000 C CNN
F 2 "" H 950 700 50  0001 C CNN
F 3 "" H 950 700 50  0001 C CNN
	1    950  700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1400 950  1500
$Comp
L Device:C C1
U 1 1 5F59D2DD
P 1550 1250
F 0 "C1" H 1436 1296 50  0000 R CNN
F 1 "0.33uF" H 1436 1205 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1588 1100 50  0001 C CNN
F 3 "~" H 1550 1250 50  0001 C CNN
	1    1550 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F59FC6F
P 2350 1250
F 0 "C2" H 2465 1296 50  0000 L CNN
F 1 "0.1uF" H 2465 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2388 1100 50  0001 C CNN
F 3 "~" H 2350 1250 50  0001 C CNN
	1    2350 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1400 1950 1400
Wire Wire Line
	1950 1400 2350 1400
Connection ~ 1950 1400
Wire Wire Line
	2350 1100 2250 1100
Wire Wire Line
	1650 1100 1550 1100
$Comp
L power:GND #PWR0103
U 1 1 5F5A401B
P 1950 1500
F 0 "#PWR0103" H 1950 1250 50  0001 C CNN
F 1 "GND" H 1955 1327 50  0000 C CNN
F 2 "" H 1950 1500 50  0001 C CNN
F 3 "" H 1950 1500 50  0001 C CNN
	1    1950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1400 1950 1500
$Comp
L power:+12V #PWR0104
U 1 1 5F5A5005
P 1450 1050
F 0 "#PWR0104" H 1450 900 50  0001 C CNN
F 1 "+12V" H 1465 1223 50  0000 C CNN
F 2 "" H 1450 1050 50  0001 C CNN
F 3 "" H 1450 1050 50  0001 C CNN
	1    1450 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1050 1450 1100
Wire Wire Line
	1450 1100 1550 1100
Connection ~ 1550 1100
$Comp
L Device:Polyfuse F2
U 1 1 5F5A5D7E
P 2650 1100
F 0 "F2" V 2425 1100 50  0000 C CNN
F 1 "1A Polyfuse" V 2516 1100 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W3.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 2700 900 50  0001 L CNN
F 3 "~" H 2650 1100 50  0001 C CNN
	1    2650 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 1100 2500 1100
Connection ~ 2350 1100
Wire Wire Line
	2800 1100 2900 1100
$Comp
L Device:Fuse F1
U 1 1 5F5A8277
P 950 1050
F 0 "F1" H 1010 1096 50  0000 L CNN
F 1 "5-7.5A" H 1010 1005 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" V 880 1050 50  0001 C CNN
F 3 "~" H 950 1050 50  0001 C CNN
	1    950  1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1300 950  1200
$Comp
L power:GND #PWR0106
U 1 1 5F5AC471
P 5900 5200
F 0 "#PWR0106" H 5900 4950 50  0001 C CNN
F 1 "GND" H 5905 5027 50  0000 C CNN
F 2 "" H 5900 5200 50  0001 C CNN
F 3 "" H 5900 5200 50  0001 C CNN
	1    5900 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5050 5900 5200
$Comp
L Device:CP1 C5
U 1 1 5F5AE8C9
P 5700 1750
F 0 "C5" H 5815 1796 50  0000 L CNN
F 1 "10uf" H 5815 1705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5700 1750 50  0001 C CNN
F 3 "~" H 5700 1750 50  0001 C CNN
	1    5700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1600 5900 1600
Wire Wire Line
	5900 1600 5900 1950
$Comp
L power:+5V #PWR0107
U 1 1 5F5B04C3
P 5900 1550
F 0 "#PWR0107" H 5900 1400 50  0001 C CNN
F 1 "+5V" H 5915 1723 50  0000 C CNN
F 2 "" H 5900 1550 50  0001 C CNN
F 3 "" H 5900 1550 50  0001 C CNN
	1    5900 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F5B0B6A
P 5700 1950
F 0 "#PWR0108" H 5700 1700 50  0001 C CNN
F 1 "GND" H 5705 1777 50  0000 C CNN
F 2 "" H 5700 1950 50  0001 C CNN
F 3 "" H 5700 1950 50  0001 C CNN
	1    5700 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5F5B5600
P 7200 3100
F 0 "Y1" V 7154 3231 50  0000 L CNN
F 1 "16MHz" V 7245 3231 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7200 3100 50  0001 C CNN
F 3 "~" H 7200 3100 50  0001 C CNN
	1    7200 3100
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 5F5B73EB
P 7650 2950
F 0 "C3" V 7398 2950 50  0000 C CNN
F 1 "22pF" V 7489 2950 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7688 2800 50  0001 C CNN
F 3 "~" H 7650 2950 50  0001 C CNN
	1    7650 2950
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5F5B7DCF
P 7650 3250
F 0 "C4" V 7810 3250 50  0000 C CNN
F 1 "22pF" V 7901 3250 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7688 3100 50  0001 C CNN
F 3 "~" H 7650 3250 50  0001 C CNN
	1    7650 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 3250 7500 3250
Wire Wire Line
	7500 2950 7200 2950
Connection ~ 7200 2950
Wire Wire Line
	7800 2950 7800 3100
$Comp
L power:GND #PWR0109
U 1 1 5F5B93B7
P 8000 3100
F 0 "#PWR0109" H 8000 2850 50  0001 C CNN
F 1 "GND" H 8005 2927 50  0000 C CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3100 7800 3100
Connection ~ 7800 3100
Wire Wire Line
	7800 3100 7800 3250
$Comp
L Device:R_US R1
U 1 1 5F5BA383
P 4400 1100
F 0 "R1" V 4195 1100 50  0000 C CNN
F 1 "10k" V 4286 1100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Vertical" V 4440 1090 50  0001 C CNN
F 3 "~" H 4400 1100 50  0001 C CNN
	1    4400 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 1100 4100 1100
$Comp
L power:+5V #PWR0110
U 1 1 5F5BBF39
P 4750 1100
F 0 "#PWR0110" H 4750 950 50  0001 C CNN
F 1 "+5V" H 4765 1273 50  0000 C CNN
F 2 "" H 4750 1100 50  0001 C CNN
F 3 "" H 4750 1100 50  0001 C CNN
	1    4750 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F5BC8EB
P 4650 1300
F 0 "#PWR0111" H 4650 1050 50  0001 C CNN
F 1 "GND" H 4655 1127 50  0000 C CNN
F 2 "" H 4650 1300 50  0001 C CNN
F 3 "" H 4650 1300 50  0001 C CNN
	1    4650 1300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5F5BD388
P 4300 1300
F 0 "SW1" H 4300 1207 50  0000 C CNN
F 1 "Reset" H 4300 1116 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 4300 1500 50  0001 C CNN
F 3 "~" H 4300 1500 50  0001 C CNN
	1    4300 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1100 4750 1100
Wire Wire Line
	4100 1300 4100 1100
Connection ~ 4100 1100
Wire Wire Line
	4100 1100 4250 1100
$Comp
L power:+5V #PWR0112
U 1 1 5F5C188E
P 5150 2350
F 0 "#PWR0112" H 5150 2200 50  0001 C CNN
F 1 "+5V" H 5165 2523 50  0000 C CNN
F 2 "" H 5150 2350 50  0001 C CNN
F 3 "" H 5150 2350 50  0001 C CNN
	1    5150 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2050 6000 1950
Wire Wire Line
	6000 1950 5900 1950
Connection ~ 5900 1950
Wire Wire Line
	5900 1950 5900 2050
$Comp
L Device:R_US R2
U 1 1 5F5C3032
P 2900 1350
F 0 "R2" H 2968 1396 50  0000 L CNN
F 1 "220" H 2968 1305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Vertical" V 2940 1340 50  0001 C CNN
F 3 "~" H 2900 1350 50  0001 C CNN
	1    2900 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5F5C3D7A
P 2600 1500
F 0 "D1" H 2593 1337 50  0000 C CNN
F 1 "Power" H 2593 1246 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 2600 1500 50  0001 C CNN
F 3 "~" H 2600 1500 50  0001 C CNN
	1    2600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1100 2900 1200
Wire Wire Line
	2900 1500 2750 1500
Wire Wire Line
	2450 1500 2350 1500
Wire Wire Line
	2350 1500 2350 1400
Connection ~ 2350 1400
$Comp
L Device:LED D2
U 1 1 5F5C8698
P 7250 2350
F 0 "D2" H 7243 2095 50  0000 C CNN
F 1 "MCU Power" H 7243 2186 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 7250 2350 50  0001 C CNN
F 3 "~" H 7250 2350 50  0001 C CNN
	1    7250 2350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5F5CAF0C
P 7400 2400
F 0 "#PWR0113" H 7400 2150 50  0001 C CNN
F 1 "GND" H 7405 2227 50  0000 C CNN
F 2 "" H 7400 2400 50  0001 C CNN
F 3 "" H 7400 2400 50  0001 C CNN
	1    7400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2350 7400 2400
$Comp
L Device:R_US R3
U 1 1 5F5CC600
P 7100 2600
F 0 "R3" H 7168 2646 50  0000 L CNN
F 1 "220" H 7168 2555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Vertical" V 7140 2590 50  0001 C CNN
F 3 "~" H 7100 2600 50  0001 C CNN
	1    7100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2350 7100 2450
$Comp
L Connector:Conn_01x06_Female J2
U 1 1 5F5D01BD
P 10150 5150
F 0 "J2" H 10178 5126 50  0000 L CNN
F 1 "ICSP" H 10178 5035 50  0000 L CNN
F 2 "Motor Controller Custom Parts:6PinEdgeConnector" H 10150 5150 50  0001 C CNN
F 3 "~" H 10150 5150 50  0001 C CNN
	1    10150 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5F5D153F
P 9750 4950
F 0 "#PWR0114" H 9750 4800 50  0001 C CNN
F 1 "+5V" H 9765 5123 50  0000 C CNN
F 2 "" H 9750 4950 50  0001 C CNN
F 3 "" H 9750 4950 50  0001 C CNN
	1    9750 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F5D2082
P 9750 5450
F 0 "#PWR0115" H 9750 5200 50  0001 C CNN
F 1 "GND" H 9755 5277 50  0000 C CNN
F 2 "" H 9750 5450 50  0001 C CNN
F 3 "" H 9750 5450 50  0001 C CNN
	1    9750 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 4950 9950 4950
Wire Wire Line
	9750 5450 9950 5450
Wire Wire Line
	5300 2350 5150 2350
Text GLabel 6700 2650 2    50   Input ~ 0
MOSI
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U2
U 1 1 5F5AA0CB
P 5900 3550
F 0 "U2" H 5256 3596 50  0000 R CNN
F 1 "ATmega328P-PU" H 5256 3505 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5900 3550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 5900 3550 50  0001 C CNN
	1    5900 3550
	1    0    0    -1  
$EndComp
Text GLabel 9800 5050 0    50   Input ~ 0
MOSI
Text GLabel 9800 5150 0    50   Input ~ 0
RST
Text GLabel 9800 5250 0    50   Input ~ 0
SCK
Text GLabel 9800 5350 0    50   Input ~ 0
MISO
Wire Wire Line
	9950 5350 9800 5350
Wire Wire Line
	9800 5250 9950 5250
Wire Wire Line
	9800 5150 9950 5150
Wire Wire Line
	9800 5050 9950 5050
Text GLabel 6700 2750 2    50   Input ~ 0
MISO
Wire Wire Line
	6500 2950 7200 2950
Wire Wire Line
	7200 3250 7000 3250
Wire Wire Line
	7000 3250 7000 3050
Wire Wire Line
	7000 3050 6500 3050
Connection ~ 7200 3250
Wire Wire Line
	7100 2850 7100 2750
Wire Wire Line
	6500 2750 6700 2750
Wire Wire Line
	6500 2650 6700 2650
Text GLabel 7200 2850 2    50   Input ~ 0
SCK
Wire Wire Line
	6500 2850 7100 2850
Connection ~ 7100 2850
Wire Wire Line
	7100 2850 7200 2850
Wire Wire Line
	4250 1000 4250 1100
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5F5F441B
P 10100 3500
F 0 "J3" H 10128 3476 50  0000 L CNN
F 1 "I2C" H 10128 3385 50  0000 L CNN
F 2 "Motor Controller Custom Parts:4PinEdgeConnector" H 10100 3500 50  0001 C CNN
F 3 "~" H 10100 3500 50  0001 C CNN
	1    10100 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5F5F5CA1
P 9750 3400
F 0 "#PWR0116" H 9750 3250 50  0001 C CNN
F 1 "+5V" H 9765 3573 50  0000 C CNN
F 2 "" H 9750 3400 50  0001 C CNN
F 3 "" H 9750 3400 50  0001 C CNN
	1    9750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5F5F6578
P 9750 3700
F 0 "#PWR0117" H 9750 3450 50  0001 C CNN
F 1 "GND" H 9755 3527 50  0000 C CNN
F 2 "" H 9750 3700 50  0001 C CNN
F 3 "" H 9750 3700 50  0001 C CNN
	1    9750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3400 9750 3400
Wire Wire Line
	9900 3700 9750 3700
Text GLabel 9750 3500 0    50   Input ~ 0
SCL
Text GLabel 9750 3600 0    50   Input ~ 0
SDA
Wire Wire Line
	9750 3500 9900 3500
Wire Wire Line
	9750 3600 9900 3600
Connection ~ 4250 1100
Text GLabel 6650 3750 2    50   Input ~ 0
SCL
Text GLabel 6650 3650 2    50   Input ~ 0
SDA
Text GLabel 3900 1100 0    50   Input ~ 0
RST
Text GLabel 6650 3850 2    50   Input ~ 0
RST
Wire Wire Line
	6500 3650 6650 3650
Wire Wire Line
	6500 3750 6650 3750
Wire Wire Line
	6500 3850 6650 3850
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 5F60DE54
P 10100 2650
F 0 "J4" H 10128 2626 50  0000 L CNN
F 1 "Quad" H 10128 2535 50  0000 L CNN
F 2 "Motor Controller Custom Parts:4PinEdgeConnector" H 10100 2650 50  0001 C CNN
F 3 "~" H 10100 2650 50  0001 C CNN
	1    10100 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 5F60FBC2
P 9700 2550
F 0 "#PWR0118" H 9700 2400 50  0001 C CNN
F 1 "+5V" H 9715 2723 50  0000 C CNN
F 2 "" H 9700 2550 50  0001 C CNN
F 3 "" H 9700 2550 50  0001 C CNN
	1    9700 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F60FFDB
P 9400 2750
F 0 "#PWR0119" H 9400 2500 50  0001 C CNN
F 1 "GND" H 9405 2577 50  0000 C CNN
F 2 "" H 9400 2750 50  0001 C CNN
F 3 "" H 9400 2750 50  0001 C CNN
	1    9400 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2550 9700 2550
Text GLabel 9700 2650 0    50   Input ~ 0
QA
Text GLabel 9700 2850 0    50   Input ~ 0
QB
Wire Wire Line
	9700 2650 9900 2650
Text GLabel 6700 2350 2    50   Input ~ 0
QA
Text GLabel 6700 2450 2    50   Input ~ 0
QB
Wire Wire Line
	6500 2350 6700 2350
Wire Wire Line
	6500 2450 6700 2450
$Comp
L Connector:TestPoint TP1
U 1 1 5F61B05C
P 6700 1100
F 0 "TP1" H 6758 1218 50  0000 L CNN
F 1 "QA" H 6758 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 6900 1100 50  0001 C CNN
F 3 "~" H 6900 1100 50  0001 C CNN
	1    6700 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5F61B8A5
P 7050 1100
F 0 "TP2" H 7108 1218 50  0000 L CNN
F 1 "QB" H 7108 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7250 1100 50  0001 C CNN
F 3 "~" H 7250 1100 50  0001 C CNN
	1    7050 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5F61BD1A
P 7350 1100
F 0 "TP3" H 7408 1218 50  0000 L CNN
F 1 "SCL" H 7408 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7550 1100 50  0001 C CNN
F 3 "~" H 7550 1100 50  0001 C CNN
	1    7350 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5F61C079
P 7650 1100
F 0 "TP4" H 7708 1218 50  0000 L CNN
F 1 "SDA" H 7708 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7850 1100 50  0001 C CNN
F 3 "~" H 7850 1100 50  0001 C CNN
	1    7650 1100
	1    0    0    -1  
$EndComp
Text GLabel 6700 1250 3    50   Input ~ 0
QA
Text GLabel 7050 1250 3    50   Input ~ 0
QB
Text GLabel 7350 1250 3    50   Input ~ 0
SCL
Text GLabel 7650 1250 3    50   Input ~ 0
SDA
Wire Wire Line
	6700 1100 6700 1250
Wire Wire Line
	7050 1100 7050 1250
Wire Wire Line
	7350 1100 7350 1250
Wire Wire Line
	7650 1100 7650 1250
$Comp
L Connector:TestPoint TP5
U 1 1 5F626239
P 7950 1100
F 0 "TP5" H 8008 1218 50  0000 L CNN
F 1 "GND" H 8008 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8150 1100 50  0001 C CNN
F 3 "~" H 8150 1100 50  0001 C CNN
	1    7950 1100
	1    0    0    -1  
$EndComp
Text GLabel 6800 4350 2    50   Input ~ 0
MOTORA
Text GLabel 6800 4450 2    50   Input ~ 0
MOTORB
Text GLabel 6800 4550 2    50   Input ~ 0
MOTORPWM
Wire Wire Line
	6800 4350 6500 4350
Wire Wire Line
	6500 4450 6800 4450
Wire Wire Line
	6800 4550 6500 4550
Text GLabel 6650 3250 2    50   Input ~ 0
CS
Wire Wire Line
	6500 3250 6650 3250
$Comp
L Connector:Conn_01x06_Female J6
U 1 1 5F642121
P 2350 3000
F 0 "J6" H 2378 2976 50  0000 L CNN
F 1 "Generic Motor Header" H 2378 2885 50  0000 L CNN
F 2 "Motor Controller Custom Parts:6PinEdgeConnector" H 2350 3000 50  0001 C CNN
F 3 "~" H 2350 3000 50  0001 C CNN
	1    2350 3000
	1    0    0    -1  
$EndComp
Text GLabel 2000 2900 0    50   Input ~ 0
MOTORA
Text GLabel 2000 3000 0    50   Input ~ 0
MOTORB
Text GLabel 2000 3200 0    50   Input ~ 0
CS
$Comp
L power:+5V #PWR0122
U 1 1 5F657C2F
P 2000 2800
F 0 "#PWR0122" H 2000 2650 50  0001 C CNN
F 1 "+5V" H 2015 2973 50  0000 C CNN
F 2 "" H 2000 2800 50  0001 C CNN
F 3 "" H 2000 2800 50  0001 C CNN
	1    2000 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5F658135
P 2000 3300
F 0 "#PWR0123" H 2000 3050 50  0001 C CNN
F 1 "GND" H 2005 3127 50  0000 C CNN
F 2 "" H 2000 3300 50  0001 C CNN
F 3 "" H 2000 3300 50  0001 C CNN
	1    2000 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3200 2150 3200
Wire Wire Line
	2000 3100 2150 3100
Wire Wire Line
	2000 3000 2150 3000
Wire Wire Line
	2000 2900 2150 2900
Wire Wire Line
	2000 2800 2150 2800
$Comp
L Connector:TestPoint TP6
U 1 1 5F6938E3
P 8250 1100
F 0 "TP6" H 8308 1218 50  0000 L CNN
F 1 "MOTORA" H 8308 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8450 1100 50  0001 C CNN
F 3 "~" H 8450 1100 50  0001 C CNN
	1    8250 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5F6969CF
P 8650 1100
F 0 "TP7" H 8708 1218 50  0000 L CNN
F 1 "MOTORB" H 8708 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8850 1100 50  0001 C CNN
F 3 "~" H 8850 1100 50  0001 C CNN
	1    8650 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5F6998AE
P 9050 1100
F 0 "TP8" H 9108 1218 50  0000 L CNN
F 1 "MOTORPWM" H 9108 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 9250 1100 50  0001 C CNN
F 3 "~" H 9250 1100 50  0001 C CNN
	1    9050 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 5F6AA92A
P 9600 1100
F 0 "TP9" H 9658 1218 50  0000 L CNN
F 1 "CS" H 9658 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 9800 1100 50  0001 C CNN
F 3 "~" H 9800 1100 50  0001 C CNN
	1    9600 1100
	1    0    0    -1  
$EndComp
Text GLabel 8250 1250 3    50   Input ~ 0
MOTORA
Text GLabel 8650 1250 3    50   Input ~ 0
MOTORB
Text GLabel 9050 1250 3    50   Input ~ 0
MOTORPWM
Text GLabel 9600 1250 3    50   Input ~ 0
CS
Wire Wire Line
	8250 1100 8250 1250
Wire Wire Line
	8650 1100 8650 1250
Wire Wire Line
	9050 1100 9050 1250
Wire Wire Line
	9600 1100 9600 1250
$Comp
L power:+5V #PWR0105
U 1 1 5F5A6D91
P 2900 1050
F 0 "#PWR0105" H 2900 900 50  0001 C CNN
F 1 "+5V" H 2988 1087 50  0000 L CNN
F 2 "" H 2900 1050 50  0001 C CNN
F 3 "" H 2900 1050 50  0001 C CNN
	1    2900 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1050 2900 1100
Connection ~ 2900 1100
Wire Wire Line
	4500 1300 4650 1300
Wire Wire Line
	5900 1550 5900 1600
Connection ~ 5900 1600
Wire Wire Line
	950  700  950  900 
Wire Wire Line
	2000 3300 2150 3300
$Comp
L power:GND #PWR0126
U 1 1 5F724D3C
P 7950 1250
F 0 "#PWR0126" H 7950 1000 50  0001 C CNN
F 1 "GND" H 7955 1077 50  0000 C CNN
F 2 "" H 7950 1250 50  0001 C CNN
F 3 "" H 7950 1250 50  0001 C CNN
	1    7950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1100 7950 1250
Wire Wire Line
	5700 1900 5700 1950
Wire Notes Line
	3300 500  3300 1800
Wire Notes Line
	500  1800 500  500 
Text Notes 1500 1900 0    50   ~ 0
Power Regulator
Wire Notes Line
	6500 850  6500 1800
Wire Notes Line
	10500 1800 10500 850 
Text Notes 8000 800  0    50   ~ 0
Test Points
Wire Notes Line
	10700 4650 10700 5750
Wire Notes Line
	10700 5750 9250 5750
Wire Notes Line
	9250 5750 9250 4650
Wire Notes Line
	9250 4650 10700 4650
Text Notes 9550 4600 0    50   ~ 0
Programming Header
Wire Notes Line
	9300 2300 9300 4050
Wire Notes Line
	9300 4050 10350 4050
Wire Notes Line
	10350 4050 10350 2300
Wire Notes Line
	10350 2300 9300 2300
Text Notes 9400 2250 0    50   ~ 0
Encoder Connectors
Wire Notes Line
	4600 5500 8400 5500
Wire Notes Line
	8400 5500 8400 2000
Wire Notes Line
	8400 2000 6350 2000
Wire Notes Line
	6350 2000 6350 1150
Wire Notes Line
	6350 1150 5000 1150
Wire Notes Line
	5000 2200 4600 2200
Text Notes 5400 1100 0    50   ~ 0
Microcontroller
Wire Notes Line
	4900 500  4900 1800
Wire Notes Line
	500  500  4900 500 
Wire Notes Line
	500  1800 4900 1800
Text Notes 3950 1900 0    50   ~ 0
Reset Switch
Wire Notes Line
	5000 1150 5000 2200
Wire Notes Line
	4600 2200 4600 5500
$Comp
L Device:CP1 C6
U 1 1 5F665C92
P 5200 6050
F 0 "C6" H 5150 5850 50  0000 L CNN
F 1 "10uf" H 5150 5750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5200 6050 50  0001 C CNN
F 3 "~" H 5200 6050 50  0001 C CNN
	1    5200 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5F71CA77
P 5200 6400
F 0 "#PWR0127" H 5200 6150 50  0001 C CNN
F 1 "GND" H 5205 6227 50  0000 C CNN
F 2 "" H 5200 6400 50  0001 C CNN
F 3 "" H 5200 6400 50  0001 C CNN
	1    5200 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6200 5200 6400
Text GLabel 5050 5900 0    50   Input ~ 0
CS
Wire Wire Line
	5050 5900 5200 5900
Wire Notes Line
	4800 5800 5700 5800
Wire Notes Line
	5700 5800 5700 6650
Wire Notes Line
	5700 6650 4800 6650
Wire Notes Line
	4800 6650 4800 5800
Text Notes 4900 5750 0    50   ~ 0
Current Sense \nSmoothing Capacitor
Wire Wire Line
	1500 4800 2150 4800
Connection ~ 1500 4800
Wire Wire Line
	1500 4700 1500 4800
Wire Wire Line
	1500 4900 2150 4900
Connection ~ 1500 4900
Wire Wire Line
	1500 4950 1500 4900
Wire Wire Line
	2050 4000 2150 4000
Wire Wire Line
	2050 4400 2150 4400
Text GLabel 2050 4400 0    50   Input ~ 0
CS
Wire Wire Line
	2050 4700 2150 4700
Wire Wire Line
	1950 4100 2150 4100
Wire Wire Line
	1900 5000 2150 5000
Wire Wire Line
	1700 5100 2150 5100
$Comp
L Connector:Conn_01x14_Female J7
U 1 1 5F6C7F33
P 2350 4400
F 0 "J7" H 2378 4376 50  0000 L CNN
F 1 "VNH5019 Breakout" H 2378 4285 50  0000 L CNN
F 2 "Motor Controller Custom Parts:VNH5019Footprint" H 2350 4400 50  0001 C CNN
F 3 "~" H 2350 4400 50  0001 C CNN
	1    2350 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F633F00
P 2050 4000
F 0 "#PWR0120" H 2050 3750 50  0001 C CNN
F 1 "GND" V 2055 3872 50  0000 R CNN
F 2 "" H 2050 4000 50  0001 C CNN
F 3 "" H 2050 4000 50  0001 C CNN
	1    2050 4000
	0    1    1    0   
$EndComp
Text GLabel 2050 4200 0    50   Input ~ 0
MOTORB
Wire Wire Line
	2050 4200 2150 4200
Wire Wire Line
	2050 4500 2150 4500
Text GLabel 2050 4700 0    50   Input ~ 0
MOTORA
Text GLabel 2050 4500 0    50   Input ~ 0
MOTORPWM
$Comp
L power:+5V #PWR0121
U 1 1 5F6349F4
P 1950 4100
F 0 "#PWR0121" H 1950 3950 50  0001 C CNN
F 1 "+5V" V 1965 4228 50  0000 L CNN
F 2 "" H 1950 4100 50  0001 C CNN
F 3 "" H 1950 4100 50  0001 C CNN
	1    1950 4100
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0124
U 1 1 5F673443
P 1700 5100
F 0 "#PWR0124" H 1700 4950 50  0001 C CNN
F 1 "+12V" V 1600 5050 50  0000 L CNN
F 2 "" H 1700 5100 50  0001 C CNN
F 3 "" H 1700 5100 50  0001 C CNN
	1    1700 5100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5F6738D4
P 1900 5000
F 0 "#PWR0125" H 1900 4750 50  0001 C CNN
F 1 "GND" V 1900 4800 50  0000 C CNN
F 2 "" H 1900 5000 50  0001 C CNN
F 3 "" H 1900 5000 50  0001 C CNN
	1    1900 5000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP12
U 1 1 5F7368B8
P 1500 4700
F 0 "TP12" V 1695 4772 50  0000 C CNN
F 1 "OUTA" V 1604 4772 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 1700 4700 50  0001 C CNN
F 3 "~" H 1700 4700 50  0001 C CNN
	1    1500 4700
	0    -1   -1   0   
$EndComp
Text GLabel 2000 3100 0    50   Input ~ 0
MOTORPWM
Wire Notes Line
	700  2500 3350 2500
Wire Notes Line
	3350 2500 3350 5550
Wire Notes Line
	3350 5550 700  5550
Wire Notes Line
	700  5550 700  2500
Text Notes 1400 2450 0    50   ~ 0
Motor Controller Interface
$Comp
L Connector:Screw_Terminal_01x04 J8
U 1 1 5F81D2E5
P 950 4900
F 0 "J8" H 868 4475 50  0000 C CNN
F 1 "Motor Output" H 868 4566 50  0000 C CNN
F 2 "Motor Controller Custom Parts:2x2TerminalBlock" H 950 4900 50  0001 C CNN
F 3 "~" H 950 4900 50  0001 C CNN
	1    950  4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 4700 1250 4700
Wire Wire Line
	1250 4700 1250 4900
Wire Wire Line
	1250 4900 1150 4900
Wire Wire Line
	1150 5000 1300 5000
Wire Wire Line
	1300 5000 1300 4800
Wire Wire Line
	1300 4800 1150 4800
Wire Wire Line
	1250 4900 1500 4900
Connection ~ 1250 4900
Wire Wire Line
	1300 4800 1500 4800
Connection ~ 1300 4800
Wire Wire Line
	9700 2850 9900 2850
Wire Wire Line
	9400 2750 9900 2750
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 5F85CCBC
P 550 1400
F 0 "J1" H 468 975 50  0000 C CNN
F 1 "VIN" H 468 1066 50  0000 C CNN
F 2 "Motor Controller Custom Parts:2x2TerminalBlock" H 550 1400 50  0001 C CNN
F 3 "~" H 550 1400 50  0001 C CNN
	1    550  1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	750  1300 800  1300
Wire Wire Line
	750  1400 850  1400
Wire Wire Line
	850  1400 850  1200
Wire Wire Line
	850  1200 750  1200
Connection ~ 850  1400
Wire Wire Line
	850  1400 950  1400
Wire Wire Line
	800  1300 800  1500
Wire Wire Line
	800  1500 750  1500
Connection ~ 800  1300
Wire Wire Line
	800  1300 950  1300
$Comp
L Connector:TestPoint TP10
U 1 1 5F8810A4
P 9900 1100
F 0 "TP10" H 9958 1218 50  0000 L CNN
F 1 "5V" H 9958 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 10100 1100 50  0001 C CNN
F 3 "~" H 10100 1100 50  0001 C CNN
	1    9900 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 5F885FD7
P 10200 1100
F 0 "TP11" H 10258 1218 50  0000 L CNN
F 1 "12V" H 10258 1127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 10400 1100 50  0001 C CNN
F 3 "~" H 10400 1100 50  0001 C CNN
	1    10200 1100
	1    0    0    -1  
$EndComp
Wire Notes Line
	6500 850  10500 850 
Wire Notes Line
	6500 1800 10500 1800
$Comp
L power:+5V #PWR0128
U 1 1 5F8A0275
P 9900 1350
F 0 "#PWR0128" H 9900 1200 50  0001 C CNN
F 1 "+5V" H 9915 1523 50  0000 C CNN
F 2 "" H 9900 1350 50  0001 C CNN
F 3 "" H 9900 1350 50  0001 C CNN
	1    9900 1350
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR0129
U 1 1 5F8A11CC
P 10200 1350
F 0 "#PWR0129" H 10200 1200 50  0001 C CNN
F 1 "+12V" H 10215 1523 50  0000 C CNN
F 2 "" H 10200 1350 50  0001 C CNN
F 3 "" H 10200 1350 50  0001 C CNN
	1    10200 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 1100 10200 1350
Wire Wire Line
	9900 1100 9900 1350
$Comp
L Connector:TestPoint TP13
U 1 1 5F737088
P 1500 4950
F 0 "TP13" V 1400 5050 50  0000 C CNN
F 1 "OUTB" V 1300 5050 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 1700 4950 50  0001 C CNN
F 3 "~" H 1700 4950 50  0001 C CNN
	1    1500 4950
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
