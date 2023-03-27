//
//  AppDelegate.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/6/23.
//

import UIKit

let appColor: UIColor = .yellow

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let mainViewController = MainViewController()
    let onboardingViewController = OnboardingViewController()
    var onboardingNavigationController: OnboardingNavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        onboardingViewController.delegate = self
        onboardingNavigationController = OnboardingNavigationController(rootViewController: onboardingViewController)
        
        displayNextScreen()
        
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
    
//    private func displayLogin() {
//        setRootViewController(onboardingNavigationController)
//    }
    
    private func prepView(_ controller: UIViewController) {
        controller.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
    
    private func displayNextScreen() {
        
        if LocalState.hasOnboarded {
            prepView(mainViewController)
            
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingNavigationController)
        }
    }
}

// MARK: - OnboardingViewControllerDelegate
extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        
        prepView(mainViewController)
        setRootViewController(mainViewController)
    }
}
