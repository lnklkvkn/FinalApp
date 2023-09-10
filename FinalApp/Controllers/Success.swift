//
//  Success.swift
//  FinalApp
//
//  Created by ln on 20.08.2023.
//

import UIKit
import FirebaseAuth

class SuccessVC: UIViewController {
    
    var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Log out", for: .normal)
        button.backgroundColor = .buttonColor
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapButton() {
        do {
            try
            Auth.auth().signOut()
            self.dismiss(animated: true)
//            self.navigationController?.popToRootViewController(animated: true)
        } catch {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(button)
    }
}


