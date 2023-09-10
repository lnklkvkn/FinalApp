//
//  CheckerService.swift
//  FinalApp
//
//  Created by ln on 20.08.2023.
//

import UIKit
import FirebaseAuth

protocol CheckerServiceProtocol {
    func checkCredentials(smsCode: String?, verificationID: String!)
}

class CheckerService: CheckerServiceProtocol {
    
    static let shared = CheckerService()
//    var verificationID: String!
    var isAutorised = false
    
    func checkCredentials(smsCode: String?, verificationID: String!) {
        
        guard let code = smsCode else { return }
        
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        
        print("Идет успешный процесс")
        Auth.auth().signIn(with: credetional) { (_, error) in
            if error != nil {
                
                let alert = UIAlertController(title: error?.localizedDescription, message: nil, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Отмена", style: .cancel)
                alert.addAction(cancel)
                UIApplication.topViewController()!.present(alert, animated: true)
            } else {
                self.showContentVC()
            }
            
        }
    }
    
    private func showContentVC() {
        let successVC = SuccessVC()
        successVC.modalPresentationStyle = .fullScreen
        UIApplication.topViewController()!.present(successVC, animated: true)
    }
    
}

//Auth.auth().signIn(withEmail: email, password: password) { _ , error in
//    if let error {
//        let err = error as NSError
//        switch err.code {
//        case AuthErrorCode.userNotFound.rawValue:
//
//            let alert = UIAlertController(title: "Пользователь не найден", message: "Зарегистрировать новый аккаунт?", preferredStyle: .alert)
//
//            let firstAction = UIAlertAction(title: "Отмена", style: .default) { _ in
//                print("Отмена регистрации ")
//            }
//            let secondAction = UIAlertAction(title: "Регистрация", style: .default) { _ in
//                print("Зарегистрирован новый пользователь: \(email)")
//                self.signUp(withEmail: email, password: password)
//            }
//            alert.addAction(firstAction)
//            alert.addAction(secondAction)
//            UIApplication.topViewController()!.present(alert, animated: true)
//        default:
//            AlertErrorSample.shared.alert(title: "Ошибка входа", message: error.localizedDescription)
//
//        }
//    } else {
//        self.isAutorised = true
//    }
//}
//}
//
//func signUp(withEmail email: String, password: String) {
//Auth.auth().createUser(withEmail: email, password: password) { _ , error in
//    if let error {
//        AlertErrorSample.shared.alert(title: "Ошибка регистрации", message: error.localizedDescription)
//    } else {
//        AlertErrorSample.shared.alert(title: "Успешная регистрация", message: "Ваш аккаунт создан!")
//    }
//}
//}
        
