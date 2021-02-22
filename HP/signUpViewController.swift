//
//  signUpViewController.swift
//  HP
//
//  Created by Roseline Shapi on 2/17/21.
//

import UIKit
import FirebaseAuth
import Firebase

class signUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firstName.delegate = self
        lastName.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPass.delegate = self
    }
    

    @IBAction func signUpButtonTaped(_ sender: Any) {
        if firstName.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "First Name is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if lastName.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "Last Name is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if email.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "Email is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if password.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "Password is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        if confirmPass.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "Password confirmtation is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if confirmPass.text! != password.text!{
            let alertController = UIAlertController(title: "Password", message: "Passwords do not match", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if firstName.text?.isEmpty == true && lastName.text?.isEmpty == true && email.text?.isEmpty == true && password.text?.isEmpty == true && confirmPass.text?.isEmpty == true {
            let alertController = UIAlertController(title: "Field Required", message: "Please fill all fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirmPass.resignFirstResponder()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    

    func signUp(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){(authResult, error) in
            guard let user = authResult?.user, error == nil else{
                print("Error\(String(describing: error?.localizedDescription))")
                return
            }
            
        }
    }
}

extension signUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
