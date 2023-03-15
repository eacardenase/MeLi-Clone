//
//  AppDelegate.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/6/23.
//

import UIKit

let appColor: UIColor = .systemBlue

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let mainViewController = MainViewController()
    let onboardingViewController = OnboardingViewController()
    var onboardingNavigationController: OnboardingNavigationController! = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        onboardingViewController.delegate = self
        onboardingNavigationController = OnboardingNavigationController(rootViewController: onboardingViewController)
        
        displayLogin()
        
        return true
    }

}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil
        )
    }
    
    private func displayLogin() {
        setRootViewController(onboardingNavigationController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
}

// MARK: - OnboardingViewControllerDelegate
extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        
        setRootViewController(mainViewController)
    }
}
