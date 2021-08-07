# Weather Station
Weather Station is a system that senses temperature and humidity and allows checking them via Blynk (from Android app, for instance).

It is based on:
  - Wemos D1 mini ESP8266-based board, taking charge of requesting data from the sensor and sending it to a Blynk server via Wi-Fi. The device sends data for 4 seconds and goes in deep sleep mode for 5 minutes to save power.
  - DHT22 temperature and humidity sensor.
  - Blynk server to host the data.

The hardware and software diagrams, as well as the 3D view of the resulting PCB, may be found below:

<p align="center">
  <img src="https://user-images.githubusercontent.com/41286765/128599306-f16868b0-5684-4d7d-94fd-704864afc33d.png">
</p>
* Note: Several (N) systems may be used to sense data at different points, each one requiring one DHT22 and one Wemos D1 mini
<br/>
<br/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/41286765/128599309-48aa1ab7-175d-4d48-9b42-356b67d8b355.png">
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/41286765/128599302-e8741b80-66cf-452c-bf3e-60cfd5056d2c.jpg">
</p>

# Requirements
- 1 Wemos D1 mini per node
- 1 DHT22 per node
- 1 10kOhm resistor per node
- 1 microUSB charger per node
- Some way to tie and put all the previous components together (PCB + solder kit, protoboard + wires, ...)
- Blynk account + Blynk client (Android app, for instance)
- Wi-Fi available for Wemos D1 mini

# Instructions (based on my developments tools)
1) Software:
    
    1.1) Install VSCode + PlatformIO + Arduino framework + dependencies
          
          lib_deps = blynkkk/Blynk@^1.0.1<br/>
          adafruit/DHT sensor library@^1.4.2<br/>
          adafruit/Adafruit Unified Sensor@^1.1.4

    1.2) Install some Blynk client (Android app for instance), create a Blynk account and crEate your Blynk project: adding charts, labels or any other elements, creating a new device per each node selecting Wemos D1 mini, generating a token per each node and associating each charts / labels to virtual pins the devices previously created (V1 for temperature, V2 for humidity; this may be changed in main.cpp). Check out Blynk official documentation to get more details.
    
    1.3) Connect the Wemos board (without connecting it to the rest of elements).
    
    1.4) Write your device's Blynk token in auth variable, one token per node; write your WiFi credentials (ssid / pass). DEBUG macro may be uncommented to help in debugging process, if needed.
    
    1.5) Build the main.cpp (dependencies will be automatically compiled) and upload the resulting project to the board.

2) Build the hardware system:

    2.1) Order or build the PCB
    
    2.2) Mount / solder the componentes
    
    2.3) Connect the Micro-USB

3) Enjoy. If all went well, data should be now visible from the Blynk client.

# Development tools
- VSCode + PlatformIO add-on + Arduino framework
- Libraries dependencies:

          lib_deps = blynkkk/Blynk@^1.0.1<br/>
          adafruit/DHT sensor library@^1.4.2<br/>
          adafruit/Adafruit Unified Sensor@^1.1.4
          
- KiCAD for schematics and PCB layout
