//
//  HomeViewController.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/30/23.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureUI()
    }
}

extension HomeViewController {
    private func configureUI() {
        view.backgroundColor = .lightGray
    }
    
    private func configureNavBar() {
        
        let rightImage = UIImage(systemName: "cart")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(handleCartTapped))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: SearchView())
    }
}

// MARK: - Actions

extension HomeViewController {
    @objc private func handleCartTapped(_ sender: UIButton) {
        print("DEBUG: Cart button tapped")
    }
}
