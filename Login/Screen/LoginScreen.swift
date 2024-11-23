//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit

class LoginScreen: UIView {

    lazy var loginLabel: UILabel = { // só é executado qnd chama. util para otimizar o uso de memória ou evitar cálculos desnecessários.
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    override init(frame: CGRect) { // construtor
        super.init(frame: frame)
        addSubview(loginLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

}
