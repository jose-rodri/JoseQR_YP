//
//  MapViewController.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 22/11/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapaView: MKMapView!
    
    var presenter: MapViewToPresenterProtocol?
    var data: UserResult? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        
    }
    
    private func setupMap() {
        configureShadow(view: view, image: nil, cornerRadius: 65.0 , map: mapaView)
        guard let resultMap = data else { return  }
        configureCellMap(user: resultMap )
    }
    
    func  configureShadow(view: UIView , image: UIImageView? , cornerRadius: CGFloat = 40 , map: MKMapView?){
        view.layer.cornerRadius = 8.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.cornerRadius = 8.0
        view.layer.shadowOpacity = 1.6
        image?.layer.cornerRadius = cornerRadius
        image?.layer.borderColor = UIColor.systemBlue.cgColor
        image?.layer.borderWidth = 4
        map?.layer.cornerRadius = 16.0
    }
    
    
    func configureCellMap(user: UserResult){
        
        guard let latitud =  user.location?.coordinates?.latitude,
              let longitud = user.location?.coordinates?.longitude,
              let city = user.location?.city,
              let state = user.location?.state,
              let name = user.name?.first
        else {
            return
        }
        
        if let lat = Double(latitud) , let lon = Double(longitud) {
            let location = CLLocationCoordinate2DMake(lat, lon)
            loadMap(location: location, name: name, city: city, state: state)
        }
        
    }
    
    
    func loadMap(location: CLLocationCoordinate2D, name: String, city: String, state: String){
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapaView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(name) es de : \(city.capitalized) en \(state.capitalized)"
        annotation.subtitle = " \(state.capitalized)"
        mapaView.addAnnotation(annotation)
        
        let mapCamara = MKMapCamera(lookingAtCenter: location, fromDistance: 1000000 , pitch: 65, heading: 0)
        mapaView.setCamera(mapCamara, animated: true)
        
    }
    
}

extension MapViewController:  MapPresenterToViewProtocol {
    
}
