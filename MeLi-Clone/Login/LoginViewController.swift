//
//  LoginViewController.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/15/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let label = UILabel()
    let textField = UITextField()
    let continueButton = UIButton()
    
    override func viewDidLoad() {
        
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Ingresa tu teléfono, \ne-mail o usuario"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "   Teléfono, e-mail o usuario"
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.cornerRadius = 8
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continuar", for: .normal)
        continueButton.configuration = .filled()
//        continueButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    func layout() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(continueButton)
        
        // label
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 2)
        ])
        
        // textField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 7),
            textField.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // continueButton
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 10),
            continueButton.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func backButtonTapped() {
        print("TEST")
    }
}

