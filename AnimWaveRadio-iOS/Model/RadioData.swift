//
//  RadioData.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/21.
//

import Foundation

class RadioData {
    // 입력값 (Request Parameter)
    var key: String?
    var searchId: String?
    var lou: Double? // 경도
    var ltd: Double? // 위도
    var jusocode: String? // 법정동코드
    
    var jusocodeDictionary: [String: String] =
    ["강원도": "4200000000", "경기도": "4100000000", "경상남도": "4800000000", "경상북도": "4700000000",
     "광주광역시": "2900000000", "대구광역시": "2700000000", "대전광역시": "3000000000", "부산광역시": "2600000000",
     "서울특별시": "1100000000", "세종특별자치시": "3611000000", "울산광역시": "3100000000", "인천광역시": "2800000000",
     "전라남도": "4600000000", "전라북도": "4500000000", "제주특별자치도": "5000000000",
     "충청남도": "4400000000", "충청북도": "4300000000"]
}