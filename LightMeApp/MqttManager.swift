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
//    var mqtt = CocoaMQTT5(clientID: "CocoaMQTT-" + String(ProcessInfo().processIdentifier), host: "mqtt-dashboard.com", port: 8883)
    var mqtt = CocoaMQTT5(clientID: "CocoaMQTT-" + String(ProcessInfo().processIdentifier), host: "3f4916e4c8eb4e8799278c6fe5e3aee2.s2.eu.hivemq.cloud", port: 8883)

    // Connect to MQTT broker
    func connect(username: String, password: String, delegate: CocoaMQTT5Delegate) {
//        mqtt.username = ""
//        mqtt.password = ""
        mqtt.username = username
        mqtt.password = password
        mqtt.delegate = delegate
        mqtt.cleanSession = true
        mqtt.keepAlive = 60
        mqtt.enableSSL = true
        mqtt.allowUntrustCACertificate = true
        let auth = MqttAuthProperties()  
        mqtt.auth(reasonCode: .continueAuthentication, authProperties: auth)
//        mqtt.autoReconnect = true
        mqtt.logLevel = .debug
        
//        let clientCertArray = getClientCertFromP12File(certName: "client-keycert", certPassword: "MySecretPassword")
//        var sslSettings: [String: NSObject] = [:]
//        sslSettings[kCFStreamSSLCertificates as String] = clientCertArray
//        mqtt.sslSettings = sslSettings

//        mqtt.sslSettings = [
//            GCDAsyncSocketManuallyEvaluateTrust: NSNumber(booleanLiteral: true),
//            GCDAsyncSocketUseCFStreamForTLS: NSNumber(booleanLiteral: false),
//            kCFStreamSSLPeerName as String: "" as NSString,
//            GCDAsyncSocketSSLProtocolVersionMin: NSNumber(integerLiteral: Int(SSLProtocol.tlsProtocol1.rawValue)),
//            GCDAsyncSocketSSLProtocolVersionMax: NSNumber(integerLiteral: Int(SSLProtocol.tlsProtocol12.rawValue)),
//        ]
        let asd = mqtt.connect()
        print(asd)
        mqtt.didReceiveTrust = { a, b, c in
            print("")
        }

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
    
    func getClientCertFromP12File(certName: String, certPassword: String) -> CFArray? {
           // get p12 file path
           let resourcePath = Bundle.main.path(forResource: certName, ofType: "p12")
           
           guard let filePath = resourcePath, let p12Data = NSData(contentsOfFile: filePath) else {
               print("Failed to open the certificate file: \(certName).p12")
               return nil
           }
           
           // create key dictionary for reading p12 file
           let key = kSecImportExportPassphrase as String
           let options : NSDictionary = [key: certPassword]
           
           var items : CFArray?
           let securityError = SecPKCS12Import(p12Data, options, &items)
           
           guard securityError == errSecSuccess else {
               if securityError == errSecAuthFailed {
                   print("ERROR: SecPKCS12Import returned errSecAuthFailed. Incorrect password?")
               } else {
                   print("Failed to open the certificate file: \(certName).p12")
               }
               return nil
           }
           
           guard let theArray = items, CFArrayGetCount(theArray) > 0 else {
               return nil
           }
           
           let dictionary = (theArray as NSArray).object(at: 0)
           guard let identity = (dictionary as AnyObject).value(forKey: kSecImportItemIdentity as String) else {
               return nil
           }
           let certArray = [identity] as CFArray
           
           return certArray
       }
}
