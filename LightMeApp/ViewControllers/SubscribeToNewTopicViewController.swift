//
//  SubscribeToNewTopicViewController.swift
//  LightMeApp
//
//  Created by Dimitrios Dimitriadis on 7/5/23.
//

import UIKit

class SubscribeToNewTopicViewController: UIViewController {

    var callback: ((Bool, Bool, Bool)->Void)?
    private let subscribeTextfield = UITextField()
    let publishTextfield = UITextField()
    var tempSubscribed = false
    var ledSubscribed = false
    var sendTextSubscribed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        // Create the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        view.addSubview(blurView)

        // Create the alert view
        let alertView = UIView()
        alertView.backgroundColor = .lightGray
        alertView.layer.cornerRadius = 10
        alertView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView)
        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            alertView.heightAnchor.constraint(equalToConstant: 250)
        ])

        let tempTopicLabel = UILabel()
        tempTopicLabel.text = "Publish Topic"
        tempTopicLabel.font = UIFont.systemFont(ofSize: 20)
        tempTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(tempTopicLabel)
        NSLayoutConstraint.activate([
            tempTopicLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20),
            tempTopicLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            tempTopicLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -80),
            tempTopicLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        let tempSwitch = UISwitch()
        tempSwitch.translatesAutoresizingMaskIntoConstraints = false
        tempSwitch.isOn = tempSubscribed
        tempSwitch.addTarget(self, action: #selector(tempSwitchChanged), for: .valueChanged)
        alertView.addSubview(tempSwitch)
        NSLayoutConstraint.activate([
            tempSwitch.leadingAnchor.constraint(equalTo: tempTopicLabel.trailingAnchor),
            tempSwitch.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            tempSwitch.topAnchor.constraint(equalTo: tempTopicLabel.topAnchor),
            tempSwitch.bottomAnchor.constraint(equalTo: tempTopicLabel.bottomAnchor),
        ])
        
        let ledTopicLabel = UILabel()
        ledTopicLabel.text = "LED Topic"
        ledTopicLabel.font = UIFont.systemFont(ofSize: 20)
        ledTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(ledTopicLabel)
        NSLayoutConstraint.activate([
            ledTopicLabel.topAnchor.constraint(equalTo: tempTopicLabel.bottomAnchor, constant: 20),
            ledTopicLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            ledTopicLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -80),
            ledTopicLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        let ledSwitch = UISwitch()
        ledSwitch.isOn = ledSubscribed
        ledSwitch.addTarget(self, action: #selector(ledSwitchChanged), for: .valueChanged)
        ledSwitch.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(ledSwitch)
        NSLayoutConstraint.activate([
            ledSwitch.leadingAnchor.constraint(equalTo: ledTopicLabel.trailingAnchor),
            ledSwitch.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            ledSwitch.topAnchor.constraint(equalTo: ledTopicLabel.topAnchor),
            ledSwitch.bottomAnchor.constraint(equalTo: ledTopicLabel.bottomAnchor),
        ])
        
        let sendTextTopicLabel = UILabel()
        sendTextTopicLabel.text = "Send Text Topic"
        sendTextTopicLabel.font = UIFont.systemFont(ofSize: 20)
        sendTextTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(sendTextTopicLabel)
        NSLayoutConstraint.activate([
            sendTextTopicLabel.topAnchor.constraint(equalTo: ledSwitch.bottomAnchor, constant: 20),
            sendTextTopicLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            sendTextTopicLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -80),
            sendTextTopicLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        let sendTextSwitch = UISwitch()
        sendTextSwitch.isOn = sendTextSubscribed
        sendTextSwitch.addTarget(self, action: #selector(sendTextSwitchChanged), for: .valueChanged)
        sendTextSwitch.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(sendTextSwitch)
        NSLayoutConstraint.activate([
            sendTextSwitch.leadingAnchor.constraint(equalTo: sendTextTopicLabel.trailingAnchor),
            sendTextSwitch.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            sendTextSwitch.topAnchor.constraint(equalTo: sendTextTopicLabel.topAnchor),
            sendTextSwitch.bottomAnchor.constraint(equalTo: sendTextTopicLabel.bottomAnchor),
        ])

        let button = UIButton(type: .system)
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = greenColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(okPressed)))
        alertView.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -20),
            button.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

    @objc func okPressed() {
        callback?(tempSubscribed, ledSubscribed, sendTextSubscribed)
        dismiss(animated: true)
    }
    
    @objc func tempSwitchChanged(_ sender: UISwitch) {
        tempSubscribed = sender.isOn
    }
    
    @objc func ledSwitchChanged(_ sender: UISwitch) {
        ledSubscribed = sender.isOn
    }
    
    @objc func sendTextSwitchChanged(_ sender: UISwitch) {
        sendTextSubscribed = sender.isOn
    }
}
