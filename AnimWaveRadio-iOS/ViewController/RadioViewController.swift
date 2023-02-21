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
    var playStatus: Bool = false
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingAnimeView()
        //findLocation()
        setUpCircularSliderIcon()
        setUpRadioRange()
        
    }
    
    // loading Animation
    // 각각의 뷰를 애니매이션 동작으로 로딩하는 함수
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
        let inCirlcelineView = UIView()
        let inCirlcelineView2 = UIView()
        let inCirlcelineView3 = UIView()
        let inCirlcelineView4 = UIView()
        let topRectangleView = UIView()
        let longRectangleView = UIView()
        
        var startX: Double = 0
        var startY: Double = 0
        var count: CGFloat = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { timer in
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
            if count > 36 && count < 45 {
                circleView.frame = CGRect(x: maxWidth * 0.52,
                                          y: maxHeight * 0.416,
                                          width: maxWidth * 0.33/9 * (count - 35),
                                          height: maxHeight * 0.416/9 * (count - 35))
                circleView.layer.cornerRadius = (maxWidth * 0.33/9 * (count - 35)) / 2
                circleView.layer.borderWidth = 5.0
                circleView.layer.borderColor = UIColor.black.cgColor
            }
            if count == 45 {
                circleView.frame = CGRect(x: maxWidth * 0.52,
                                          y: maxHeight * 0.416,
                                          width: maxWidth * 0.33,
                                          height: maxHeight * 0.416)
                circleView.layer.cornerRadius = maxWidth * 0.33 / 2
            }
            self.animeView.addSubview(inCirlcelineView)
            if count == 46 {
                inCirlcelineView.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                y: maxHeight * 0.485,
                                                width: maxWidth * 0.21,
                                                height: maxHeight * 0.049)
                inCirlcelineView.layer.cornerRadius = 10.0
                inCirlcelineView.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inCirlcelineView2)
            if count == 47 {
                inCirlcelineView2.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                 y: maxHeight * 0.559,
                                                 width: maxWidth * 0.21,
                                                 height: maxHeight * 0.049)
                inCirlcelineView2.layer.cornerRadius = 10.0
                inCirlcelineView2.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inCirlcelineView3)
            if count == 48 {
                inCirlcelineView3.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                 y: maxHeight * 0.633,
                                                 width: maxWidth * 0.21,
                                                 height: maxHeight * 0.049)
                inCirlcelineView3.layer.cornerRadius = 10.0
                inCirlcelineView3.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(inCirlcelineView4)
            if count == 49 {
                inCirlcelineView4.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                 y: maxHeight * 0.707,
                                                 width: maxWidth * 0.21,
                                                 height: maxHeight * 0.049)
                inCirlcelineView4.layer.cornerRadius = 10.0
                inCirlcelineView4.layer.borderWidth = 3.0
            }
            self.animeView.addSubview(topRectangleView)
            if count > 49 && count < 55 {
                topRectangleView.frame = CGRect(x: maxWidth * 0.06,
                                                y: maxHeight * 0.386 - 6.0 * (count - 49),
                                                width: 10.0 * (count - 49),
                                                height: 6.0 * (count - 49))
                topRectangleView.layer.cornerRadius = 12.5
                topRectangleView.layer.borderWidth = 5.0
                topRectangleView.backgroundColor = UIColor.white
            }
            self.animeView.addSubview(longRectangleView)
            if count >= 55 && count < 60 {
                longRectangleView.frame = CGRect(x: maxWidth * 0.06 + 15,
                                                 y: maxHeight * 0.386 - 27.5 - 18.0 * (count - 54),
                                                 width: 3.0 * (count - 54),
                                                 height: 18.0 * (count - 54))
                longRectangleView.layer.cornerRadius = 6.25
                longRectangleView.layer.borderWidth = 5.0
                longRectangleView.backgroundColor = UIColor.white
            }
            count += 1
            if count == 60 {
                timer.invalidate()
            }
        })
    }
    
    // PlayButton이 터치되면 AnimeView를 동작하는 함수
    func radioPlayStart() {
        if playStatus == true {
            print("radioPlay Activated")
            var count = 0
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { timer in
                var startX = self.animeView.frame.width * 0.06 + 40
                var startY = (self.animeView.frame.height * 0.416) / 2
                for i in 0...7 {
                    let waveHalfCircle = UIView()
                    let waveRectangle = UIView()
                    let width = CGFloat(10.0 * Double(i))
                    let height = CGFloat(10.0 * Double(i))
                    startX += width
                    waveHalfCircle.frame = CGRect(x: startX ,
                                                  y: startY - height / 2,
                                                  width: width,
                                                  height: height)
                    waveHalfCircle.layer.cornerRadius = width / 2
                    waveHalfCircle.layer.borderWidth = 5.0
                    waveHalfCircle.backgroundColor = UIColor.white
                    self.animeView.addSubview(waveHalfCircle)
                    waveRectangle.frame = CGRect(x: startX,
                                                 y: startY - height / 2,
                                                 width: width / 2,
                                                 height: height)
                    waveRectangle.backgroundColor = UIColor.white
                    self.animeView.addSubview(waveRectangle)
                }
                count += 1
                count %= 7
                print(count)
            })
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
    
    // IBAction
    @IBAction func playButtonTouched(_ sender: Any) {
        print("play Button Touched")
        playStatus = true
        radioPlayStart()
        
    }
    
    
}

