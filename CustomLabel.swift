//
//  CustomLabel.swift
//  FinalApp
//
//  Created by ln on 12.08.2023.
//

import UIKit

class RegularLabel: UILabel {
    
    init(text: String, textColor: UIColor) {
        
        super.init(frame: .zero)
        numberOfLines = 0
        self.text = text
        textAlignment = .center
        baselineAdjustment = .alignCenters
        minimumScaleFactor = 0.1
        adjustsFontSizeToFitWidth = true
        self.textColor = textColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SemiboldLabel : UILabel {
    
    init(text: String, textColor: UIColor) {
        
        super.init(frame: .zero)
        numberOfLines = 0
        font = .systemFont(ofSize: 60, weight: .semibold)
        self.text = text
        textAlignment = .center
        baselineAdjustment = .alignCenters
        minimumScaleFactor = 0.1
        adjustsFontSizeToFitWidth = true
        self.textColor = textColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
