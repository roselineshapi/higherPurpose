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
    @IBOutlet weak var creditDD: DropDown!
    @IBOutlet weak var fundingDD: DropDown!
    @IBOutlet weak var businessTextView: UITextView!
    @IBOutlet weak var fundsTextView: UITextView!
    
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
        creditDD.selectedRowColor = selection
        fundingDD.selectedRowColor = selection
        
        
        // Arrow Size
        genderDD.arrowSize = 10
        estBizDD.arrowSize = 10
        stateDD.arrowSize = 10
        bizAgeDD.arrowSize = 10
        bizTypeDD.arrowSize = 10
        bizCatDD.arrowSize = 10
        creditDD.arrowSize = 10
        fundingDD.arrowSize = 10
    
        

        // DropDown Menu
        genderDD.optionArray = ["Male", "Female", "Decline to state"]
        estBizDD.optionArray = ["Yes", "No"]
        stateDD.optionArray = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA","MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WT", "WI", "WY"]
        bizAgeDD.optionArray = ["0-5 Years", "5-10 Years", "10-20 Years", "Over 20 Years"]
        bizTypeDD.optionArray = ["Coporate(Inc.)", "Limited Liability Company(LLC)", "General Partnership", "Limited Liability Partnership(LLP)", "Sole Proprietorship", "Other"]
        bizCatDD.optionArray = ["Food/Agriculture", "Education", "Health/Wellness", "Art/Culture"]
        creditDD.optionArray = ["300-599", "600-649", "650-699", "700-749", "750-799", "800-850"]
        fundingDD.optionArray = ["$0-$10,000", "$10,000-$30,000", "$30,000-$75,000", "$75,000-$100,000", "$100,000-$300,000", "$300,000-$500,000", "$500,000+"]
        //Its Id Values and its optional
//        genderDD.optionIds = [1,23,54,22]

        // Image Array its optional
//        genderDD.ImageArray = [👩🏻‍🦳,🙊,🥞]
        // The the Closure returns Selected Index and String
//        genderDD.didSelect{(selectedText , index ,id) in
//        self.genderDD.text = "Selected String: \(selectedText) \n index: \(index)"
//        }
        
        
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
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
