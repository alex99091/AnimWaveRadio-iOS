//
//  LoadRadio.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/22.
//

import Foundation
import UIKit

class LoadRadio {
    
    func loadJSON() {
        let fileName: String = "RadioMockData"
        let extensionType = "json"
        guard let radioJsonURL = Bundle.main.path(forResource: fileName, ofType: extensionType)
                
        else { return }
        
        guard let jsonData = try? String(contentsOfFile: radioJsonURL).data(using: .utf8)
        else { return }
        let decoder = JSONDecoder()
        
        if let radioResponse = try? decoder.decode([RadioResponse].self, from: jsonData) {
            print("radioResponse: \(radioResponse)")
            for i in 0..<radioResponse.count {
                print("\(i): \(radioResponse[i])")
            }
        } else {
            print("decoding Error")
        }
    }
    
    func loadRadioListsByLocation(_ currentLocation: String) -> [RadioData]? {
        let fileName: String = "RadioMockData"
        let extensionType = "json"
        guard let radioJsonURL = Bundle.main.path(forResource: fileName, ofType: extensionType)
                
        else { return nil }
        
        guard let jsonData = try? String(contentsOfFile: radioJsonURL).data(using: .utf8)
        else { return nil }
        let decoder = JSONDecoder()
        
        if let radioResponse = try? decoder.decode([RadioResponse].self, from: jsonData) {
            for i in 0..<radioResponse.count {
                if radioResponse[i].location == currentLocation {
                    return radioResponse[i].radios
                }
            }
        } else {
            print("decoding Error")
        }
        return nil
    }
}
