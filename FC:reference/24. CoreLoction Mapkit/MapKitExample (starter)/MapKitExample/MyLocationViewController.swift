//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    self.mapView.showsUserLocation = true //현재 위치를 파란 점으로 보여준다
    self.checkAuthorizationStatus()
  }
  
  
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse:
        fallthrough
    case .authorizedAlways:
        startUpdatingLocation()
    @unknown default: break
         // 나중에 어떤 상태가 추가 될지도 모르는 상황을 대비
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedWhenInUse || status == .authorizedAlways else { return }
    guard CLLocationManager.locationServicesEnabled() else { return }
//    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//    locationManager.distanceFilter = 10.0
    locationManager.startUpdatingLocation()
  }
  
  // 내가 현재 동서남북 중에 어느 방향으로 바라보고 있는 지 확인할 수 있는 (heading) 나침반 처럼
  @IBAction func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}

// MARK: - CLLoctionManagerDelegate

extension MyLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("UnAuthorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // location이 있어야 호출되므로 반드시 하나는 가지고 있음
        let current = locations.last!
        let coordinate = current.coordinate
        
        // locations에 이전 값들까지 다 포함되어 있을 수도 있음
        // current location에 찍힌 값이 10초 이내일 때만 수행하도록 함.
        // 즉, 캐시된 정보가 오래된 것들은 무시하고 최근 10초 이내 것들만 사용하도록
        // 앱을 껏다 키거나 다른 화면으로 갔다오거나 하면 이전에 얻었던 location 정보들이
        // 함께 location에 담겨서 들어올 수 있는데, 그 정보들이 너무 오래된 정보면 현재 정보인 것처럼 보여지면 안되니까
        // 최근 10초 이내에 들어온 정보만 사용하는 것
        if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
           
            // latitude(위도), longitude(경도) 숫자가 클 수록 지도가 zoom in 작을 수록 zoom out 되어서 더 넓게 보임
             // span 단위는 1도 (경도 1도는 약 111킬로미터)
            let span = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            
            // MapView가 설정한 region(지역, 리전) 중심으로 zoom in 되어 나타남
            mapView.setRegion(region, animated: true)
            addAnnotaion(location: current)
        }
    }
    
    // 이동한 위치에 Marking 내가 이동한 위치를 핀 꽂아서 보여준다
    func addAnnotaion(location: CLLocation) {
        let annotaion = MKPointAnnotation()
        annotaion.title = "MyLocatioan"
        annotaion.coordinate = location.coordinate
        mapView.addAnnotation(annotaion)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("trueHeading :", newHeading.trueHeading) // 진북 변하지 않는
        print("magnetHeading :", newHeading.magneticHeading) // 지북, 조금씩 해마다 변함
        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
        
    }
}
