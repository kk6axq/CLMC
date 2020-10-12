EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Sensor_Magnetic:AS5048B U1
U 1 1 5F516257
P 5600 2000
F 0 "U1" H 6143 2046 50  0000 L CNN
F 1 "AS5048B" H 6143 1955 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5600 1250 50  0001 C CNN
F 3 "https://ams.com/documents/20143/36005/AS5048_DS000298_4-00.pdf" H 3450 3600 50  0001 C CNN
	1    5600 2000
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F51860F
P 7200 1850
F 0 "C1" H 7315 1896 50  0000 L CNN
F 1 "100nf" H 7315 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7238 1700 50  0001 C CNN
F 3 "~" H 7200 1850 50  0001 C CNN
	1    7200 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5F518ED6
P 6800 1800
F 0 "J1" H 6880 1792 50  0000 L CNN
F 1 "Conn_01x04" H 6880 1701 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x04_P2.00mm_Vertical" H 6800 1800 50  0001 C CNN
F 3 "~" H 6800 1800 50  0001 C CNN
	1    6800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1550 6600 1700
Wire Wire Line
	6600 1550 7200 1550
Wire Wire Line
	7200 1550 7200 1700
Wire Wire Line
	7200 2000 7200 2200
Wire Wire Line
	7200 2200 6600 2200
Wire Wire Line
	6600 2200 6600 2000
Connection ~ 6600 2200
Wire Wire Line
	5600 1500 5600 1350
Wire Wire Line
	5600 1350 6600 1350
Wire Wire Line
	6600 1350 6600 1550
Connection ~ 6600 1550
Wire Wire Line
	5300 2700 6600 2700
Wire Wire Line
	6600 2200 6600 2700
Wire Wire Line
	5700 1400 5700 1500
Wire Wire Line
	5300 2500 5300 2700
Connection ~ 5300 2500
Wire Wire Line
	4450 2500 5300 2500
Wire Wire Line
	4450 2350 4450 2500
Wire Wire Line
	4450 1400 5700 1400
Wire Wire Line
	4450 2050 4450 1400
$Comp
L Device:C C2
U 1 1 5F517F1A
P 4450 2200
F 0 "C2" H 4565 2246 50  0000 L CNN
F 1 "10uf" H 4565 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4488 2050 50  0001 C CNN
F 3 "~" H 4450 2200 50  0001 C CNN
	1    4450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1900 6250 1900
Wire Wire Line
	6250 1900 6250 1800
Wire Wire Line
	6250 1800 6600 1800
Wire Wire Line
	6100 2000 6350 2000
Wire Wire Line
	6350 2000 6350 1900
Wire Wire Line
	6350 1900 6600 1900
$EndSCHEMATC
