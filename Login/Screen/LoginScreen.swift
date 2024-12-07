//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Jenifer Rocha on 23/11/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?) { // funcao para configurar o delegate
        self.delegate = delegate
    }

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
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // teclado para digitar o email
        tf.placeholder = "Digite seu Email:"
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
        tf.isSecureTextEntry = true
        tf.placeholder = "Digite sua senha:"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Logar", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true // arrendondar
        btn.layer.cornerRadius = 7.5 // raio de arredondamento das bordas do botão, criando cantos arredondados.
        btn.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Não tem conta? Cadastre-se", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) { // construtor
        super.init(frame: frame)
        configBackground()
        configSuperView()
        
        configLoginLabelConstraint()
        configLogoAppImageViewConstraint()
        configEmailTextFieldConstraint()
        configPasswordTextField()
        configLoginButton()
        configRegisterButton()
        
        //setUpConstraints()
        configButtonEnable(false)
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView() {
        addSubview(loginLabel)
        addSubview(logoAppImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        delegate?.actionRegisterButton()
    }
    
    public func validaTextFields() {
        
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    public func configButtonEnable(_ enable: Bool) {
        if enable {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.isEnabled = true
        } else {
            loginButton.setTitleColor(.lightGray, for: .normal)
            loginButton.isEnabled = false
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
    
//    private func setUpConstraints() {
 //       NSLayoutConstraint.activate([
        
//            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
//            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
//            logoAppImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
//            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
//            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
//            logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
//            emailTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
//            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
//            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
//            
//            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
//            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
//        ])
//    }
    
    func configLoginLabelConstraint() {
        
        loginLabel.snp.makeConstraints { make in // make esta se referenciando as constrains do loginLabel
            // offset -> qnd o valor é positivo
            // inset -> qnd o valor é negativo
            
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview() // qnd se referencia ao mesmo elemento
        }
    }
    
    func configLogoAppImageViewConstraint() {
        logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)
        }
    }

    func configEmailTextFieldConstraint() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoAppImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    func configLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    func configRegisterButton() {
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    

}
