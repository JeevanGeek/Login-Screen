//
//  ViewController.swift
//  Login Screen
//
//  Created by Jeevan Chandra Joshi on 02/01/23.
//

import UIKit

class ViewController: UIViewController {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50.0),

            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 32.0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50.0),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32.0),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            loginButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }

    @objc func login() {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if username == "Test" && password == "test123" {
                let nextVC = NextViewController()
                navigationController?.pushViewController(nextVC, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Invalid email or password.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
        }
    }
}
