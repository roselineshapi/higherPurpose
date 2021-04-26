//
//  PartnersCollectionViewController.swift
//  HP
//
//  Created by user on 4/25/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class PartnersCollectionViewController: UICollectionViewController {
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 13),
              .foregroundColor: UIColor.black,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
    
    private var partners : [Partners] = [ Partners(image: "Hope", name: "Hope Credit Union"),
                                        Partners(image: "Guaranty", name: "Guaranty Bank"),
                                        Partners(image: "Pathway", name: "Pathway Lending"),
                                        Partners(image: "Woodforest", name: "Woodforest National Bank"),
                                        Partners(image: "Communities", name: "Communities Unlimited"),
                                        Partners(image: "Kiva", name: "Kiva"),
                                        Partners(image: "Southern", name: "Southern Bancorp"),
                                        Partners(image: "Innovate", name: "Innovate Mississippi")
                                        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return partners.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! PartnersCollectionViewCell
    
        // Configure the cell
        cell.pButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.pButton.layer.shadowRadius = 3
        cell.pButton.layer.shadowColor = UIColor.black.cgColor
        cell.pButton.layer.shadowOpacity = 0.3
        
        
        let partner = partners[indexPath.row]
        
        let btnName = NSMutableAttributedString(
                        string: partner.name,
                       attributes: yourAttributes
                    )
        cell.pImage.image = UIImage(named: partner.image)
        cell.pButton.setAttributedTitle(btnName, for: .normal)
        
        return cell
    }
    
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        let indexPath = collectionView.indexPathForCellContaining(view: sender)
        
        
        
        switch indexPath?.row {
        case 0:
            UIApplication.shared.open(NSURL(string: "https://hopecu.org/")! as URL)
            break
        case 1:
            UIApplication.shared.open(NSURL(string: "https://gbtonline.com/")! as URL)
            break
        case 2:
            UIApplication.shared.open(NSURL(string: "https://www.pathwaylending.org/")! as URL)
            break
        case 3:
            UIApplication.shared.open(NSURL(string: "https://www.woodforest.com/")! as URL)
            break
        case 4:
            UIApplication.shared.open(NSURL(string: "https://communitiesu.org/")! as URL)
            break
        case 5:
            UIApplication.shared.open(NSURL(string: "https://www.kiva.org/")! as URL)
            break
        case 6:
            UIApplication.shared.open(NSURL(string: "https://banksouthern.com/")! as URL)
            break
        case 7:
            UIApplication.shared.open(NSURL(string: "https://www.innovate.ms/")! as URL)
            break
        default:
            return
        }
    }

}
extension UICollectionView {
    func indexPathForCellContaining( view: UIButton) -> IndexPath? {
        let viewCenter = self.convert(view.center, from: view.superview)
        return self.indexPathForItem(at: viewCenter)
    }
}

