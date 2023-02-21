//
//  LocationManager.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/21.
//

import UIKit
import CoreLocation

extension RadioViewController: CLLocationManagerDelegate {
    
    func findLocation() {
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManger.startUpdatingLocation() //위치 정보 받아오기 시작
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
                self.locationManger.stopUpdatingLocation()
            }) // 5초뒤 종료
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        if let location = locations.first {
            print("위도: \(location.coordinate.latitude)")
            print("경도: \(location.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
