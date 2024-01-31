#include <OneWire.h>
#include <WiFiManager.h>
#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"
#include <DallasTemperature.h>
#include <ESP32Servo.h>


//#define WIFI_SSID "B0DAK YELL0W"
//#define WIFI_PASSWORD "grasshopper120801"
#define API_KEY "AIzaSyC3dJOUk9CTBf7ptrPrI7UH_eImYHiG_og"
#define DATABASE_URL "https://aquatech-1d9b9-default-rtdb.asia-southeast1.firebasedatabase.app/"
#define ONE_WIRE_BUS 4 // PIN FOR WATER TEMPERATURE SENSOR
#define MQ135_THRESHOLD_1 1000 // Fresh Air threshold
#define echoPin 26               // CHANGE PIN NUMBER HERE IF YOU WANT TO USE A DIFFERENT PIN
#define trigPin 27              // CHANGE PIN NUMBER HERE IF YOU WANT TO USE A DIFFERENT PIN
#define RELAY_PIN 18            // PUMP  1
#define RELAY_PIN_2 21            // PUMP 2
#define SERVO_PIN 2             // SERVO MOTOR
#define SERVO_PIN2 5             // SERVO MOTOR 2

FirebaseData fbdo;
FirebaseAuth auth;  
FirebaseConfig config;


//for sensors
unsigned long sendDataPrevMillis = 0; // Corrected the variable declaration
bool signupOK = false;
float PH_LEVEL;
int pH_Value;
int AMMONIA;
int PPM;

//for water changing mechanism 
long duration, distance;

//for servo motor

int pos = 0; 

OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
WiFiClient espClient;
Servo servoMotor;
Servo servoMotor2;



void setup() {
  
  WiFi.mode(WIFI_STA); // explicitly set mode, esp defaults to STA+AP
  Serial.begin(115200);
  sensors.begin();

  //WIFI CONNECTION 
  Serial.begin(115200);
    
    //WiFiManager, Local intialization. Once its business is done, there is no need to keep it around
    WiFiManager wm;

    // reset settings - wipe stored credentials for testing
    // these are stored by the esp library
    wm.resetSettings();

    // Automatically connect using saved credentials,
    // if connection fails, it starts an access point with the specified name ( "AutoConnectAP"),
    // if empty will auto generate SSID, if password is blank it will be anonymous AP (wm.autoConnect())
    // then goes into a blocking loop awaiting configuration and will return success result

    bool res;
    // res = wm.autoConnect(); // auto generated AP name from chipid
    res = wm.autoConnect("Aquatech"); // anonymous ap
    //res = wm.autoConnect("AutoConnectAP","password"); // password protected ap

    if(!res) {
        Serial.println("Failed to connect");
        // ESP.restart();
    } 
    else {
        //if you get here you have connected to the WiFi    
        Serial.println("connected...yeey :)");
    }


  //FIREBASE CONNECTION:
  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;
  if (Firebase.signUp(&config, &auth, "", "")) {
    Serial.println("signUp OK");
    signupOK = true;
  } else {
    Serial.printf("%s\n", config.signer.signupError.message.c_str()); // Added missing '\n' and a semicolon
  }
  // config.token_status_callback = tokenStatusCallBack; // Commented out for now as it's not defined
  Firebase.begin(&config, &auth); // Corrected the variable name from 'confi' to 'config'
  Firebase.reconnectWiFi(true);
  
  pinMode(pH_Value, INPUT); 
  pinMode(RELAY_PIN, OUTPUT);
  pinMode(RELAY_PIN_2, OUTPUT);
  digitalWrite(RELAY_PIN, HIGH);
  digitalWrite(RELAY_PIN_2, HIGH);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  servoMotor.setPeriodHertz(50); // PWM frequency for SG90
  servoMotor.attach(SERVO_PIN, 500, 2400); // Minimum and maximum pulse width (in µs) to go from 0° to 180
  servoMotor2.setPeriodHertz(50); // PWM frequency for SG90
  servoMotor2.attach(SERVO_PIN2, 500, 2400); // Minimum and maximum pulse width (in µs) to go from 0° to 180
}



 
void loop() {
 
 
  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 5000 || sendDataPrevMillis == 0)) {
    sendDataPrevMillis = millis();
    
    //PUMP1:
    
      digitalWrite(trigPin, LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin, HIGH);  
      delayMicroseconds(10);
      digitalWrite(trigPin, LOW);
      
      duration = pulseIn(echoPin, HIGH);
      distance = duration / 58.2;
      String disp = String(distance);
      Serial.print (distance);
      Serial.print("Distance: ");
      Serial.print(disp);
    
    
    if (Firebase.RTDB.get(&fbdo, "/Commands/RELAY")) {
    if (fbdo.dataTypeEnum() == firebase_rtdb_data_type_string) {
    String relayValue = fbdo.to<String>();
    Serial.println(relayValue);
      if (relayValue == "Relay ON") { //THIS WILL TAKE WATER FROM THE TANK
      digitalWrite(RELAY_PIN, LOW);
      Serial.println("Received message. Pumping out water from tank.");
      }
  
      if (distance >= 22 ) {
      Serial.println("Distance is greater or equal to 15cm. Pump will now stop taking out water.");
      digitalWrite(RELAY_PIN, HIGH);
      }
    } //if fbdo
   } //if Firebase.RTDB

     if (distance >= 19 && distance <= 22) {
        Serial.println("Pump will now start refilling tank.");
      digitalWrite(RELAY_PIN_2, LOW);   
      }
      
      if (distance <= 18 ) {
      Serial.println("Distance is greater or equal to 3cm. Pump will now stop refilling tank.");
      digitalWrite(RELAY_PIN_2, HIGH);
      }

    //SERVO MOTOR:
    if (Firebase.RTDB.get(&fbdo, "/Commands/SERVO")) {
    if (fbdo.dataTypeEnum() == firebase_rtdb_data_type_string) {
    String servoValue = fbdo.to<String>();
    Serial.println(servoValue);      
    if(servoValue=="Servo ON"){
     Serial.println("Received message. Dispensing the pH balancers.");
      
      //open
      for (pos = 0; pos <= 90; pos += 1) 
       { 
          servoMotor2.write(pos); 
          servoMotor.write(pos); 
          delay(10);  
        }          

       for (pos = 90; pos >= 0; pos -= 1)  
      { 
         servoMotor2.write(pos);   
         servoMotor.write(pos); 
         delay(10);  
       }

     
     
    }
    }
    
      
      
    // WATER TEMPERATURE CODE:
    sensors.requestTemperatures();
    float WATER_TEMP = sensors.getTempCByIndex(0);
  
    // PH LEVEL CODE:
    pH_Value = analogRead(36);
    PH_LEVEL = pH_Value * (5.0 / 1023.0);
  
    // AMMONIA LEVEL CODE:

    PPM = analogRead(39);
    AMMONIA = PPM / 1000.0;

    // SEND DATA TO FIREBASE:
    if (Firebase.RTDB.setFloat(&fbdo, "Sensor/WATER_TEMP", WATER_TEMP)) {
      Serial.println();
      Serial.print(WATER_TEMP);
      Serial.print("Successfully saved to: " + fbdo.dataPath());
      Serial.println("(" + fbdo.dataType() + ")");
    } else {
      Serial.println("FAILED : " + fbdo.errorReason()); // Corrected string concatenation
    }
    
    if (Firebase.RTDB.setFloat(&fbdo, "Sensor/PH_LEVEL", PH_LEVEL)) {
      Serial.println();
      Serial.print(PH_LEVEL);
      Serial.print("Successfully saved to: " + fbdo.dataPath());
      Serial.println("(" + fbdo.dataType() + ")");
    } else {
      Serial.println("FAILED : " + fbdo.errorReason()); // Corrected string concatenation
    }
    
    if (Firebase.RTDB.setInt(&fbdo, "Sensor/AMMONIA", AMMONIA)) {
      Serial.println();
      Serial.print(AMMONIA);
      Serial.print("Successfully saved to: " + fbdo.dataPath());
      Serial.println("(" + fbdo.dataType() + ")");
    } else {
      Serial.println("FAILED : " + fbdo.errorReason()); // Corrected string concatenation
    }

  }
  delay(5000);
}
}
    
