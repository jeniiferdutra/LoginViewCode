//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 03/12/24.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var imageAddUser: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "usuario")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu email"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()

    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Cadastrar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        
        configImageAddUserConstraint()
        configBackButtonConstraint()
        configEmailTextFieldConstraint()
        configPasswordTextFieldConstraint()
        configRegisterButtonConstraint()
        
        configButtonEnable(false)
    }
    
    private func configSuperView() {
        addSubview(backButton)
        addSubview(imageAddUser)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldsDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        delegate?.actionRegisterButton()
    }
    
    public func validaTextFields() {
        
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty { // vai verificar se o email/senha nao estao vazios 
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    public func configButtonEnable(_ enable: Bool) { // se o botao estar ou nao habilitado
        if enable {
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.isEnabled = true
        } else { // caso a validacao nao tiver dados
            registerButton.setTitleColor(.lightGray, for: .normal)
            registerButton.isEnabled = false // impedindo o usuario de fazer o clique
        }
    }
    
    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configImageAddUserConstraint() {
        
        imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }

    func configBackButtonConstraint() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(imageAddUser.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configEmailTextFieldConstraint() {
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(imageAddUser.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }

    func configPasswordTextFieldConstraint() {
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstraint() {
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
}
