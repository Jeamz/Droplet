//
//  SignupController.swift
//  Novo
//
//  Created by James Avery on 6/4/17.
//  
//

import UIKit

class SignupController: UIViewController {
    
    let singupLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Sign Up"
        label.textColor = UIColor.white
        label.font = UIFont(name:"Avenir Next", size: 65.0)
        return label
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.borderStyle = UITextBorderStyle.roundedRect
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.spellCheckingType = UITextSpellCheckingType.no
        tf.autocorrectionType = UITextAutocorrectionType.no
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.borderStyle = UITextBorderStyle.roundedRect
        return tf
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Username"
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Email"
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Password"
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.gray
        button.setTitle("Confirm", for: .normal)
        button.titleLabel!.font =  UIFont(name: "AvenirNext-DemiBold", size: 20)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        return button
    }()
    
    let currentDate: String = {
        var day = String()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        day = formatter.string(from: date)
        return day
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 65, g: 105, b: 225)
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(handleLogin))
        navBar.setItems([navItem], animated: false);
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignupController.dismisKeyboard))
        view.addGestureRecognizer(tap)
        
        self.view.addSubview(singupLabel)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(confirmButton)
        
        setupSignupLabel()
        setupUsernameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupUsernameLabel()
        setupEmailLabel()
        setupPasswordLabel()
        setupConfirmButton()
    }
    
    func dismisKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func setupSignupLabel(){
        singupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        singupLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -185).isActive = true
        singupLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        singupLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupUsernameTextField(){
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupEmailTextField(){
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupPasswordTextField(){
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupUsernameLabel(){
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -53).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupEmailLabel(){
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 17).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupPasswordLabel(){
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 87).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupConfirmButton(){
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 220).isActive = true
        confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func confirmAction (sender: UIButton){
        guard let url = URL(string: "<URL>"+usernameTextField.text!+"/"+passwordTextField.text!+"/"+emailTextField.text!+"/"+currentDate) else{ return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                    print(json!)
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
        print("--URL--: "+String(describing:url))
    }

    func handleLogin (){
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
        
