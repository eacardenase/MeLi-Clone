//
//  LoginView.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/15/23.
//

import UIKit

class LoginView: UIView {
    
    let label = UILabel()
    let textField = UITextField()
    let continueButton = UIButton()
    let helpButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 200)
    }
}

extension LoginView {
    func style() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Ingresa tu teléfono, \ne-mail o usuario"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Teléfono, e-mail o usuario"
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.cornerRadius = 7
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continuar", for: .normal)
        continueButton.configuration = .filled()
//        continueButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.setTitle("Necesito ayuda para ingresar", for: .normal)
        helpButton.configuration = .plain()
    }
    
    func layout() {
        addSubview(label)
        addSubview(textField)
        addSubview(continueButton)
        addSubview(helpButton)
        
        // label
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
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
        
        // helpButton
        NSLayoutConstraint.activate([
//            helpButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 8),
            helpButton.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            helpButton.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            helpButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
