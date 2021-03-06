//
//  EssentalsVC.swift
//  Wejhuh
//
//  Created by Huda N S on 06/05/1443 AH.
//

import UIKit
import SwiftUI

class EssentalsVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    //Variable to fill in details
    var selectedDetails : SetDetails?
    //Arrays of pictures, names and details
    var essentaltSet = [Essental]()
    
    // MARK: - CollectionView of Essentals
    
    // Outlet of CollectionView
    @IBOutlet weak var Essentals: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Essentals.delegate = self
        Essentals.dataSource = self
        //Formats for CollectionView
        Essentals.backgroundColor = UIColor.clear
        Essentals.layer.shadowColor = UIColor.placeholderText.cgColor
        Essentals.layer.shadowOpacity = 10
        Essentals.layer.shadowOffset = .zero
        Essentals.layer.shadowRadius = 3
        setEssentals()
    }
    
    
    // MARK: - buttons
    
    //button for URL
    @IBAction func URLVisitSaudi(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.visitsaudi.com/en")! as URL , options: [:], completionHandler: nil)
    }
    
    @IBAction func SaudiTourismAuthority(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.sta.gov.sa/ar/")! as URL , options: [:], completionHandler: nil)
    }
    
    
    // MARK: - collectionView methods
    
    //function to determine the number of rows of an array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return essentaltSet.count
    }
    
    //function to select the elements of an array
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EssentalsCell
        let data = essentaltSet[indexPath.row]
        cell.setupCell(photo: data.photo, titel: data.Title, details: data.dec )
        return cell
    }
    
    //function that is didSelect on the cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch indexPath.row {
        case 0 :
            performSegue(withIdentifier: Segues.SafetyTravelTips.rawValue, sender: nil)
        case 1 :
            performSegue(withIdentifier:Segues.AboutVisa.rawValue , sender: nil)
        case 2 :
            performSegue(withIdentifier: Segues.SaudiCurrency.rawValue, sender: nil)
        case 3 :
            performSegue(withIdentifier: Segues.UNESCO.rawValue, sender: nil)
        default :
            performSegue(withIdentifier: "", sender: nil)
        }
    }
    
    // MARK: - Fill in the array with data
    func setEssentals(){
        essentaltSet.append(Essental(Title: "Safety travel tips".localaized,
                                     photo: UIImage(named: "culture")!,
                                     dec: "stay informed ..".localaized))
        
        essentaltSet.append(Essental(Title: "About  eVisa".localaized,
                                     photo: UIImage(named: "piano")!,
                                     dec: "The Kingdom of Saudi Arabia has ..".localaized))
        
        essentaltSet.append(Essental(Title: "Saudi currency and payments".localaized,
                                     photo: UIImage(named: "currency")!,
                                     dec: "Currency exchange and transactions ..".localaized))
        
        essentaltSet.append(Essental(Title: "Saudi Heritage Journey to UNESCO".localaized,
                                     photo: UIImage(named: "UNESCO")!,
                                     dec: "The trip of Saudi heritage to UNESCO was not a picnic ..".localaized))
    }
    
}
