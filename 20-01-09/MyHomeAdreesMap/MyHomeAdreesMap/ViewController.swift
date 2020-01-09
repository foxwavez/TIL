//
//  ViewController.swift
//  MyHomeAdreesMap
//
//  Created by Hailey Lee on 2020/01/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
//        let center = mapView.centerCoordinate
        let myHome = MKPointAnnotation()
        myHome.title = "우리집"
        myHome.subtitle = "my sweet home"
        myHome.coordinate = CLLocationCoordinate2DMake(37.53691740, 127.07781270)
        mapView.addAnnotation(myHome)
        
        var point1 = myHome.coordinate; point1.latitude += 0.02
        var point2 = myHome.coordinate; point2.longitude += 0.04;   point2.latitude -= 0.015
        var point3 = myHome.coordinate; point3.longitude -= 0.04;  point3.latitude += 0.015
//        var point4 = myHome.coordinate; point4.longitude += 0.045;  point4.latitude += 0.04
//        var point5 = myHome.coordinate; point5.longitude -= 0.04;   point5.latitude -= 0.015
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point1]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
        
        geocodeAddressString("대한민국 서울특별시 광진구 자양동 798-4")
    }
    
    func geocodeAddressString(_ addressString: String) {
        print("\n---------- [ 주소 -> 위경도 ] ----------")
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            print(place)
            
            // 위경도값 가져오기
            print(place.location?.coordinate)
        }
    }

}


    
    
// MARK: = MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    // 추가된 overlay가 들어온다
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let circle = overlay as? MKCircle {
            let renderer = MKCircleRenderer(circle: circle)
            renderer.strokeColor = .blue
            renderer.lineWidth = 2
            return renderer
        }
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .red
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}

