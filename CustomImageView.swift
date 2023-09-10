//
//  CustomImageView.swift
//  FinalApp
//
//  Created by ln on 12.08.2023.
//

import UIKit

class NamedImage: UIImageView {
    
    init(name: String) {
        super.init(frame: .zero)
        image = UIImage(named: name)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
