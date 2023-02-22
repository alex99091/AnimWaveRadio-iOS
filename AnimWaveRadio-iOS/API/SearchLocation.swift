//
//  SearchLocation.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/22.
//

import Foundation

class SearchLocation {
    
    // 지도 API역할을 하는 가상의 getLocation function
    /// 실제 위도,경도로 주소를 가져오기 위해서 구글맵 또는 naver맵 사용하여 사용료 지불해야함
    static func getLocation(_ latitude: Double, _ longitude: Double) -> String {
        if latitude < 37.0 && latitude >= 36.0 && longitude > -122 {
            return "Busan"
        }
        return "Seoul"
    }
    
}
