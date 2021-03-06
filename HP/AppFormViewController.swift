//
//  AppFormViewController.swift
//  HP
//
//  Created by user on 3/25/21.
//

import iOSDropDown
import UIKit

class AppFormViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var genderDD: DropDown!
    @IBOutlet weak var estBizDD: DropDown!
    @IBOutlet weak var stateDD: DropDown!
    @IBOutlet weak var bizAgeDD: DropDown!
    @IBOutlet weak var bizTypeDD: DropDown!
    @IBOutlet weak var bizCatDD: DropDown!
    @IBOutlet weak var fundingDD: DropDown!
    @IBOutlet weak var businessTextView: UITextView!
    @IBOutlet weak var fundsTextView: UITextView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var numField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var estBizField: UITextField!
    
    @IBOutlet weak var creditScoreField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let selection : UIColor = UIColor(red: 0, green: 0.4745, blue: 0.549, alpha: 1.0)
        
        // Selection color
        genderDD.selectedRowColor = selection
        estBizDD.selectedRowColor = selection
        stateDD.selectedRowColor = selection
        bizAgeDD.selectedRowColor = selection
        bizTypeDD.selectedRowColor = selection
        bizCatDD.selectedRowColor = selection
        fundingDD.selectedRowColor = selection
        
        
        // Arrow Size
        genderDD.arrowSize = 10
        estBizDD.arrowSize = 10
        stateDD.arrowSize = 10
        bizAgeDD.arrowSize = 10
        bizTypeDD.arrowSize = 10
        bizCatDD.arrowSize = 10
        fundingDD.arrowSize = 10
    
        

        // DropDown Menu
        genderDD.optionArray = ["Male", "Female", "Decline to state"]
        estBizDD.optionArray = ["Yes", "No"]
        stateDD.optionArray = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA","MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WT", "WI", "WY"]
        bizAgeDD.optionArray = ["0-5 Years", "5-10 Years", "10-20 Years", "Over 20 Years"]
        bizTypeDD.optionArray = ["Coporate(Inc.)", "Limited Liability Company(LLC)", "General Partnership", "Limited Liability Partnership(LLP)", "Sole Proprietorship", "Other"]
        bizCatDD.optionArray = ["Food/Agriculture", "Education", "Health/Wellness", "Art/Culture"]
       
        fundingDD.optionArray = ["$0-$10,000", "$10,000-$30,000", "$30,000-$75,000", "$75,000-$100,000", "$100,000-$300,000", "$300,000-$500,000", "$500,000+"]
        //Its Id Values and its optional
//        genderDD.optionIds = [1,23,54,22]

        // Image Array its optional
//        genderDD.ImageArray = [👩🏻‍🦳,🙊,🥞]
        // The the Closure returns Selected Index and String
//        genderDD.didSelect{(selectedText , index ,id) in
//        self.genderDD.text = "Selected String: \(selectedText) \n index: \(index)"
//        }
        
        
        // Setting Boderlines and Placeholders for businessDes and Funds Utilization UITextView
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        businessTextView.layer.borderWidth = 0.5
        businessTextView.layer.borderColor = borderColor.cgColor
        businessTextView.layer.cornerRadius = 5.0
        businessTextView.text = "Describe your business/potential business in 150 words or less"
        businessTextView.textColor = UIColor.lightGray
        businessTextView.font = UIFont(name: "verdana", size: 13.5)
        businessTextView.returnKeyType = .done
        businessTextView.delegate = self
        
        
        fundsTextView.layer.borderWidth = 0.5
        fundsTextView.layer.borderColor = borderColor.cgColor
        fundsTextView.layer.cornerRadius = 5.0
        fundsTextView.text = "How will the funds be utilized?"
        fundsTextView.textColor = UIColor.lightGray
        fundsTextView.font = UIFont(name: "verdana", size: 13.5)
        fundsTextView.returnKeyType = .done
        fundsTextView.delegate = self
        
        
        let name = nameField.text
        let gender = genderField.text
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Describe your business/potential business in 150 words or less" || textView.text == "How will the funds be utilized?"{
            textView.text = ""
            textView.textColor = UIColor.black
            textView.font = UIFont(name: "verdana", size: 14.0)
        }
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
        }
        return true
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == businessTextView && textView.text == ""{
            textView.text = "Describe your business/potential business in 150 words or less"
            textView.textColor = UIColor.lightGray
            textView.font = UIFont(name: "verdana", size: 13.0)
        }
        
        if textView == fundsTextView && textView.text == ""{
            textView.text = "How will the funds be utilized?"
            textView.textColor = UIColor.lightGray
            textView.font = UIFont(name: "verdana", size: 13.0)
        }
    }
    func validateFields() ->String? {
            //check all the fields are filled in
        if nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            genderDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            addressField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            numField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            estBizDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            stateDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            bizAgeDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            bizTypeDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            bizCatDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            creditScoreField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            fundingDD.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("hello")
            return "Please fill in all fields."
        }
    
        let cleanedEmail = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
        if Utilities.isValidEmail(cleanedEmail) == false{
            return "Please make sure your email address is valid."
        }
        let creditScoreValue:Int? = Int(creditScoreField.text!)!
        if ( creditScoreValue! < 300 || creditScoreValue! > 850){
            return "Credit score is invalid."
        }
        return nil
}
  

    @IBAction func clickApplyButton(_ sender: Any) {
        let error = validateFields()
        if error != nil {
        // There's something wrong with the fields, show error message
//            showError(error!)
           let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
           let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alertController.addAction(defaultAction)
           self.present(alertController, animated: true, completion: nil)
      }else {
                   //validate user input
           let email = (emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let name = (nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let gender = (genderField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let address = (addressField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let phoneNum = (numField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let estBiz = (estBizField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let businessName = (businessTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let state = (stateDD.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let businessAge = (bizAgeDD.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let businessType = (bizTypeDD.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let businessCategory = (bizCatDD.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
//            let creditScore = (creditDD.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let fundingAmount = (fundingDD.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
           let creditScoreValue:Int? = Int(creditScoreField.text!)!
           //declare and initialize a dictionary:
           var creditScoreDic: [Int: [String]] = [600:["Gurantee Bank", "Hope Credit Union"], 610:["Pathway lending"]]
          
           var locationDic: [String: [String]] = ["Al": ["Hope Credit Union"],
                                                "KA":["Hope Credit Union"],
                                                "MS":["Hope Credit Union", "Pathway Lending"],
                                                "TN":["Hope Credit Union"]]
           
           var matchedCompanies = Set<String>()
           for (key,value) in creditScoreDic {
               if(key <= creditScoreValue!){
                   for item in value   {
                       matchedCompanies.insert(item)
                   }
                
               }

           }
                   
           for(key, value) in locationDic {
               if(key == state  ){
                   for item in value {
                       matchedCompanies.insert(item)
                   }
               }
           }
                   
           for grantor  in matchedCompanies {
               print(grantor)
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
