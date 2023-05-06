//
//  MainPageViewController.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 4/5/23.
//

import UIKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .gray
        //        navigationItem.hidesBackButton = true
        
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
//        connectBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(connectBtnPressed)))
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
}
