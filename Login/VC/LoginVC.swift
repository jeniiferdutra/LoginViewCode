//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    
    override func loadView() { // responsavel pela criacao de uma view
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        auth = Auth.auth()
        
    }

    override func viewWillAppear(_ animated: Bool) { // usado para esconder a barra de navegação assim que a tela está prestes a aparecer.
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a barra de navegação.
    }
}

extension LoginVC: LoginScreenProtocol {
    func actionLoginButton() {
        guard let login = loginScreen else {return }
        
        auth?.createUser(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            
            if error != nil {
                print("Atençao! Dados incorretos, verifique e tente novamente.")
            } else {
                if usuario == nil {
                    print("Tivemos um problema inesperado. Tente novamente mais tarde")
                } else {
                    print("Parabens! Usuario logado com sucesso!!!")
                }
            }
        })

    }
    
    func actionRegisterButton() {
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

