//
//  Constants.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 10/5/23.
//
import UIKit

let mqtt_broker = "broker.hivemq.com"
let mqtt_username = "test123"
let mqtt_password = "Test1234"
let mqtt_port = 8883
let tempHumidTopic = "LightMeApp_temp" //ΛΗΨΗ ΘΕΡΜΟΚΡΑΣΙΑΣ ΚΑΙ ΥΓΡΑΣΙΑΣ
let ledTopic = "LightMeApp_led" //ΑΠΟΣΤΟΛΗ ΤΙΜΗΣ 0 'Η 1 ΓΙΑ ΝΑ ΑΝΑΨΕΙ ΤΟ LED
let textTopic = "LightMeApp_text" //ΑΠΟΣΤΟΛΗ ΚΕΙΜΕΝΟΥ ΓΙΑ ΕΜΦΑΝΙΣΗ
let greenColor = UIColor(red: 0.5725, green: 0.7333, blue: 0.270588, alpha: 1)
