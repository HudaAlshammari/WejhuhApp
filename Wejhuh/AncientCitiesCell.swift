//
//  AncientCitiesCell.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit

class AncientCitiesCell: UICollectionViewCell {
    
    @IBOutlet weak var ancientCitiesView: UIView!
    @IBOutlet weak var ancientName: UILabel!
    @IBOutlet weak var ancientImage: UIImageView!
    
//    override func awakeFromNib() {
//        ancientImage.layer.cornerRadius = 12
//        naturalCitiesPhoto.layer.cornerRadius = 12
//}
    func setupCell(photo : UIImage , name : String){
        ancientImage.image = photo
        ancientName.text = name
    }
}