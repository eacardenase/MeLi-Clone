//
//  LoginViewController.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/15/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        view.backgroundColor = .white
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}
