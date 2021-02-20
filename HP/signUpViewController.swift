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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButtonTaped(_ sender: Any) {
        if firstName.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "First Name is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if lastName.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "First Name is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if email.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "Email Name is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        if password.text?.isEmpty == true{
            let alertController = UIAlertController(title: "Field required", message: "Password Name is required", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func signUp(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){(authResult, error) in
            guard let user = authResult?.user, error == nil else{
                print("Error\(error?.localizedDescription)")
                return
            }
            
        }
    }
}
