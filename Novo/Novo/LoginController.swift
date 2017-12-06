//
//  LoginController.swift
//  Novo
//
//  Created by James Avery on 6/4/17.
//  
//

import UIKit
import FMMosaicLayout

class LoginController: UIViewController {
    
    //View components
    let DropletLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Droplet"
        label.textColor = UIColor.white
        label.font = UIFont(name:"Avenir Next", size: 78.0)
        label.numberOfLines = 0
        return label
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.borderStyle = UITextBorderStyle.roundedRect
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
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Password"
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(r: 65, g: 105, b: 225)
        button.setTitle("|Login", for: .normal)
        button.titleLabel!.font =  UIFont(name: "AvenirNext-DemiBold", size: 30)
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(r: 65, g: 105, b: 225)
        button.setTitle("|Signup", for: .normal)
        button.titleLabel!.font =  UIFont(name: "AvenirNext-DemiBold", size: 30)
        button.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 65, g: 105, b: 225)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.view.addSubview(DropletLabel)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(loginButton)
        self.view.addSubview(signupButton)
        
        setupDropletLabel()
        setupUsernameTextField()
        setupPasswordTextField()
        setupUsernameLabel()
        setupPasswordLabel()
        setupLoginButton()
        setupSignupButton()
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //setup functions
    func setupDropletLabel(){
        DropletLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        DropletLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -165).isActive = true
        DropletLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        DropletLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupUsernameTextField(){
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -5).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupPasswordTextField(){
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupUsernameLabel(){
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -28).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupPasswordLabel(){
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 42).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupLoginButton(){
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40)
    }
    
    func setupSignupButton(){
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
        signupButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        signupButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 40)

    }
    
    
    func loginAction (sender: UIButton!){
        let layout = FMMosaicLayout()
        let mainScreen = MainController(collectionViewLayout: layout)
        present(mainScreen, animated: true, completion: nil)
    }
    
    func loginRequest(){
        guard let url = URL(string: "<URL>"+usernameTextField.text!+"/"+passwordTextField.text!) else{ return }
        var securityCode: Bool?
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                    if let parseJSON = json {
                        securityCode = (parseJSON["security"] as? Bool)!
                        print("security code bool: \(String(describing: securityCode))")
                        if securityCode! == true {
                            DispatchQueue.main.async {
                                let layout = FMMosaicLayout()
                                let mainScreen = MainController(collectionViewLayout: layout)
                                self.present(mainScreen, animated: true, completion: nil)
                            }
                        }
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
    }
    
    func signupAction (sender: UIButton!){
        let signupController = SignupController()
        present(signupController, animated: true, completion: nil)
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
