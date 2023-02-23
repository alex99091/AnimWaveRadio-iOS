//
//  RadioVC+AnimeView.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/23.
//

import UIKit

extension RadioViewController {

    // 각각의 뷰를 애니매이션 동작으로 로딩하는 함수
    func playAnimationView(_ animeView: UIView) {
        let maxWidth = animeView.frame.width
        let maxHeight = animeView.frame.height

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

        var startX: CGFloat = 0
        var startY: CGFloat = 0
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
                radioRectangleView.layer.borderColor = UIColor(rgb:0xD4B781).cgColor
                radioRectangleView.backgroundColor = UIColor(rgb: 0x1A0D0A)
            }
            self.animeView.addSubview(subSquareView)
            if count > 10 && count <= 15 {
                subSquareView.frame = CGRect(x: maxWidth * 0.06 + maxWidth * 0.36 / 5 * (count - 10),
                                             y: maxHeight * 0.416,
                                             width: 25.0,
                                             height: 25.0)
                subSquareView.layer.cornerRadius = 12.5
                subSquareView.layer.borderWidth = 5.0
                subSquareView.layer.borderColor = UIColor(rgb:0xD4B781).cgColor
                subSquareView.backgroundColor = UIColor(rgb:0x331D18)
                
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
                inSquarelineView.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inSquarelineView.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inSquarelineView2)
            if count == 33 {
                inSquarelineView2.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                 y: maxHeight * (0.475 + 0.069),
                                                 width: maxWidth * 0.3,
                                                 height: 10.0)
                inSquarelineView2.layer.cornerRadius = 5.0
                inSquarelineView2.layer.borderWidth = 3.0
                inSquarelineView2.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inSquarelineView2.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inSquarelineView3)
            if count == 34 {
                inSquarelineView3.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                 y: maxHeight * (0.544 + 0.069),
                                                 width: maxWidth * 0.3,
                                                 height: 10.0)
                inSquarelineView3.layer.cornerRadius = 5.0
                inSquarelineView3.layer.borderWidth = 3.0
                inSquarelineView3.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inSquarelineView3.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inSquarelineView4)
            if count == 35 {
                inSquarelineView4.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                 y: maxHeight * (0.613 + 0.069),
                                                 width: maxWidth * 0.3,
                                                 height: 10.0)
                inSquarelineView4.layer.cornerRadius = 5.0
                inSquarelineView4.layer.borderWidth = 3.0
                inSquarelineView4.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inSquarelineView4.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inSquarelineView5)
            if count == 36 {
                inSquarelineView5.frame = CGRect(x: maxWidth * (0.06 + 0.058),
                                                 y: maxHeight * (0.682 + 0.069),
                                                 width: maxWidth * 0.3,
                                                 height: 10.0)
                inSquarelineView5.layer.cornerRadius = 5.0
                inSquarelineView5.layer.borderWidth = 3.0
                inSquarelineView5.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inSquarelineView5.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(circleView)
            if count > 36 && count < 45 {
                circleView.frame = CGRect(x: maxWidth * 0.52,
                                          y: maxHeight * 0.416,
                                          width: maxWidth * 0.33/9 * (count - 35),
                                          height: maxHeight * 0.416/9 * (count - 35))
                circleView.layer.cornerRadius = (maxWidth * 0.33/9 * (count - 35)) / 2
                circleView.layer.borderWidth = 5.0
                circleView.layer.borderColor = UIColor(rgb:0xD4B781).cgColor
                circleView.backgroundColor = UIColor(rgb:0x331D18)
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
                inCirlcelineView.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inCirlcelineView.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inCirlcelineView2)
            if count == 47 {
                inCirlcelineView2.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                 y: maxHeight * 0.559,
                                                 width: maxWidth * 0.21,
                                                 height: maxHeight * 0.049)
                inCirlcelineView2.layer.cornerRadius = 10.0
                inCirlcelineView2.layer.borderWidth = 3.0
                inCirlcelineView2.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inCirlcelineView2.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inCirlcelineView3)
            if count == 48 {
                inCirlcelineView3.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                 y: maxHeight * 0.633,
                                                 width: maxWidth * 0.21,
                                                 height: maxHeight * 0.049)
                inCirlcelineView3.layer.cornerRadius = 10.0
                inCirlcelineView3.layer.borderWidth = 3.0
                inCirlcelineView3.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inCirlcelineView3.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(inCirlcelineView4)
            if count == 49 {
                inCirlcelineView4.frame = CGRect(x: maxWidth * (0.52 + 0.06),
                                                 y: maxHeight * 0.707,
                                                 width: maxWidth * 0.21,
                                                 height: maxHeight * 0.049)
                inCirlcelineView4.layer.cornerRadius = 10.0
                inCirlcelineView4.layer.borderWidth = 3.0
                inCirlcelineView4.layer.borderColor = UIColor(rgb: 0xD09E5E).cgColor
                inCirlcelineView4.backgroundColor = UIColor(rgb: 0xD5B57E)
            }
            self.animeView.addSubview(topRectangleView)
            if count > 49 && count < 55 {
                topRectangleView.frame = CGRect(x: maxWidth * 0.06,
                                                y: maxHeight * 0.386 - 6.0 * (count - 49),
                                                width: 10.0 * (count - 49),
                                                height: 6.0 * (count - 49))
                topRectangleView.layer.cornerRadius = 12.5
                topRectangleView.layer.borderWidth = 5.0
                topRectangleView.layer.borderColor = UIColor(rgb:0xD4B781).cgColor
                topRectangleView.backgroundColor = UIColor(rgb: 0x82635A)
            }
            self.animeView.addSubview(longRectangleView)
            if count >= 55 && count < 60 {
                longRectangleView.frame = CGRect(x: maxWidth * 0.06 + 15,
                                                 y: maxHeight * 0.386 - 27.5 - 18.0 * (count - 54),
                                                 width: 3.0 * (count - 54),
                                                 height: 18.0 * (count - 54))
                longRectangleView.layer.cornerRadius = 6.25
                longRectangleView.layer.borderWidth = 5.0
                longRectangleView.layer.borderColor = UIColor(rgb:0xD4B781).cgColor
                longRectangleView.backgroundColor = UIColor(rgb:0xBB9B8D)
            }
            count += 1
            if count == 60 {
                timer.invalidate()
            }
        })
    }
    
    // PlayButton이 터치되면 AnimeView를 동작하는 함수
    func playWaveAnimation() {
        timer = Timer()
        if animationStatus == true {
            let startX = animeView.frame.width * 0.06 + 40
            let endX = animeView.frame.width - animeView.frame.height * 0.208
            let startY: CGFloat = 40.0
            let oldFrame = CGRect(x: startX, y: startY, width: 30, height: 30)
            let newFrame = CGRect(x: endX, y: animeView.frame.height * 0.104, width: animeView.frame.height * 0.208, height: animeView.frame.height * 0.208)
            waveImageView.frame = oldFrame
            waveImageView.image = UIImage(systemName: "dot.radiowaves.forward")
            waveImageView.tintColor = .white
            animeView.addSubview(waveImageView)
            var count = 0
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
                count %= 8
                if self.animationStatus == false {
                    timer.invalidate()
                    print("waveAnime DeActivated")
                }
                if count == 0 {
                    self.waveImageView.tintColor = UIColor(rgb:0xfada25)
                } else if count == 1 {
                    self.waveImageView.tintColor = UIColor(rgb:0xf3b196)
                } else if count == 2 {
                    self.waveImageView.tintColor = UIColor(rgb:0x047cc2)
                } else if count == 3 {
                    self.waveImageView.tintColor = UIColor(rgb:0x5bb074)
                } else if count == 4 {
                    self.waveImageView.tintColor = UIColor(rgb:0xc6accc)
                } else if count == 5 {
                    self.waveImageView.tintColor = UIColor(rgb:0x664230)
                } else if count == 6 {
                    self.waveImageView.tintColor = UIColor(rgb:0x3464fc)
                } else {
                    self.waveImageView.tintColor = UIColor(rgb:0xcf8bfb)
                }
                UIView.animate(withDuration: 2.0, animations: {
                    self.waveImageView.frame = newFrame
                    
                }, completion: { finished in
                    UIView.animate(withDuration: 0.0, animations: {
                        self.waveImageView.frame = oldFrame
                    })
                })
                count += 1
            })
        } else if playButton.isSelected == false {
            timer?.invalidate()
            timer = nil
            print("waveAnime DeActivated")
        }
    }

    // 광고 처럼 지나가는 information Label 함수
    func informationLabelAnimate() {
        let name: String = frequencyValueLabel.text!
        let frequency = String(format: "%.1f"+"MHz", frequencyValue)
        var musicName: String = ""
        for radioData in radioList {
            if radioData.title!.uppercased() == name {
                musicName = radioData.streamingUrl!
            }
        }
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let maxWidth = informationLabel.frame.width
        let infoString = " 현재 \(frequency)에서 \(name) 라디오 방송을 청취중입니다. 지금 듣고 있는 음악은 \(musicName)입니다. 현재 시각은 \(hour)시 \(minutes)분 입니다. "
        
        let splittedString = ArraySlice(infoString)
        var showTextStack = [String]()
        var willShowTextStack = [String]()
        
        var sum = 0
        
        for char in splittedString {
            if char == " " {
                sum += 3
            } else {
                sum += 14
            }
            if sum <= Int(maxWidth) {
                showTextStack.append(String(char))
            } else {
                willShowTextStack.append(String(char))
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            var currentText = showTextStack.reduce("", +)
            
            self.informationLabel.text = currentText
            self.informationLabel.isHidden = false
            willShowTextStack.append(showTextStack.removeFirst())
            showTextStack.append(willShowTextStack.removeFirst())

            if self.playButton.isSelected == false {
                timer.invalidate()
            }
        })
        
        
        
    }
    
}
