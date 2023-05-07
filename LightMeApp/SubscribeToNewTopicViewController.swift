//
//  SubscribeToNewTopicViewController.swift
//  LightMeApp
//
//  Created by Dimitrios Dimitriadis on 7/5/23.
//

import UIKit

class SubscribeToNewTopicViewController: UIViewController {

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
            alertView.heightAnchor.constraint(equalToConstant: 270)
        ])

        let subscribeLabel = UILabel()
        subscribeLabel.text = "Subscribe Topic"
        subscribeLabel.font = UIFont.systemFont(ofSize: 20)
        subscribeLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(subscribeLabel)
        NSLayoutConstraint.activate([
            subscribeLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20),
            subscribeLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            subscribeLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            subscribeLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        let subscribeTextfield = UITextField()
        subscribeTextfield.backgroundColor = .white
        subscribeTextfield.translatesAutoresizingMaskIntoConstraints = false
        subscribeTextfield.layer.cornerRadius = 5
        view.addSubview(subscribeTextfield)
        NSLayoutConstraint.activate([
            subscribeTextfield.heightAnchor.constraint(equalToConstant: 30),
            subscribeTextfield.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            subscribeTextfield.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            subscribeTextfield.topAnchor.constraint(equalTo: subscribeLabel.bottomAnchor, constant: 10)
        ])

        let publishLabel = UILabel()
        publishLabel.text = "Publish Topic"
        publishLabel.font = UIFont.systemFont(ofSize: 20)
        publishLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(publishLabel)
        NSLayoutConstraint.activate([
            publishLabel.topAnchor.constraint(equalTo: subscribeTextfield.bottomAnchor, constant: 20),
            publishLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            publishLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            publishLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        let publishTextfield = UITextField()
        publishTextfield.backgroundColor = .white
        publishTextfield.translatesAutoresizingMaskIntoConstraints = false
        publishTextfield.layer.cornerRadius = 5
        view.addSubview(publishTextfield)
        NSLayoutConstraint.activate([
            publishTextfield.heightAnchor.constraint(equalToConstant: 30),
            publishTextfield.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            publishTextfield.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            publishTextfield.topAnchor.constraint(equalTo: publishLabel.bottomAnchor, constant: 10)
        ])

        let button = UIButton(type: .system)
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.init(rgb: 0x92bb45)
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
        dismiss(animated: true)
    }
}
