//
//  HomeViewController.swift
//  HP
//
//  Created by user on 2/24/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var appBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let borderColor : UIColor = UIColor(red: 0, green: 0.4745, blue: 0.549, alpha: 1.0)
        appBtn.backgroundColor = borderColor
        appBtn.layer.cornerRadius = appBtn.frame.height / 2
        appBtn.layer.shadowOpacity = 0.25
        appBtn.layer.shadowRadius = 5
        appBtn.layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }

    @IBAction func appBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "form")
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

}
