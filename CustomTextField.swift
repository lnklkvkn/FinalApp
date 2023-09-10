//
//  CustomTextField.swift
//  FinalApp
//
//  Created by ln on 12.08.2023.
//

import UIKit
import FlagPhoneNumber

class CustomTextField: UITextField {

    init(placeholder: String) {

        super.init(frame: .zero)
        layer.borderColor = CGColor.textFieldBorder
        layer.cornerRadius = 10
        layer.borderWidth = 1
        textAlignment = .center

        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )

        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PhoneNumberTextField: FPNTextField {
    
    init() {

        super.init(frame: .zero)
        layer.borderColor = CGColor.textFieldBorder
        layer.cornerRadius = 10
        layer.borderWidth = 1
        displayMode = .list
        setFlag(countryCode: .RU)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
