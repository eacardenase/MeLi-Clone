//
//  MainViewController.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/6/23.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTabBar()
    }
}

extension MainViewController {
    private func setupViews() {
        let firstVC = ViewController1()
        let secondVC = ViewController2()
        let thirdVC = ViewController3()
        let fourthVC = ViewController4()
        let fifthVC = ViewController5()
        
        firstVC.setTabBarImage(imageName: "house", title: "Inicio")
        secondVC.setTabBarImage(imageName: "heart", title: "Favoritos")
        thirdVC.setTabBarImage(imageName: "bag", title: "Mis Compras")
        fourthVC.setTabBarImage(imageName: "bell", title: "Notificaciones")
        fifthVC.setTabBarImage(imageName: "line.horizontal.3", title: "Mas")
        
        let firstNC = UINavigationController(rootViewController: firstVC)
        let secondNC = UINavigationController(rootViewController: secondVC)
        let thirdNC = UINavigationController(rootViewController: thirdVC)
        let fourthNC = UINavigationController(rootViewController: fourthVC)
        let fifthNC = UINavigationController(rootViewController: fifthVC)
        
        firstNC.navigationBar.barTintColor = .systemCyan
        
        let tabBarList = [firstNC, secondNC, thirdNC, fourthNC, fifthNC]
        
        viewControllers = tabBarList
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .systemBlue
        tabBar.isTranslucent = false
    }
}

class ViewController1: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemCyan
    }
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class ViewController3: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemRed
    }
}

class ViewController4: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class ViewController5: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemYellow
    }
}
