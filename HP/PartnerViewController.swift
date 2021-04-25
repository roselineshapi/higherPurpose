////
////  PartnerViewController.swift
////  HP
////
////  Created by user on 4/18/21.
////
//
//import UIKit
//
//class PartnerViewController: UIViewController {
//
//
//    @IBOutlet weak var hopeOutlet: UIImageView!
//    @IBOutlet weak var hopeBtn: UIButton!
//    @IBOutlet weak var guarantyOutlet: UIImageView!
//    @IBOutlet weak var guarantyBtn: UIButton!
//    
//    
//    let yourAttributes: [NSAttributedString.Key: Any] = [
//          .font: UIFont.systemFont(ofSize: 13),
//          .foregroundColor: UIColor.black,
//          .underlineStyle: NSUnderlineStyle.single.rawValue
//      ] // .double.rawValue, .thick.rawValue
//          
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//       
//        let attributeString = NSMutableAttributedString(
//           string: "Guaranty Bank",
//           attributes: yourAttributes
//        )
//        guarantyBtn.setAttributedTitle(attributeString, for: .normal)
//        
//        let HopeString = NSMutableAttributedString(
//           string: "Hope Credit Union",
//           attributes: yourAttributes
//        )
//        hopeBtn.setAttributedTitle(HopeString, for: .normal)
//        
////        let CUString = NSMutableAttributedString(
////           string: "Communities Unlimited",
////           attributes: yourAttributes
////        )
////        CUBtn.setAttributedTitle(CUString, for: .normal)
////
////        let PLString = NSMutableAttributedString(
////           string: "Pathway Lending",
////           attributes: yourAttributes
////        )
////        PLBtn.setAttributedTitle(PLString, for: .normal)
//
//        guarantyBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
//        guarantyBtn.layer.shadowRadius = 3
//        guarantyBtn.layer.shadowColor = UIColor.black.cgColor
//        guarantyBtn.layer.shadowOpacity = 0.3
//        
//        hopeBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
//        hopeBtn.layer.shadowRadius = 3
//        hopeBtn.layer.shadowColor = UIColor.black.cgColor
//        hopeBtn.layer.shadowOpacity = 0.3
//        
////        CUBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
////        CUBtn.layer.shadowRadius = 3
////        CUBtn.layer.shadowColor = UIColor.black.cgColor
////        CUBtn.layer.shadowOpacity = 0.3
////
////        PLBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
////        PLBtn.layer.shadowRadius = 3
////        PLBtn.layer.shadowColor = UIColor.black.cgColor
////        PLBtn.layer.shadowOpacity = 0.3
//    }
//    
//    @IBAction func GuarantyBankTapped(_ sender: Any) {
//        UIApplication.shared.open(NSURL(string: "https://gbtonline.com/")! as URL)
//        }
//    @IBAction func HopeTapped(_ sender: Any) {
//        UIApplication.shared.open(NSURL(string: "https://hopecu.org/")! as URL)
//
//    }
////    @IBAction func CUTapped(_ sender: Any) {
////        UIApplication.shared.open(NSURL(string: "https://communitiesu.org/")! as URL)
////
////    }
////    @IBAction func PathwayTapped(_ sender: Any) {
////        UIApplication.shared.open(NSURL(string: "https://www.pathwaylending.org/")! as URL)
////
////    }
//}
//    
//    
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//
