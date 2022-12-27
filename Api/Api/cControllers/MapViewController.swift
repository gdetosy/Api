//
//  MapViewController.swift
//  Api
//
//  Created by tosy on 26.12.22.
//

import MapKit
import UIKit

final class MapViewController: UIViewController {
    var user: User?
   
    
    @IBOutlet var map: MKMapView!
   
     

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      coordinate()
        // Do any additional setup after loading the view.
    }
//
   private func coordinate() {
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(user?.address?.geo?.lat ?? "51.507222")!, longitude: Double(user?.address?.geo?.lng ?? "-0.1275")!), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
        
    }
}
