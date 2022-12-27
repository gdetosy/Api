//
//  MapViewController.swift
//  Api
//
//  Created by tosy on 26.12.22.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    var user: User?
   
    
    @IBOutlet var map: MKMapView!
    func setRegion(
        _ region: MKCoordinateRegion,
        animated: Bool
    ) {
//        var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(user?.address?.geo?.lat ?? "51.507222")!, longitude: Double(user?.address?.geo?.lng ?? "-0.1275")!), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
        // Do any additional setup after loading the view.
    }
//
    
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
