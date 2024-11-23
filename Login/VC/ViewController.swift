//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() { // responsavel pela criacao de uma view
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) { // usado para esconder a barra de navegação assim que a tela está prestes a aparecer.
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a barra de navegação.
    }
}

