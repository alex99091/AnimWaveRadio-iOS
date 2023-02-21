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
    var timer = Timer()
    let audioPlayer = AVPlayer()
    var locationManger = CLLocationManager()
    var frequencyValue: Double = 0.0
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //findLocation()
        setUpCircularSliderIcon()
        setUpRadioRange()
        
        loadingAnimeView()
    }
    
    // loading Animation
    // 각각의 뷰를 시간에 맞추어 변하게하는 뷰
    func loadingAnimeView(){
        // minWidth ~ MaxWidth로 Variation
        let circleMinWidth: CGFloat = 5.0
        let circleMaxWidth: CGFloat = 25.0
        // starting (x,y)
        let startX = animeView.frame.width / 2
        let startY = animeView.frame.height / 2
        let loadingView = UIView()
        animeView.addSubview(loadingView)
        
        // (x,y 좌표 변화값)
        var i: Int = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            
            let changeX: Double = sin( (Double(i) * 15) * M_PI / 180 )
            let changeY: Double = cos( (Double(i) * 15) * M_PI / 180 )
            let currentWidthAndHeight = circleMinWidth + (circleMaxWidth - circleMinWidth) * CGFloat(i) / 24
            let radius = self.animeView.frame.width / 4
            
            loadingView.frame = CGRect(x: startX + CGFloat(changeX) * radius - currentWidthAndHeight,
                                       y: startY - CGFloat(changeY) * radius - currentWidthAndHeight,
                                       width: currentWidthAndHeight,
                                       height: currentWidthAndHeight)
            loadingView.layer.cornerRadius = currentWidthAndHeight / 2
            loadingView.layer.borderWidth = currentWidthAndHeight / 24
            loadingView.layer.borderColor = UIColor.yellow.cgColor
            loadingView.backgroundColor = UIColor.red
            
            i += 1
            if i > 24 && i <= 48{
                
                timer.invalidate()
            }
        })
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

