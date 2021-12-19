//
//  SeeCell.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import CoreData

class SeeCell: UICollectionViewCell {
    
    var selectedArrayTrips : Trips!
    var arrayTrip = [Trips]()
    
    let persistentContainer : NSPersistentContainer = {
       let container = NSPersistentContainer(name: "FavoriteModel")
       container.loadPersistentStores(completionHandler: { desc, error in
           if let readError = error {
               print(readError)
           }
       })
       return container
   }()
    
    
    @IBOutlet weak var seeView: UIView!
    @IBOutlet weak var seeCity: UILabel!
    @IBOutlet weak var seeName: UILabel!
    @IBOutlet weak var btnAddToMyTrip: UIButton!
    @IBOutlet weak var seeImage: UIImageView!
    
    var curentImageName: String?
    

    override func awakeFromNib() {
        seeImage.layer.cornerRadius = 12
        seeView.layer.cornerRadius = 12
    }
    func setupCell(photo : String ,city : String , name : String){
        seeImage.image = UIImage(named:photo)
        seeName.text = name
        seeCity.text = city
}
    
    
    @IBAction func addFavoritePlaces(_ sender: UIButton) {
        createNewList(eventName: seeName.text ?? "" , eventPhoto: curentImageName ?? "")
    }
    
    
    func createNewList(eventName: String, eventPhoto: String){
        let context = persistentContainer.viewContext
        context.performAndWait {
            let list = TripsList(context: context)
            list.name = eventName
            list.photo = eventPhoto
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
