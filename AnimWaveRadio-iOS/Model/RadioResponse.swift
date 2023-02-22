//
//  RadioResponse.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/21.
//

import Foundation

struct RadioResponse: Codable {
    let location: String?
    let radios: [RadioData]?
}

