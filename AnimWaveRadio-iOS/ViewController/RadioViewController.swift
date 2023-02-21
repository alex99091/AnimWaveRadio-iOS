//
//  RadioViewController.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/19.
//

import UIKit
import HGCircularSlider
import AVFoundation
import CoreLocation

class RadioViewController: UIViewController {
    
    // Outlet
    @IBOutlet weak var radioNameLabel: UILabel!
    @IBOutlet weak var frequencyValueLabel: UILabel!
    @IBOutlet weak var frequencySlider: CircularSlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var animeView: UIView!
    
    // Property
    let audioPlayer = AVPlayer()
    var locationManger = CLLocationManager()
    var frequencyValue: Double = 0.0
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimeView()
        //findLocation()
        setUpCircularSliderIcon()
        setUpRadioRange()
    }
    
    // animation View
    func setAnimeView(){
        var viewArray = [[UIView]]()
        for i in 0..<18 {
            var horizon = [UIView]()
            for j in 0..<18 {
                var subView = UIView()
                horizon.append(subView)
                var subViewWidth = animeView.frame.width/20
                subView.frame = CGRect(x: subViewWidth * CGFloat(i), y: subViewWidth * CGFloat(j), width: subViewWidth*0.85, height: subViewWidth*0.85)
                subView.layer.cornerRadius = subViewWidth/2
                subView.backgroundColor = .blue
            }
            viewArray.append(horizon)
        }
        for i in 0..<18 {
            for j in 0..<18 {
                animeView.addSubview(viewArray[i][j])
            }
        }
    }
    
    
    
    
    // Method
    func setUpCircularSliderIcon(){
        frequencySlider.endThumbImage = UIImage(named: "sliderIcon")
    }
    
    func setUpRadioRange(){
        frequencySlider.minimumValue = 0
        frequencySlider.maximumValue = 100
        frequencySlider.endPointValue = 0
        frequencySlider.addTarget(self, action: #selector(updateFrequencyValue), for: .valueChanged)
    }
    
    @objc func updateFrequencyValue() {
        frequencyValue = frequencySlider.endPointValue
        frequencyValue = frequencyValue == 0 ? 100 : frequencyValue
        valueLabel.text = String(format: "%.1f"+"MHz", frequencyValue)
    }
    
    
    
}

