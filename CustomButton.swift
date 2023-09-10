//
//  CustomButton.swift
//  FinalApp
//
//  Created by ln on 12.08.2023.
//

import UIKit

class ColorButton: UIButton {

    let completion: () -> Void
    
    init(title: String, color: UIColor, completion: @escaping () -> Void) {
        
        self.completion = completion
        super.init(frame: .zero)
        setTitleColor(UIColor.white, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = 10
        backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton() {
        completion()
    }
}

class ClearButton: UIButton {

    let completion: () -> Void
    
    init(title: String, completion: @escaping () -> Void) {
        
        self.completion = completion
        super.init(frame: .zero)
        setTitleColor(.textColor, for: .normal)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton() {
        completion()
    }
}
