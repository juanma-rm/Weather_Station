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
L MCU_Module:WeMos_D1_mini U1
U 1 1 60FBEF76
P 3700 2690
F 0 "U1" H 3700 1801 50  0000 C CNN
F 1 "WeMos_D1_mini" H 3700 1710 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 3700 1540 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 1850 1540 50  0001 C CNN
	1    3700 2690
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2290 3200 2290
Wire Wire Line
	3200 2290 3200 1800
Wire Wire Line
	3200 1800 4210 1800
Wire Wire Line
	4210 1800 4210 2290
Wire Wire Line
	4210 2290 4100 2290
$Comp
L Sensor:DHT11 U2
U 1 1 60FC2C7A
P 5160 2550
F 0 "U2" H 4916 2596 50  0000 R CNN
F 1 "DHT11" H 4916 2505 50  0000 R CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 5160 2150 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 5310 2800 50  0001 C CNN
	1    5160 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3320 4590 3320
Wire Wire Line
	4590 3320 4590 2390
Wire Wire Line
	4590 2390 4100 2390
$Comp
L power:VCC #PWR0101
U 1 1 60FC4A77
P 3800 1630
F 0 "#PWR0101" H 3800 1480 50  0001 C CNN
F 1 "VCC" H 3815 1803 50  0000 C CNN
F 2 "" H 3800 1630 50  0001 C CNN
F 3 "" H 3800 1630 50  0001 C CNN
	1    3800 1630
	1    0    0    -1  
$EndComp
Wire Wire Line
	5160 2250 5160 1790
$Comp
L power:GND #PWR0103
U 1 1 60FC9FD0
P 3700 4080
F 0 "#PWR0103" H 3700 3830 50  0001 C CNN
F 1 "GND" H 3705 3907 50  0000 C CNN
F 2 "" H 3700 4080 50  0001 C CNN
F 3 "" H 3700 4080 50  0001 C CNN
	1    3700 4080
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4080 3700 3770
$Comp
L Device:R R1
U 1 1 60FCC754
P 5600 1990
F 0 "R1" H 5670 2036 50  0000 L CNN
F 1 "10K" H 5670 1945 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5530 1990 50  0001 C CNN
F 3 "~" H 5600 1990 50  0001 C CNN
	1    5600 1990
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1840 5600 1790
Wire Wire Line
	5600 1790 5160 1790
Wire Wire Line
	5600 2140 5600 2550
Wire Wire Line
	5600 3320 5600 2550
Connection ~ 5600 2550
Wire Wire Line
	5160 1660 5160 1790
Connection ~ 5160 1790
Wire Wire Line
	5160 1660 3800 1660
Wire Wire Line
	3800 1630 3800 1660
Connection ~ 3800 1660
Wire Wire Line
	3800 1660 3800 1890
Wire Wire Line
	5160 3770 3700 3770
Wire Wire Line
	5160 2850 5160 3770
Connection ~ 3700 3770
Wire Wire Line
	3700 3770 3700 3490
Wire Wire Line
	5460 2550 5600 2550
$EndSCHEMATC
