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
        
        // 위도(latitude)는 위로 가려면 + 아래로 가려면 - 값을 넣으면 된다
        // 경도(longtitude)는 오른쪽으로 가려면 + 왼쪽으로 가려면 - 값을 넣으면 된다.
        var point1 = myHome.coordinate; point1.latitude += 0.06
        // pin(annptation)된 집주소 위치에서 삼각형의 정가운데 위도 위로 0.06 만큼 거리에 점을 찍는다
        var point2 = myHome.coordinate; point2.longitude -= 0.065;   point2.latitude -= 0.04
        // 집주소 위치에서 위도 아래로 -0.065 만큼, 경도  -0.04. 만큼 거리(여기서 말하는 거리는 대각선)에 점을 찍는다.
        // point1점과 point2점이 연결되서 빨간 선으로 나오는 것
        var point3 = myHome.coordinate; point3.longitude += 0.065;  point3.latitude -= 0.04
        // point1점과 point2점, point3. 3개의 점이 빨간 선으로 연결되서 삼각형이 나오게 된다
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

