//
//  ViewController.swift
//  LightMeApp
//
//  Created by Dimitriadis, Dimitrios on 4/5/23.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
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
            deloitteLogoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            deloitteLogoImage.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        let mobileIconImage = UIImageView()
        mobileIconImage.image = UIImage(named: "mobileIcon")
        mobileIconImage.contentMode = .scaleAspectFit
        mobileIconImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mobileIconImage)
        NSLayoutConstraint.activate([
//            mobileIconImage.leadingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: 20),
            mobileIconImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mobileIconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
            usernameBackground.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            usernameBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            usernameBackground.heightAnchor.constraint(equalToConstant:100)
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
            usernameLabel.topAnchor.constraint(equalTo: usernameBackground.topAnchor, constant: 20),
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
            passwordBackground.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            passwordBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            passwordBackground.heightAnchor.constraint(equalToConstant: 100)
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
            passwordLabel.topAnchor.constraint(equalTo: passwordBackground.topAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordBackground.leadingAnchor, constant: 30)
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
            bottomBackground.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        let connectBtn = UIButton()
        connectBtn.backgroundColor = UIColor.init(rgb: 0x92bb45)
        connectBtn.setTitle("Connect".uppercased(), for: .normal)
        connectBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        connectBtn.translatesAutoresizingMaskIntoConstraints = false
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

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
