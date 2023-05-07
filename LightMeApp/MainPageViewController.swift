//
//  MainPageViewController.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 4/5/23.
//

import UIKit

class MainPageViewController: UIViewController {

    private let temperatureLabel = UILabel()
    private let humidityLabel = UILabel()
    private let ledSwitch = UISwitch()
    private let sendTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .gray
        navigationItem.hidesBackButton = true
        
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
                
        let deloitteLogoImage = UIImageView()
        deloitteLogoImage.image = UIImage(named: "deloitteLogo")
        deloitteLogoImage.contentMode = .scaleAspectFit
        deloitteLogoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deloitteLogoImage)
        NSLayoutConstraint.activate([
            deloitteLogoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            deloitteLogoImage.widthAnchor.constraint(equalToConstant: 80),
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
            mobileIconImage.heightAnchor.constraint(equalToConstant: 50),
            mobileIconImage.widthAnchor.constraint(equalToConstant: 60)
        ])

        //MARK: Temperature - Humidity
        let tempHumBackground = UIImageView()
        tempHumBackground.image = UIImage(named: "attributesBackgroundBig")
        tempHumBackground.contentMode = .scaleToFill
        tempHumBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tempHumBackground)
        NSLayoutConstraint.activate([
            tempHumBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tempHumBackground.topAnchor.constraint(equalTo: topBackground.bottomAnchor, constant: 30),
            tempHumBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            tempHumBackground.heightAnchor.constraint(equalToConstant: 170)
        ])

        let humidityIcon = UIImageView()
        humidityIcon.translatesAutoresizingMaskIntoConstraints = false
        humidityIcon.image = UIImage(named: "icon_droplet")
        view.addSubview(humidityIcon)
        NSLayoutConstraint.activate([
            humidityIcon.bottomAnchor.constraint(equalTo: tempHumBackground.centerYAnchor, constant: -10),
            humidityIcon.leadingAnchor.constraint(equalTo: tempHumBackground.leadingAnchor, constant: 10),
            humidityIcon.widthAnchor.constraint(equalToConstant: 50),
            humidityIcon.heightAnchor.constraint(equalToConstant: 50)
        ])

        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.text = "32 %"
        humidityLabel.font = UIFont.systemFont(ofSize: 30)
        humidityLabel.textColor = .white
        view.addSubview(humidityLabel)
        NSLayoutConstraint.activate([
            humidityLabel.leadingAnchor.constraint(equalTo: humidityIcon.trailingAnchor, constant: 20),
            humidityLabel.topAnchor.constraint(equalTo: humidityIcon.topAnchor),
            humidityLabel.bottomAnchor.constraint(equalTo: humidityIcon.bottomAnchor),
            humidityLabel.trailingAnchor.constraint(equalTo: tempHumBackground.trailingAnchor, constant: -20)
        ])

        let temperatureIcon = UIImageView()
        temperatureIcon.translatesAutoresizingMaskIntoConstraints = false
        temperatureIcon.image = UIImage(named: "icon_temperature")
        view.addSubview(temperatureIcon)
        NSLayoutConstraint.activate([
            temperatureIcon.topAnchor.constraint(equalTo: tempHumBackground.centerYAnchor, constant: 10),
            temperatureIcon.leadingAnchor.constraint(equalTo: tempHumBackground.leadingAnchor, constant: 10),
            temperatureIcon.widthAnchor.constraint(equalToConstant: 50),
            temperatureIcon.heightAnchor.constraint(equalToConstant: 50)
        ])

        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.text = "23 °C"
        temperatureLabel.font = UIFont.systemFont(ofSize: 30)
        temperatureLabel.textColor = .white
        view.addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: temperatureIcon.trailingAnchor, constant: 20),
            temperatureLabel.topAnchor.constraint(equalTo: temperatureIcon.topAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: temperatureIcon.bottomAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: tempHumBackground.trailingAnchor, constant: -20)
        ])

        //MARK: Button to add topic
        let addBtnBackground = UIView()
        addBtnBackground.backgroundColor = UIColor.init(rgb: 0x92bb45)
        addBtnBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addBtnBackground)
        NSLayoutConstraint.activate([
            addBtnBackground.heightAnchor.constraint(equalToConstant: 80),
            addBtnBackground.widthAnchor.constraint(equalToConstant: 80),
            addBtnBackground.topAnchor.constraint(equalTo: topBackground.bottomAnchor, constant: -10),
            addBtnBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        addBtnBackground.layer.cornerRadius = 40
        addBtnBackground.clipsToBounds = true

        let addBtn = UILabel()
        addBtn.text = "+"
        addBtn.font = .systemFont(ofSize: 50)
        addBtn.textColor = .white
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.textAlignment = .center
        addBtn.isUserInteractionEnabled = true
        addBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(subscribeToNewTopicBtnPressed)))
        view.addSubview(addBtn)
        NSLayoutConstraint.activate([
            addBtn.centerXAnchor.constraint(equalTo: addBtnBackground.centerXAnchor),
            addBtn.centerYAnchor.constraint(equalTo: addBtnBackground.centerYAnchor),
            addBtn.widthAnchor.constraint(equalToConstant: 80),
            addBtn.heightAnchor.constraint(equalToConstant: 80)
        ])

        //MARK: LED
        let ledBackground = UIImageView()
        ledBackground.image = UIImage(named: "attributesBackgroundBig")
        ledBackground.contentMode = .scaleToFill
        ledBackground.transform = ledBackground.transform.rotated(by: .pi)
        ledBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ledBackground)
        NSLayoutConstraint.activate([
            ledBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ledBackground.topAnchor.constraint(equalTo: tempHumBackground.bottomAnchor, constant: 30),
            ledBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            ledBackground.heightAnchor.constraint(equalToConstant: 170)
        ])

        let ledIcon = UIImageView()
        ledIcon.translatesAutoresizingMaskIntoConstraints = false
        ledIcon.image = UIImage(named: "icon_light")
        view.addSubview(ledIcon)
        NSLayoutConstraint.activate([
            ledIcon.centerYAnchor.constraint(equalTo: ledBackground.centerYAnchor),
            ledIcon.leadingAnchor.constraint(equalTo: ledBackground.leadingAnchor, constant: 50),
            ledIcon.widthAnchor.constraint(equalToConstant: 60),
            ledIcon.heightAnchor.constraint(equalToConstant: 60)
        ])

        ledSwitch.translatesAutoresizingMaskIntoConstraints = false
        ledSwitch.transform = CGAffineTransformMakeScale(1.3, 1.3)
        view.addSubview(ledSwitch)
        NSLayoutConstraint.activate([
            ledSwitch.centerYAnchor.constraint(equalTo: ledBackground.centerYAnchor),
            ledSwitch.widthAnchor.constraint(equalToConstant: 60),
            ledSwitch.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            ledSwitch.leadingAnchor.constraint(equalTo: ledIcon.trailingAnchor, constant: 40)
        ])

        //MARK: Send text
        let sendTextBackground = UIImageView()
        sendTextBackground.image = UIImage(named: "attributesBackgroundBig")
        sendTextBackground.contentMode = .scaleToFill
        sendTextBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendTextBackground)
        NSLayoutConstraint.activate([
            sendTextBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sendTextBackground.topAnchor.constraint(equalTo: ledBackground.bottomAnchor, constant: 30),
            sendTextBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            sendTextBackground.heightAnchor.constraint(equalToConstant: 170)
        ])

        let sendTextIcon = UIImageView()
        sendTextIcon.translatesAutoresizingMaskIntoConstraints = false
        sendTextIcon.image = UIImage(named: "icon_broadcast")
        view.addSubview(sendTextIcon)
        NSLayoutConstraint.activate([
            sendTextIcon.centerYAnchor.constraint(equalTo: sendTextBackground.centerYAnchor),
            sendTextIcon.leadingAnchor.constraint(equalTo: sendTextBackground.leadingAnchor, constant: 10),
            sendTextIcon.widthAnchor.constraint(equalToConstant: 60),
            sendTextIcon.heightAnchor.constraint(equalToConstant: 60)
        ])

        sendTextField.translatesAutoresizingMaskIntoConstraints = false
        sendTextField.backgroundColor = .white
        sendTextField.text = "2"
        sendTextField.textAlignment = .center
        view.addSubview(sendTextField)
        NSLayoutConstraint.activate([
            sendTextField.leadingAnchor.constraint(equalTo: sendTextIcon.trailingAnchor, constant: 10),
            sendTextField.centerYAnchor.constraint(equalTo: sendTextBackground.centerYAnchor),
            sendTextField.heightAnchor.constraint(equalToConstant: 40),
            sendTextField.widthAnchor.constraint(equalToConstant: 50)
        ])

        let sendBtn = UIButton()
        sendBtn.backgroundColor = UIColor.init(rgb: 0x92bb45)
        sendBtn.setTitle("Send".uppercased(), for: .normal)
        sendBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.layer.cornerRadius = 5
        sendBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(sendTextBtnPressed)))
        view.addSubview(sendBtn)
        NSLayoutConstraint.activate([
            sendBtn.leadingAnchor.constraint(equalTo: sendTextField.trailingAnchor, constant: 10),
            sendBtn.heightAnchor.constraint(equalToConstant: 40),
            sendBtn.widthAnchor.constraint(equalToConstant: 80),
            sendBtn.centerYAnchor.constraint(equalTo: sendTextBackground.centerYAnchor)
        ])
    }

    @objc func sendTextBtnPressed() {
        print("Add process ")
    }

    @objc func subscribeToNewTopicBtnPressed() {
        let vc = SubscribeToNewTopicViewController()
        vc.callback = { subscribeText, publishText in
            //FIXME: Add the process to subscribe / publish in topic
        }
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}
