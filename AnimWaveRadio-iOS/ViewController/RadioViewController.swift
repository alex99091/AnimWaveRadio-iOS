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
    func loadingAnimeView() {
        let maxWidth = self.animeView.frame.width
        let maxHeight = self.animeView.frame.height
        
        let radioRectangleView = UIView()
        let subSquareView = UIView()
        let inSquarelineView = UIView()
        let inSquarelineView2 = UIView()
        let inSquarelineView3 = UIView()
        let inSquarelineView4 = UIView()
        let inSquarelineView5 = UIView()
        let circleView = UIView()
        
        var startX: Double = 0
        var startY: Double = 0
        var count: CGFloat = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            self.animeView.addSubview(radioRectangleView)
            if count <= 10 {
                startX = maxWidth * (0.5 - 0.09/2)
                startY = maxHeight * (0.65 - 0.05/2)
                radioRectangleView.frame = CGRect(x: startX - maxWidth * 0.09 * count/2,
                                                  y: startY - maxHeight * 0.05 * count/2,
                                                  width: maxWidth * 0.09 * count,
                                                  height: maxHeight * 0.05 * count)
                radioRectangleView.layer.borderWidth = 5.0
                radioRectangleView.layer.cornerRadius = 15.0
                radioRectangleView.layer.borderColor = UIColor.black.cgColor
                radioRectangleView.backgroundColor = UIColor.white
            }
            self.animeView.addSubview(subSquareView)
            if count > 10 && count <= 15 {
                subSquareView.frame = CGRect(x: maxWidth * 0.06 + maxWidth * 0.36 / 5 * (count - 10),
                                             y: maxHeight * 0.416,
                                             width: 25.0,
                                             height: 25.0)
                subSquareView.layer.cornerRadius = 12.5
                subSquareView.layer.borderWidth = 5.0
            }
            if count > 15 && count <= 20 {
                subSquareView.frame = CGRect(x: maxWidth * 0.42,
                                             y: maxHeight * 0.416 + maxWidth * 0.36 / 5 * (count - 15),
                                             width: 25.0,
                                             height: 25.0)
                subSquareView.layer.cornerRadius = 12.5
                subSquareView.layer.borderWidth = 5.0
            }
            if count > 20 && count <= 25 {
                subSquareView.frame = CGRect(x: maxWidth * 0.42 - maxWidth * 0.36 / 5 * (count - 20),
                                             y: maxHeight * 0.776,
                                             width: 25.0,
                                             height: 25.0)
                subSquareView.layer.cornerRadius = 12.5
                subSquareView.layer.borderWidth = 5.0
            }
            if count > 25 && count <= 30 {
                subSquareView.frame = CGRect(x: maxWidth * 0.06,
                                             y: maxHeight * 0.776 - maxWidth * 0.36 / 5 * (count - 25),
                                             width: 25.0,
                                             height: 25.0)
                subSquareView.layer.cornerRadius = 12.5
                subSquareView.layer.borderWidth = 5.0
            }
            self.animeView.addSubview(subSquareView)
            if count == 31 {
                subSquareView.frame = CGRect(x: maxWidth * 0.06,
                                             y: maxHeight * 0.416,
                                             width: maxWidth * 0.416,
                                             height: maxWidth * 0.416)
            }
            self.animeView.addSubview(inSquarelineView)
            if count == 32 {
                inSquarelineView.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                y: maxHeight * (0.416 + 0.059),
                                                width: maxWidth * 0.3,
                                                height: 10.0)
                inSquarelineView.layer.cornerRadius = 5.0
                inSquarelineView.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inSquarelineView2)
            if count == 33 {
                inSquarelineView2.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                y: maxHeight * (0.475 + 0.069),
                                                width: maxWidth * 0.3,
                                                height: 10.0)
                inSquarelineView2.layer.cornerRadius = 5.0
                inSquarelineView2.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inSquarelineView3)
            if count == 34 {
                inSquarelineView3.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                y: maxHeight * (0.544 + 0.069),
                                                width: maxWidth * 0.3,
                                                height: 10.0)
                inSquarelineView3.layer.cornerRadius = 5.0
                inSquarelineView3.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inSquarelineView4)
            if count == 35 {
                inSquarelineView4.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                y: maxHeight * (0.613 + 0.069),
                                                width: maxWidth * 0.3,
                                                height: 10.0)
                inSquarelineView4.layer.cornerRadius = 5.0
                inSquarelineView4.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inSquarelineView5)
            if count == 36 {
                inSquarelineView5.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                y: maxHeight * (0.682 + 0.069),
                                                width: maxWidth * 0.3,
                                                height: 10.0)
                inSquarelineView5.layer.cornerRadius = 5.0
                inSquarelineView5.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(circleView)
            if count > 36 && count <= 45 {
                circleView.frame = CGRect(x: maxWidth * 0.52,
                                          y: maxHeight * 0.416,
                                          width: maxWidth * 0.33,
                                          height: maxHeight * 0.416)
                circleView.layer.cornerRadius = maxWidth * 0.33 / 2
                circleView.layer.borderWidth = 5.0
                circleView.layer.borderColor = UIColor.black.cgColor
                circleView.backgroundColor = UIColor.white
            }
            
            
            count += 1
            if count == 45 {
                timer.invalidate()
            }
        })
    }
    
    
    
    
    func loadingAnimeView2(){
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
            loadingView.layer.borderWidth = 1.5
            loadingView.layer.borderColor = UIColor.black.cgColor
            loadingView.backgroundColor = UIColor.white
            
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

