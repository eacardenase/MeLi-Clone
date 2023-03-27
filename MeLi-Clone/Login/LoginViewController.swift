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

        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = .red
        
        print(navigationController!.navigationBar)
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        style()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStatusBar()
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

// MARK: - Actions
extension LoginViewController {
    @objc func backButtonTapped() {
        print("Back button tapped")
    }
}

