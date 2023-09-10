//
//  CustomScrollView.swift
//  FinalApp
//
//  Created by ln on 17.08.2023.
//

import UIKit

class CustomScrollView: UIScrollView {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
