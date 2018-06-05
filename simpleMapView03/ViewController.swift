//
//  ViewController.swift
//  simpleMapView03
//
//  Created by D7703_15 on 2018. 6. 5..
//  Copyright © 2018년 DIT_Food_Find. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //번개반점
        //35.167818, 129.070587
        //부산광역시 부산진구 양정동 418-282
        
        //위도, 경도
        let center = CLLocationCoordinate2D(latitude:
            35.166016, longitude:129.072564)
        
        let loc01 = CLLocationCoordinate2D(latitude:
            35.167818, longitude:129.070587)
        //반경(zoom in, out)
        let span = MKCoordinateSpan(latitudeDelta:0.01,longitudeDelta:0.01)
        //region 객체(center, span)
        let region = MKCoordinateRegion(center: center,span: span)
        //지도에 표시하기
        map.setRegion(region, animated: true)
        
        let pin01 = MKPointAnnotation()
        pin01.coordinate = loc01
        pin01.title = "번개반점"
        pin01.subtitle = "부산광역시 부산진구 양정동 418-282"
        map.addAnnotation(pin01)
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "동의과학대"
        pin02.subtitle = "부산광역시 부산진구 양정동 429-19"
        map.addAnnotation(pin02)
        
        ///geocoding
        let addr = "부산광역시 부산진구 양정1동 350-1"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addr) {
            
            (placemarks: [CLPlacemark]?, error: Error?) ->Void in
            if let error = error {
                print(error)
                return
            }else {
                print("nil 발생")
            }
            if let placemarks = placemarks {
             let placemark = placemarks[0]
                print(placemark.location!)
                print(placemark.name!)
                print(placemark.postalCode!)
                print(placemark.country!)
            let loc02 = placemark.location?.coordinate
            let pin03 = MKPointAnnotation()
            pin03.coordinate = loc02!
            pin03.title = "토마토 도시락"
            pin03.subtitle = addr
            self.map.addAnnotation(pin03)
                
            }else {
                print("nil 발생")
            }
        }
    }
}

