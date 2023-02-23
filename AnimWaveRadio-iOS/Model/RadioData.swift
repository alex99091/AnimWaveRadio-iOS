//
//  RadioData.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/22.
//

import Foundation

struct RadioData: Codable, Hashable {
    var frequency: String?
    var title: String?
    var streamingUrl: String?
}
