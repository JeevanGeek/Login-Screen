//
//  ViewController.swift
//  Login Screen
//
//  Created by Jeevan Chandra Joshi on 02/01/23.
//

import UIKit

class NextViewController: UIViewController {
    var user: User = User(
        username: "John Doe",
        profileImage: UIImage(named: "profile_image")!,
        email: "john.doe@example.com",
        address: "123 Main Street, New York, NY 10001"
    )

    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username: \(user.username)"
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var profileImage: UIImageView = {
        let image = UIImageView(image: user.profileImage)
        image.layer.cornerRadius = 50.0
        image.layer.masksToBounds = true
        image.image = user.profileImage
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email: \(user.email)"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Addess: \(user.address)"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(usernameLabel)
        view.addSubview(profileImage)
        view.addSubview(emailLabel)
        view.addSubview(addressLabel)
        view.addSubview(logoutButton)

        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            profileImage.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 32.0),
            profileImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            profileImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            profileImage.heightAnchor.constraint(equalToConstant: 250.0),

            emailLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 32.0),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            emailLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            emailLabel.heightAnchor.constraint(equalToConstant: 50.0),

            addressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 32.0),
            addressLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            addressLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            addressLabel.heightAnchor.constraint(equalToConstant: 50.0),

            logoutButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 32.0),
            logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32.0),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            logoutButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }

    @objc func logout() {
        navigationController?.popViewController(animated: true)
    }
}

struct User {
    let username: String
    let profileImage: UIImage
    let email: String
    let address: String
}
