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
    let loginButton = UIButton(type: .custom)
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    override func viewDidLoad() {
        
        setStatusBar()
        setupBackButton()
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
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Ya tengo cuenta", for: [])
        loginButton.configuration = UIButton.Configuration.plain()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
        
    }
    
    private func layout() {
        
        view.backgroundColor = .white
        
        view.addSubview(closeButton)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(loginButton)
        
        view.addSubview(stackView)
        
        // closeButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setupBackButton() {
        let backButtonImage = UIImage(systemName: "arrow.backward")
        
        navigationController?.navigationBar.backIndicatorImage = backButtonImage
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}

// MARK: - Actions
extension OnboardingViewController {
    @objc func closeTapped() {
        delegate?.didFinishOnboarding()
    }
    
    @objc func loginButtonTapped() {
        let loginViewController = LoginViewController()
        
        loginViewController.setStatusBar()
        
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
