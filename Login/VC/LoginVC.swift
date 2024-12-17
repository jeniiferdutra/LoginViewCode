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
    var alert: Alert?
    
    override func loadView() { // responsavel pela criacao de uma view
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        auth = Auth.auth()
        self.alert = Alert(controller: self)
        
    }

    override func viewWillAppear(_ animated: Bool) { // usado para esconder a barra de navegação assim que a tela está prestes a aparecer.
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a barra de navegação.
    }
}

extension LoginVC: LoginScreenProtocol {
    func actionLoginButton() {
        guard let login = loginScreen else {return }
        
        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            
            if error != nil {
                self.alert?.getAlert(titulo: "Atencao!", mensagem: "Dados incorretos, verifique e tente novamente")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atencao!", mensagem: "Tivemos um erro inesperado. Tente novamente mais tarde")
                } else {
                    self.alert?.getAlert(titulo: "Parabens!", mensagem: "Usuario logado com sucesso!!!")
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

