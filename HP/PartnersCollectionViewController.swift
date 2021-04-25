//
//  PartnersCollectionViewController.swift
//  HP
//
//  Created by user on 4/25/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class PartnersCollectionViewController: UICollectionViewController {
    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
        //let tap = UITapGestureRecognizer(target: self, action: Selector(("tapFunction:")));pLabel.addGestureRecognizer(tap)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

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
        let partner = partners[indexPath.row]
        cell.pImage.image = UIImage(named: partner.image)
        cell.pLabel.text = partner.name
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
