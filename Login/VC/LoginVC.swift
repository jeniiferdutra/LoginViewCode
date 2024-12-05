//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() { // responsavel pela criacao de uma view
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        
    }

    override func viewWillAppear(_ animated: Bool) { // usado para esconder a barra de navegação assim que a tela está prestes a aparecer.
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a barra de navegação.
    }
}

extension LoginVC: LoginScreenProtocol {
    func actionLoginButton() {
        print("deu certo LoginButton")
    }
    
    func actionRegisterButton() {
        print("Deu certo RegisterButton")
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginScreen?.validaTextFields()
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // gerenciar o comportamento de um campo de texto qnd o botao return é pressionado
        print("textFieldShouldReturn")
        textField.resignFirstResponder() // fecha o teclado
        return true
    }
}

