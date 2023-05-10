//
//  MqttManager.swift
//  LightMeApp
//
//  Created by Dimitrios Dimitriadis on 6/5/23.
//

import CocoaMQTT

class MqttManager {

    static let shared = MqttManager()

    // MQTT client
    var mqtt = CocoaMQTT5(clientID: "CocoaMQTT-" + String(ProcessInfo().processIdentifier), host: "mqtt-dashboard.com", port: 8883)

    // Connect to MQTT broker
    func connect(username: String, password: String, delegate: CocoaMQTT5Delegate) {
        mqtt.username = username
        mqtt.password = password
        mqtt.delegate = delegate
        mqtt.cleanSession = true
        mqtt.keepAlive = 60
        mqtt.enableSSL = true
        mqtt.logLevel = .debug
        let connected = mqtt.connect()
        print(connected)
    }

    // Subscribe to a topic
    func subscribe(to topic: String) {
        mqtt.subscribe(topic)
    }

    // Publish a message to a topic
    func publish(to topic: String, with message: String) {
        let mqttMessage = CocoaMQTT5Message(topic: topic, string: message)
        mqtt.publish(mqttMessage, properties: MqttPublishProperties())
    }
}
