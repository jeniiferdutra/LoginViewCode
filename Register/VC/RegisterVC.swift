//
//  RegisterVC.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 03/12/24.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registersScreen: RegisterScreen?
    
    override func loadView() {
        registersScreen = RegisterScreen()
        view = registersScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registersScreen?.configTextFieldsDelegate(delegate: self)
        registersScreen?.delegate(delegate: self)
    }
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func actionBackButton() {
        print("Back Button!!")
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print("Register Button!!")
    }
    
    
}
