//
//  SignupViewController.swift
//  FinalApp
//
//  Created by ln on 11.08.2023.
//

import UIKit
import FlagPhoneNumber
import FirebaseAuth

class SignupViewController: UIViewController {
    
    private var phoneNumber: String?
    
    private var listController: FPNCountryListViewController!
    
    private lazy var scrollView = CustomScrollView()
    
    private lazy var signupLabel = SemiboldLabel(
                                 text: "ЗАРЕГИСТРИРОВАТЬСЯ",
                                 textColor: .textColor)
    
    private lazy var enterNumberLabel = RegularLabel(
                                        text: "Введите номер",
                                        textColor: .lightTextColor)
                                        
    private lazy var cautionLabel = RegularLabel(
                                    text: "Ваш номер будет использоваться для входа в аккаунт",
                                    textColor: .mediumTextColor)
    
    private lazy var phoneNumberTextField = PhoneNumberTextField()
    
    private lazy var nextButton = ColorButton(title: "ДАЛЕЕ",
                                              color: .buttonColor,
                                              completion: { self.fetchCodeTapped() })
    
    private lazy var agreementLabel = RegularLabel(
                                    text: "Нажимая кнопку “Далее” Вы принимаете пользовательское Соглашение и политику конфедициальности",
                                    textColor: .mediumTextColor)
    
    private func fetchCodeTapped() {
        guard phoneNumber != nil else { return }
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) { (verificationID, error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                self.showCodeValidVC(verificationID: verificationID!)
            }
        }
    }
    
    private func showCodeValidVC(verificationID: String) {
        let smsVC = SmsVerificationViewController()
        smsVC.verificationID = verificationID
        self.present(smsVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConfiguration()
    }
    
    func setupConfiguration() {
        
        nextButton.alpha = 0.5
        nextButton.isEnabled = false
        
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
        scrollView.addSubview(signupLabel)
        scrollView.addSubview(enterNumberLabel)
        scrollView.addSubview(cautionLabel)
        scrollView.addSubview(phoneNumberTextField)
        scrollView.addSubview(nextButton)
        scrollView.addSubview(agreementLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            signupLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.182),
            signupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.595),
            signupLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.027),
            
            enterNumberLabel.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: view.frame.height * 0.086),
            enterNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterNumberLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.328),
            enterNumberLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.03),
            
            cautionLabel.topAnchor.constraint(equalTo: enterNumberLabel.bottomAnchor, constant: 5),
            cautionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cautionLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.574),
            cautionLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.045),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: cautionLabel.bottomAnchor, constant: view.frame.height * 0.01),
            phoneNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneNumberTextField.widthAnchor.constraint(equalToConstant: view.frame.width * (260/375)),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            
            nextButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: view.frame.height * 0.0776),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.32),
            nextButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.058),
            
            agreementLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: view.frame.height * 0.037),
            agreementLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            agreementLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.69),
            agreementLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.055)
            ])
    }
    
}

extension SignupViewController: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {}
    
    func fpnDidValidatePhoneNumber(textField: FlagPhoneNumber.FPNTextField, isValid: Bool) {
        
        if isValid {
            nextButton.alpha = 1
            nextButton.isEnabled = true
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            nextButton.alpha = 0.5
            nextButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        listController.title = "Страны"
        phoneNumberTextField.text = ""
        self.present(navigationController, animated: true)
    }
    
}

