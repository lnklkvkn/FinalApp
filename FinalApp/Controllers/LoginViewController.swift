//
//  LoginViewController.swift
//  FinalApp
//
//  Created by ln on 12.08.2023.
//

import UIKit
import FlagPhoneNumber

class LoginViewController: UIViewController {
    
    private var phoneNumber: String?
    
    private var listController: FPNCountryListViewController!
    
    private lazy var scrollView = CustomScrollView()
    
    private lazy var welcomeLabel = SemiboldLabel(
                                    text: "С возвращением!",
                                    textColor: .orangeAppColor)

    private lazy var phoneNamberLabel = RegularLabel(
                                        text: "Введите номер телефона для входа в приложение",
                                        textColor: .mediumTextColor)
    
    private lazy var phoneNumberTextField = PhoneNumberTextField()
    
    private lazy var confirmButton = ColorButton(title: "ПОДТВЕРДИТЬ",
                                                 color: .buttonColor,
                                                 completion: { self.navigationController?.pushViewController(SmsVerificationViewController(), animated: true)})

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConfiguration()
    }
    
    func setupConfiguration() {
        
        confirmButton.alpha = 0.5
        confirmButton.isEnabled = false
        
        phoneNumberTextField.delegate = self
        listController = FPNCountryListViewController(style: .grouped)
        listController?.setup(repository: phoneNumberTextField.countryRepository)
        listController.didSelect = { country in
            self.phoneNumberTextField.setFlag(countryCode: country.code)
        }
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(welcomeLabel)
        scrollView.addSubview(phoneNamberLabel)
        scrollView.addSubview(phoneNumberTextField)
        scrollView.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.276),
            welcomeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.416),
            welcomeLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.027),
            
            phoneNamberLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: view.frame.height * 0.032),
            phoneNamberLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            phoneNamberLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.48),
            phoneNamberLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: phoneNamberLabel.bottomAnchor, constant: view.frame.height * 0.015),
            phoneNumberTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            phoneNumberTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.693),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            
            confirmButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: view.frame.height * 0.182),
            confirmButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5),
            confirmButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.058)
        ])
    }
}

extension LoginViewController: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {}
    
    func fpnDidValidatePhoneNumber(textField: FlagPhoneNumber.FPNTextField, isValid: Bool) {
        
        if isValid {
            confirmButton.alpha = 1
            confirmButton.isEnabled = true
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            confirmButton.alpha = 0.5
            confirmButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        listController.title = "Страны"
        phoneNumberTextField.text = ""
        self.present(navigationController, animated: true)
    }
    
}
