//
//  RegisterVC.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 03/12/24.
//

import UIKit

class RegisterVC: UIViewController {
    
    var register: RegisterScreen?
    
    override func loadView() {
        register = RegisterScreen()
        view = register
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
