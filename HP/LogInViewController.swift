//
//  LogInViewController.swift
//  HP
//
//  Created by user on 2/16/21.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    var validation = Validation()
//    var homeScreen = HomeScreenViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButtom(){
        present(HomeScreenViewController(), animated: true)
    }
    
    @IBAction func signUpButtonTaapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if emailField.resignFirstResponder() && emailField.text == ""{
        let alertController = UIAlertController(title: "Field required", message: "Email is required", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
            }
        
        
        if  passField.resignFirstResponder() && passField.text == ""{
        let alertController = UIAlertController(title: "Field required", message: "Password is required", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
            }

    }
  
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = (emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let password = (passField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        
        
        if email == "" && password == ""{
            let alertController = UIAlertController(title: "Field required", message: "Email & password are required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if email == ""{
            let alertController = UIAlertController(title: "Field required", message: "Email is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if password == ""{
            let alertController = UIAlertController(title: "Field required", message: "Password is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if self != nil{
                let alertController = UIAlertController(title: "Authentication Erros", message: "Email and password do not match", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
                alertController.addAction(defaultAction)
                self!.present(alertController, animated: true, completion: nil)
                
            } else {
                
                let homeViewController = self?.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeScreenViewController
                
                self!.view.window?.rootViewController = homeViewController
                self!.view.window?.makeKeyAndVisible()
                
                }
          // ...
        }
    }
}

extension LogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

