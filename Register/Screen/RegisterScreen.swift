//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 03/12/24.
//

import UIKit

class RegisterScreen: UIView {
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back"), for: .normal)
        return btn
    }()
    
    lazy var imageAddUser: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "usuario")
        img.contentMode = .scaleAspectFit
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        setupConstraints()
    }
    
    private func configSuperView() {
        addSubview(backButton)
        addSubview(imageAddUser)
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageAddUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            backButton.topAnchor.constraint(equalTo: imageAddUser.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            
        ])
    }
    
}
