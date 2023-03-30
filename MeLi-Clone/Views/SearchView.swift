//
//  SearchView.swift
//  MeLi-Clone
//
//  Created by Edwin Cardenas on 3/30/23.
//

import UIKit

class SearchView: UIStackView {
    
    private let searchImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        return imageView
    }()
    private let textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Buscar en Mercado Libre"
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 20)
    }
}

extension SearchView {
    private func configureUI() {
        
        backgroundColor = .white
        
        [searchImageView, textField].forEach { view in
            addArrangedSubview(view)
        }

        spacing = 16
        
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        clipsToBounds = true
        layer.cornerRadius = 18
        
        // CHCR
        searchImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
}
