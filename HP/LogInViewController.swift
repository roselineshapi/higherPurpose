//
//  LogInViewController.swift
//  HP
//
//  Created by user on 2/16/21.
//

import UIKit

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

extension LogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

