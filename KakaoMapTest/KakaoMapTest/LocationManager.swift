//
//  LocationManager.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/17/24.
//

import Foundation
import CoreLocation
import KakaoMapsSDK

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.566691, longitude: 126.978365)
    var locationManager: CLLocationManager
    var locationServiceAuthorized: CLAuthorizationStatus
   
    override init() {
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        locationServiceAuthorized = CLAuthorizationStatus.notDetermined
        super.init()
        locationManager.delegate = self
        checkLocationAuthorization()
    }
    
    // MARK: 위치 권한 함수
     func checkLocationAuthorization() {
         switch CLLocationManager.authorizationStatus() {
         case .notDetermined:
             locationManager.requestWhenInUseAuthorization()
         case .denied, .restricted:
             // 위치 권한이 거부되거나 제한됨
             print("Location access denied or restricted")
         case .authorizedWhenInUse:
             locationManager.startUpdatingLocation()
         case .authorizedAlways:
             locationManager.startUpdatingLocation()
         @unknown default:
             break
         }
     }
    
    func startUpdateLocation() {
        if locationServiceAuthorized != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        else {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }
    
    func stopUpdateLocation() {
        locationManager.stopUpdatingHeading()
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationServiceAuthorized = status
        if locationServiceAuthorized == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }
    
    // MARK: 위치 업데이트 함수(userLocation)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        let newCoordinate = newLocation.coordinate
        if self.userLocation.longitude != newCoordinate.longitude || self.userLocation.latitude != newCoordinate.latitude {
            print("현재 위치 변경:", newLocation.coordinate)
            self.userLocation = newCoordinate
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "moveCurrentLocation"), object: self.userLocation)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
    
    // 디버깅: 임시로 현재 위치 변경
    func setTemporaryLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let mockLocation = CLLocation(latitude: latitude, longitude: longitude)
        locationManager.delegate?.locationManager?(locationManager, didUpdateLocations: [mockLocation])
    }
    
}
