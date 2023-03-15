//
//  OnboardingViewController.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/6/23.
//

import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnboardingViewController: UIViewController {
    
    let closeButton = UIButton(type: .custom)
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let signInButton = UIButton(type: .custom)
    let loginButtin = UIButton(type: .custom)
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
}

extension OnboardingViewController {
    private func style() {
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Cerrar", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        closeButton.configuration = UIButton.Configuration.plain()
        closeButton.tintColor = .secondaryLabel
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = NSAttributedString(string: "¿Qué estás esperando?", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel
        ])
//        titleLabel.text = "¿Qué estás esperando?"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.attributedText = NSAttributedString(string: "¡Es gratis!", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.tertiaryLabel
        ])
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Registrarme", for: [])
        signInButton.configuration = UIButton.Configuration.filled()
        
        loginButtin.translatesAutoresizingMaskIntoConstraints = false
        loginButtin.setTitle("Ya tengo cuenta", for: [])
        loginButtin.configuration = UIButton.Configuration.plain()
        
    }
    
    private func layout() {
        view.addSubview(closeButton)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(loginButtin)
        
        view.addSubview(stackView)
        
        // closeButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Actions
extension OnboardingViewController {
    @objc func closeTapped() {
        delegate?.didFinishOnboarding()
    }
}
