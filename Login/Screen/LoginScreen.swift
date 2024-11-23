//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit

class LoginScreen: UIView {

    lazy var loginLabel: UILabel = { // lazy só é executado qnd chama. util para otimizar o uso de memória ou evitar cálculos desnecessários.
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .green
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) { // construtor
        super.init(frame: frame)
        backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
        addSubview(loginLabel)
        addSubview(logoAppImageView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }

}
