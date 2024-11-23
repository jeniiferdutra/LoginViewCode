//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var loginLabel: UILabel = { // só é executado qnd chama. util para otimizar o uso de memória ou evitar cálculos desnecessários.
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(loginLabel)
        setUpConstraints() 
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            
        ])
    }

    override func viewWillAppear(_ animated: Bool) { // usado para esconder a barra de navegação assim que a tela está prestes a aparecer.
        self.navigationController?.setNavigationBarHidden(true, animated: false) // esconde a barra de navegação.
    }
}

