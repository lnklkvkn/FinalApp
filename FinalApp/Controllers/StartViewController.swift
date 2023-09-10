//
//  ViewController.swift
//  FinalApp
//
//  Created by ln on 02.08.2023.
//

import UIKit

class StartViewController: UIViewController {
            
    private lazy var logoImageView = NamedImage(name: "logo")
    
    private lazy var signUpButton = ColorButton(title: "ЗАРЕГИСТРИРОВАТЬСЯ",
                                                color: .buttonColor,
                                                completion: { self.navigationController?.pushViewController(SignupViewController(), animated: true)
    })
    
    private lazy var logInButton = ClearButton(title: "Уже есть аккаунт",
                                               completion: {  self.navigationController?.pushViewController(LoginViewController(), animated: true)}
    )
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        
        view.backgroundColor = .systemBackground
        customBackButton()
        view.addSubview(logoImageView)
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.147),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: view.frame.height * 0.095),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.67),
            signUpButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0557),
            
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: view.frame.height * 0.0355),
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            logInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            ])
    }
    
    private func customBackButton() {
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrow")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .buttonColor
    }
}


