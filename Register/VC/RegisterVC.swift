//
//  RegisterVC.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 03/12/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterVC: UIViewController {
    
    var registersScreen: RegisterScreen?
    
    var auth:Auth?
    
    override func loadView() {
        registersScreen = RegisterScreen()
        view = registersScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registersScreen?.configTextFieldsDelegate(delegate: self)
        registersScreen?.delegate(delegate: self)
        auth = Auth.auth()
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        registersScreen?.validaTextFields()
    }
    
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
        
        guard let register = registersScreen else {return}

        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            
            if error != nil {
                print("Erro ao cadastrar")
            } else {
                print("Sucesso ao cadastrar")
            }
        })
    }
    
    
}
