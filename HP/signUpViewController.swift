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
    
    //check the fields and check that the
    
    func validateFields() ->String? {
        
        //check all the fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            print("hello")
            return "Please fill in all fields."
        }
        
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
       if  Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        let cleanedEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidEmail(cleanedEmail) == false{
            return "Please make sure your email address is valid."
        }
        
        return nil
    }

    @IBAction func signUpButtonTaped(_ sender: Any) {
     
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // There's something wrong with the fields, show error message
//            showError(error!)
            
            let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            // Create cleaned versions of the data
            let fName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailaddress = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password1 = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: emailaddress, password: password1) { (result, error) in
                
                if error != nil {
                    
                    // There was an error creating the user
                    
                    let alertController = UIAlertController(title: "Error creating user", message: "Failed to create user", preferredStyle: .alert)

                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":fName, "lastname":lName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
//                            self.showError("Error saving user data")
                            let alertController = UIAlertController(title: "Error saving data", message: "Error saving data", preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                        
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                      
                    }
                        let alertController = UIAlertController(title: "success", message: "Your account was successfully created", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)

                }
            }

        
        
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
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){(authResult, err) in
            guard let user = authResult?.user, err == nil else{
                print("Error\(String(describing: err?.localizedDescription))")
                return
            }
            
        }
    }
}
//func showError(_ message:String) {
//
//    errorLabel.text = message
//    errorLabel.alpha = 1
//}


//func transitionToHome() {
//
//    let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//    view.window?.rootViewController = homeViewController
//    view.window?.makeKeyAndVisible()
//
//}


extension signUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
