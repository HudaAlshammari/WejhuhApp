//
//  SeeMore.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//
import Foundation
import UIKit
import MapKit
import FirebaseAuth
import FirebaseFirestore

class SeeMore: UIViewController {
    
    
    var selectedData : EventDetails?
    var myFavorite = [String]()
    var curentImageName: String?
    var lat : Double = 0.0
    var lon : Double = 0.0
    
   
    //Outlet of items of CollectionView
    @IBOutlet weak var seeImge: UIImageView!
    @IBOutlet weak var seeName: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var ending: UILabel!
    @IBOutlet weak var starting: UILabel!
    @IBOutlet weak var audience: UILabel!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var location: MKMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats for cell
        seeImge.layer.cornerRadius = 35
        seeImge.image = UIImage(named: selectedData?.photo ?? "")
        seeName.text = selectedData?.name
        from.text = selectedData?.from
        to.text = selectedData?.to
        starting.text = selectedData?.starting
        ending.text = selectedData?.ending
        season.text = selectedData?.season
        audience.text = selectedData?.audince
        overview.text = selectedData?.overview
        
        lat = selectedData?.latitude ?? 0.0
        lon = selectedData?.longitude ?? 0.0
        addPin(latitude: lat, longitude: lon)
    }
    
    // MARK: - button for add To Favorite
    
    @IBAction func addToFavorite(_ sender: Any) {
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            DispatchQueue.main.async {

                self.myFavorite =  user.trips ?? [""]
                let fav = self.seeName.text ?? ""
                if let foundIndex = self.myFavorite.firstIndex(of: fav) {
                    let alart = UIAlertController(title: "", message: "Already added".localaized, preferredStyle: UIAlertController.Style.alert)
                    alart.addAction(UIAlertAction(title: "ok", style: .default , handler: nil))
                    self.present(alart, animated: true)
                
                } else {
                    self.myFavorite.append(fav)
                    UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: self.myFavorite)
                    
                    let alart = UIAlertController(title: "", message: "It was successfully added to My Trip".localaized, preferredStyle: UIAlertController.Style.alert)
                    alart.addAction(UIAlertAction(title: "ok", style: .default , handler: nil))
                    self.present(alart, animated: true)
                }
            }
        }
    }
    
    
    // MARK: -  Mapkit
    
    func addPin(latitude : Double ,longitude : Double ) {
        let annotationn = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude , longitude:longitude )
        annotationn.coordinate = centerCoordinate
        location.addAnnotation(annotationn)
        setStartingLocation(locations: centerCoordinate, destance: 1000)
    }
    
    func setStartingLocation(locations : CLLocationCoordinate2D , destance : CLLocationDistance){
        let region = MKCoordinateRegion(center: locations, latitudinalMeters: destance, longitudinalMeters: destance)
        location.setRegion(region, animated: true)
    }
}
