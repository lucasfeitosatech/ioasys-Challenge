//
//  LoginViewController.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 21/10/20.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: CustomButton!
    let loader = Loader()
    @IBOutlet weak var email: CustomTextField!
    
    @IBOutlet weak var password: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        loader.label.text = "Processando..."
        loginButton.setTitle("Entrar", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    private func setupTextFields() {
        email.label.text = "Email"
        email.image.isHidden = true
        password.label.text = "Senha"
        password.textField.textContentType = .password
        password.image.addTarget(self, action: #selector(self.showPassword), for: .touchUpInside)
    //password.image.addTarget(forAction: #selector(self.showPassword), withSender: self)
        password.textField.isSecureTextEntry = true
        self.password.tag = 0
    }
    
    @objc func showPassword() {
        if(self.password.tag == 0){
            password.textField.isSecureTextEntry = false
            self.password.tag = 1
            self.password.image.tintColor = UIColor.gray
        } else {
            password.textField.isSecureTextEntry = true
            self.password.tag = 0
            self.password.image.tintColor = Color.BUTTON_COLOR
        }
    }
    

    @IBAction func login(_ sender: Any) {
        if let email = email.textField.text,let password = password.textField.text {
            if !Helper.isValidEmail(email) {
                self.email.setupWithError(message: "Email inválido")
                return
            } else if !Helper.isValidPassword(password) {
                self.password.setupWithError(message: "Senha inválida")
                return
            }
            requestLogin()
        }
        
    }
    
    private func requestLogin() {
        loader.show(controller: self)
        if let email = email.textField.text,let password = password.textField.text {
            let body:Parameters = [
                "email":email,
                "password":password
            ]
            APIManager.shared().authenticate(body: body) { sucess in
                
                    if !sucess {
                        print("Deu erro")
                    }
                self.loader.dismiss()
                
            }
        }
        

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
