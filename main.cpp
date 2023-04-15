/* -------------------------------------------------------------
 * System to measure temp and humidity provided by a DHT22 sensor
 * and upload the corresponding data to Blynk
 * 
 * Platform: Wemos D1 mini
 * ------------------------------------------------------------*/

//#define DEBUG

/* -------------------------------------------------------------
 * Includes
 * ------------------------------------------------------------*/

#include <Arduino.h>
// DHT22
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>
// Wifi and Blynk
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

/* -------------------------------------------------------------
 * Pinout
 * ------------------------------------------------------------*/

// WEMOS_D0_IN      --> WEMOS_RST_OUT
// WEMOS_D1_INOUT   --> DHT2_INOUT (pull-up 10k)

/* -------------------------------------------------------------
 * Function prototypes
 * ------------------------------------------------------------*/

#if defined (DEBUG)
void debug_Wifi(void);
#endif
void update_blynk(void);
void go_to_sleep(void);

/* -------------------------------------------------------------
 * Global data
 * ------------------------------------------------------------*/

// Blynk device (1, 2, 3)
#define DEV_ID 2
#if DEV_ID == 1
#define VIRT_PIN_T V1 
#define VIRT_PIN_H V2
#elif DEV_ID == 2
#define VIRT_PIN_T V3
#define VIRT_PIN_H V4
#elif DEV_ID == 3
#define VIRT_PIN_T V5
#define VIRT_PIN_H V6
#endif

// DTH22
#define DHTPIN D1
DHT dht(DHTPIN, DHT22);
float temp = -99;
float hum = -99;

// Blynk: tokens
char auth[] = "my_token";

// Wifi credentials
char ssid[] = "my_wifi_ssid";
char pass[] = "my_wifi_pass";

// Timing
SimpleTimer timer_upload_blynk;
SimpleTimer timer_sleep;
uint32_t time_sleep = 300e6;	// Time between consecutive awakening (us). 1e6 = 1s; 3600s = 36e8

/* -------------------------------------------------------------
 * Main algorithm
 * ------------------------------------------------------------*/

void setup(void)
{
    #if defined (DEBUG)
    Serial.begin(115200);   // Serial comm (for debug)
    Serial.println("Wemos alive");
    #endif

	// Blynk and wifi
	Blynk.begin(auth, ssid, pass, "blynk.cloud", 80);
    #if defined (DEBUG)
    debug_Wifi();           // Debug Wifi por monitor serie
    #endif

	// DHT
	dht.begin();

	// Timing
	timer_upload_blynk.setInterval(1000L, update_blynk);	// New measurements are uploaded each 1 s = 1000 ms
	timer_sleep.setInterval(4000L, go_to_sleep);			// System goes to sleep after 4 s = 4000 ms
}

void loop(void)
{
    Blynk.run();
	timer_upload_blynk.run();
	timer_sleep.run();
}

/* -------------------------------------------------------------
 * Function definitions
 * ------------------------------------------------------------*/

// Debug Wifi
#if defined (DEBUG)
void debug_Wifi(void)
{
	Serial.print("Connecting");
	while (WiFi.status() != WL_CONNECTED)
	{
		delay(500);
		Serial.print(".");
	}
	Serial.println();
	Serial.print("Connected, IP address: ");
	Serial.println(WiFi.localIP());
}
#endif

// Update virtual values (temp and hum) in Blynk
void update_blynk(void)
{
	temp = dht.readTemperature();
	hum = dht.readHumidity();
	Blynk.virtualWrite(VIRT_PIN_T, temp);
	Blynk.virtualWrite(VIRT_PIN_H, hum);
}

void go_to_sleep(void)
{
	ESP.deepSleep(time_sleep);
}
