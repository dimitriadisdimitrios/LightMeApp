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
//    var mqtt: CocoaMQTT5? = nil
    var mqtt = CocoaMQTT5(clientID: "CocoaMQTT-" + String(ProcessInfo().processIdentifier), host: "mqtt-dashboard.com", port: 8883)

    // Connect to MQTT broker
    func connect(username: String, password: String, delegate: CocoaMQTT5Delegate) {
        mqtt.username = ""//username
        mqtt.password = ""//password
        mqtt.delegate = delegate
        mqtt.cleanSession = true
        mqtt.keepAlive = 60
        mqtt.enableSSL = true
//        mqtt.autoReconnect = true
        mqtt.logLevel = .debug
//        mqtt.sslSettings = [
//            GCDAsyncSocketManuallyEvaluateTrust: NSNumber(booleanLiteral: true),
//            GCDAsyncSocketUseCFStreamForTLS: NSNumber(booleanLiteral: false),
//            kCFStreamSSLPeerName as String: "" as NSString,
//            GCDAsyncSocketSSLProtocolVersionMin: NSNumber(integerLiteral: Int(SSLProtocol.tlsProtocol1.rawValue)),
//            GCDAsyncSocketSSLProtocolVersionMax: NSNumber(integerLiteral: Int(SSLProtocol.tlsProtocol12.rawValue)),
//        ]
        let asd = mqtt.connect()
        print(asd)

//        let websocket = CocoaMQTTWebSocket(uri: "/ws")
//        websocket.enableSSL = true
//        mqtt = CocoaMQTT5(clientID: "CocoaMQTT-" + String(ProcessInfo().processIdentifier), host: "3f4916e4c8eb4e8799278c6fe5e3aee2.s2.eu.hivemq.cloud", port: 8884, socket: websocket)
//        mqtt?.username = username
//        mqtt?.password = password
//        mqtt?.enableSSL = false
//        mqtt?.logLevel = .debug
//        mqtt?.delegate = delegate
//        let connectProperties = MqttConnectProperties()
//        connectProperties.topicAliasMaximum = 0
//        // ...
//        mqtt?.connectProperties = connectProperties
//        // ...
//
//        _ = mqtt?.connect()
    }

    // Subscribe to a topic
    func subscribe(to topic: String) {
        mqtt.subscribe(topic)
    }

    // Publish a message to a topic
    func publish(to topic: String, with message: String) {
//        let mqttMessage = CocoaMQTTMessage(topic: topic, string: message)
//        mqtt.publish(mqttMessage)
        let mqttMessage = CocoaMQTT5Message(topic: topic, string: message)
        mqtt.publish(mqttMessage, properties: MqttPublishProperties())
    }
}
