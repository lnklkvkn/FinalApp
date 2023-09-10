//
//  SmsVerificationViewController .swift
//  FinalApp
//
//  Created by ln on 16.08.2023.
//

import UIKit

class SmsVerificationViewController: UIViewController {
        
    var verificationID: String!
    
    private lazy var scrollView = CustomScrollView()

    private lazy var titleLabel = SemiboldLabel(
                                 text: isSignup() ? "Зарегистрироваться" : "Авторизация",
                                 textColor: .orangeAppColor)
    
    private lazy var weSendLabel = RegularLabel(
                                 text: "Мы отправили вам смс на номер",
                                 textColor: .textColor)
    
    private lazy var numberLabel = SemiboldLabel(
                                 text: "+38 099 999 99 99",
                                 textColor: .textColor)
    
    private lazy var enterCodeLabel = RegularLabel(
                                 text: "Введите код из SMS",
                                 textColor: .lightTextColor)
    
    private lazy var codeTextField = CustomTextField(placeholder: "__-__")
    
    private lazy var registrationButton = ColorButton(title: isSignup() ? "ЗАРЕГИСТРИРОВАТЬСЯ" : "ПРОДОЛЖИТЬ",
                                                      color: .buttonColor,
                                                      completion: { self.pushVC() })
    
    private lazy var checkMarkImageView = NamedImage(name: "checkMark")
    
    private func pushVC() {
        let checkerServise = CheckerService()
        checkerServise.checkCredentials(smsCode: codeTextField.text, verificationID: verificationID)
    }
    
    private func isSignup() -> Bool {
        self.navigationController?.viewControllers[1] is SignupViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConfiguration()
    }
    
    func setupConfiguration() {
        registrationButton.alpha = 0.5
        registrationButton.isEnabled = true
        codeTextField.delegate = self
    }
    
    func setupView() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(weSendLabel)
        scrollView.addSubview(numberLabel)
        scrollView.addSubview(enterCodeLabel)
        scrollView.addSubview(codeTextField)
        scrollView.addSubview(registrationButton)
        scrollView.addSubview(checkMarkImageView)
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.18),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.73),
            titleLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.027),
            
            weSendLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.015),
            weSendLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weSendLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.73),
            weSendLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.025),
            
            numberLabel.topAnchor.constraint(equalTo: weSendLabel.bottomAnchor),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.73),
            numberLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.025),
            
            enterCodeLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: view.frame.height * 0.145),
            enterCodeLabel.leadingAnchor.constraint(equalTo: codeTextField.leadingAnchor),
            enterCodeLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.33),
            enterCodeLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 0.0185),
            
            codeTextField.topAnchor.constraint(equalTo: enterCodeLabel.bottomAnchor, constant: 5),
            codeTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            codeTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7),
            codeTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            
//            registrationButton.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: view.frame.height * 0.1),
            registrationButton.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20),
            registrationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7),
            registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            
            checkMarkImageView.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: view.frame.height * 0.053),
            checkMarkImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            checkMarkImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.23),
            checkMarkImageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.123),
        ])
    }

}

extension SmsVerificationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLenght = currentCharacterCount + string.count - range.length
        return newLenght <= 6
    }
    

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 6 {
            registrationButton.alpha = 1
            registrationButton.isEnabled = true
        } else {
            registrationButton.alpha = 0.5
            registrationButton.isEnabled = false
        }
    }

}
