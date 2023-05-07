//
//  ViewController.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 4/5/23.
//

import UIKit
import CocoaMQTT

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        MqttManager.shared.connect(username: "dimitris", password: "20Abstergo12", delegate: self)
        MqttManager.shared.subscribe(to: "testtopic2/3")
        MqttManager.shared.publish(to: "testtopic2/3", with: "your-message")

    }
    
    private func setup() {
        view.backgroundColor = .gray
        
        let topBackground = UIImageView()
        topBackground.image = UIImage(named: "topBackground")
        topBackground.contentMode = .scaleAspectFill
        topBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topBackground)
        NSLayoutConstraint.activate([
            topBackground.topAnchor.constraint(equalTo: view.topAnchor),
            topBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBackground.heightAnchor.constraint(equalToConstant: 150)
        ])

        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome!".uppercased()
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 50),
            welcomeLabel.centerYAnchor.constraint(equalTo: topBackground.centerYAnchor),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
                
        let deloitteLogoImage = UIImageView()
        deloitteLogoImage.image = UIImage(named: "deloitteLogo")
        deloitteLogoImage.contentMode = .scaleAspectFit
        deloitteLogoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deloitteLogoImage)
        NSLayoutConstraint.activate([
            deloitteLogoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            deloitteLogoImage.trailingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor, constant: -15),
            deloitteLogoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            deloitteLogoImage.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        let mobileIconImage = UIImageView()
        mobileIconImage.image = UIImage(named: "mobileIcon")
        mobileIconImage.contentMode = .scaleAspectFit
        mobileIconImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mobileIconImage)
        NSLayoutConstraint.activate([
            mobileIconImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mobileIconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mobileIconImage.bottomAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            mobileIconImage.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        let usernameBackground = UIImageView()
        usernameBackground.image = UIImage(named: "attributesBackground")
        usernameBackground.contentMode = .scaleToFill
        usernameBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameBackground)
        NSLayoutConstraint.activate([
            usernameBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usernameBackground.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            usernameBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            usernameBackground.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        let usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.textColor = .white
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textAlignment = .center
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
            usernameLabel.topAnchor.constraint(equalTo: usernameBackground.topAnchor, constant: 30),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        let usernameTextfield = UITextField()
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.backgroundColor = .white
        usernameTextfield.layer.cornerRadius = 5
        view.addSubview(usernameTextfield)
        NSLayoutConstraint.activate([
            usernameTextfield.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            usernameTextfield.trailingAnchor.constraint(equalTo: usernameBackground.trailingAnchor, constant: -40),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 30),
            usernameTextfield.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10)
        ])
        
        let passwordBackground = UIImageView()
        passwordBackground.image = UIImage(named: "attributesBackground")
        passwordBackground.contentMode = .scaleToFill
        passwordBackground.transform = passwordBackground.transform.rotated(by: .pi)
        passwordBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordBackground)
        NSLayoutConstraint.activate([
            passwordBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            passwordBackground.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            passwordBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            passwordBackground.heightAnchor.constraint(equalToConstant: 130)
        ])

        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.textAlignment = .center
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),
            passwordLabel.topAnchor.constraint(equalTo: passwordBackground.topAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordBackground.leadingAnchor, constant: 40)
        ])
        
        let passwordTextfield = UITextField()
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.backgroundColor = .white
        passwordTextfield.layer.cornerRadius = 5
        view.addSubview(passwordTextfield)
        NSLayoutConstraint.activate([
            passwordTextfield.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 30),
            passwordTextfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10)
        ])
        
        let bottomBackground = UIImageView()
        bottomBackground.transform = bottomBackground.transform.rotated(by: .pi)
        bottomBackground.image = UIImage(named: "topBackground")
        bottomBackground.contentMode = .scaleAspectFill
        bottomBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBackground)
        NSLayoutConstraint.activate([
            bottomBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBackground.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        let connectBtn = UIButton()
        connectBtn.backgroundColor = UIColor.init(rgb: 0x92bb45)
        connectBtn.setTitle("Connect".uppercased(), for: .normal)
        connectBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        connectBtn.translatesAutoresizingMaskIntoConstraints = false
        connectBtn.layer.cornerRadius = 5
        connectBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(connectBtnPressed)))
        view.addSubview(connectBtn)
        NSLayoutConstraint.activate([
            connectBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            connectBtn.heightAnchor.constraint(equalToConstant: 40),
            connectBtn.widthAnchor.constraint(equalToConstant: 100),
            connectBtn.topAnchor.constraint(equalTo: bottomBackground.topAnchor, constant: -60)
        ])
        
        let lightMeAppLabel = UILabel()
        lightMeAppLabel.text = "LIGHT ME APP"
        lightMeAppLabel.textColor = .white
        lightMeAppLabel.font = UIFont.systemFont(ofSize: 24)
        lightMeAppLabel.textAlignment = .center
        lightMeAppLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lightMeAppLabel)
        NSLayoutConstraint.activate([
            lightMeAppLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            lightMeAppLabel.heightAnchor.constraint(equalToConstant: 40),
            lightMeAppLabel.centerYAnchor.constraint(equalTo: bottomBackground.centerYAnchor),
            lightMeAppLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func connectBtnPressed(_ sender: UIView) {
        let vc = MainPageViewController()
        vc.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LogInViewController: CocoaMQTT5Delegate {
    func mqtt5(_ mqtt5: CocoaMQTT5, didConnectAck ack: CocoaMQTTCONNACKReasonCode, connAckData: MqttDecodeConnAck?) {
        print("ASD - 1")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishMessage message: CocoaMQTT5Message, id: UInt16) {
        print("ASD - 2")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishAck id: UInt16, pubAckData: MqttDecodePubAck?) {
        print("ASD - 3")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishRec id: UInt16, pubRecData: MqttDecodePubRec?) {
        print("ASD - 4")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveMessage message: CocoaMQTT5Message, id: UInt16, publishData: MqttDecodePublish?) {
        print("ASD - 5")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didSubscribeTopics success: NSDictionary, failed: [String], subAckData: MqttDecodeSubAck?) {
        print("ASD - 6")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didUnsubscribeTopics topics: [String], UnsubAckData: MqttDecodeUnsubAck?) {
        print("ASD - 7")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveDisconnectReasonCode reasonCode: CocoaMQTTDISCONNECTReasonCode) {
        print("ASD - 8")
    }

    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveAuthReasonCode reasonCode: CocoaMQTTAUTHReasonCode) {
        print("ASD - 9")
    }

    func mqtt5DidPing(_ mqtt5: CocoaMQTT5) {
        print("ASD - 10")
    }

    func mqtt5DidReceivePong(_ mqtt5: CocoaMQTT5) {
        print("ASD - 11")
    }

    func mqtt5DidDisconnect(_ mqtt5: CocoaMQTT5, withError err: Error?) {
        print("ASD - 12")
    }

//    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
//        print("ASD - 1")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
//        print("ASD - 2")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
//        print("ASD - 3")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
//        print("ASD - 4")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
//        print("ASD - 5")
//    }
//
//    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
//        print("ASD - 6")
//    }
//
//    func mqttDidPing(_ mqtt: CocoaMQTT) {
//        print("ASD - 7")
//    }
//
//    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
//        print("ASD - 8")
//    }
//
//    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
//        print("ASD - 9")
//    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF)
   }
}
