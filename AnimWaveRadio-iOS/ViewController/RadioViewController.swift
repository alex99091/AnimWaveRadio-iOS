//
//  RadioViewController.swift
//  AnimWaveRadio-iOS
//
//  Created by BOONGKI KWAK on 2023/02/19.
//

import UIKit
import AVFoundation
import CoreLocation
import HGCircularSlider

class RadioViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var radioNameLabel: UILabel!
    @IBOutlet weak var frequencyValueLabel: UILabel!
    @IBOutlet weak var frequencySlider: CircularSlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var animeView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    // Property
    var timer: Timer?
    var waveImageView = UIImageView()
    var loadRadio = LoadRadio()
    var radioList = [RadioData]()
    var valueList = [Double]()
    var heartList = [RadioData: Bool]()
    var heartListUpdate = false
    var locationManger = CLLocationManager()
    var locationList = ["latitude": 0.0, "longitude": 0.0]
    var currentLocationName = ""
    var locationStatus = false
    var frequencyValue: Double = 0.0
    var animationStatus = false
    var audioPlayer: AVAudioPlayer!
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        findLocation()
        playAnimationView(animeView)
        changePlayButtonImage()
        setupLikeLists()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(locationStatus)
        self.getRadioLists()
        self.setUpCircularSlider()
        self.setUpHeartList()
        print(heartListUpdate)
        print("view will appear activated")
    }
    
    // Method
    // Location정보로 해당 위치의 이름을 찾는 함수
    func findLocationName() -> String {
        guard let lat = locationList["latitude"] else { return "" }
        guard let long = locationList["longitude"] else { return "" }
        let locationName = SearchLocation.getLocation(lat, long)
        return locationName
    }
    
    // 현재 위치에 해당하는 라디오 정보를 가져오는 함수
    func getRadioLists() {
        currentLocationName = findLocationName()
        radioList = loadRadio.loadRadioListsByLocation(currentLocationName) ?? []
    }
    
    // CircularSlider 정보 radio api 정보 업데이트하여 구성하는 함수
    func setUpCircularSlider(){
        frequencySlider.endThumbImage = UIImage(named: "sliderIcon")
        
        for radio in radioList {
            valueList.append(Double(radio.frequency!)!)
        }
        valueList.sort(by: <)
        
        frequencySlider.minimumValue = valueList.min()!
        frequencySlider.maximumValue = valueList.max()!
        frequencySlider.endPointValue = valueList.min()!
        frequencySlider.addTarget(self, action: #selector(updateFrequencyValue), for: .valueChanged)
    }
    
    @objc func updateFrequencyValue() {
        frequencyValue = frequencySlider.endPointValue
        frequencyValue = frequencyValue == valueList.min()! ? valueList.max()! : frequencyValue
        valueLabel.text = String(format: "%.1f"+"MHz", frequencyValue)
        playButton.isSelected = false
    }
    
    // playButton이 터치되면 playButton의 이미지가 변하는 함수
    func changePlayButtonImage() {
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .selected)
    }
    
    // heartButton이 터치되면 playButton의 이미지가 변하는 함수
    func changeHeartButtonImage() {
        var key = RadioData()
        
        for radio in radioList {
            if radio.title!.uppercased() == frequencyValueLabel.text {
                key = radio
            }
        }
        if heartList[key] == false {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    // heartList 정보 생성
    func setUpHeartList() {
        for radio in radioList {
            heartList.updateValue(false, forKey: radio)
        }
    }
    
    // 해당 주파수에 라디오가 없으면 가장 가까운 주파수로 frequencyValue를 fix하는 함수
    func fixFrequency() -> Double {
        var fixedFrequency: Double = 0
        var temp = valueList.max()! - valueList.min()!
        for value in valueList {
            if abs(value - frequencyValue) <= temp {
                temp = abs(value - frequencyValue)
                fixedFrequency = value
            }
        }
        frequencyValue = valueList.contains(frequencyValue) ? frequencyValue : fixedFrequency
        return frequencyValue
    }
    
    // 라디오의 현재 주파수에서 바로 전의 주파수로 움직이는 previousFrequency 함수
    func moveToPreviousFrequency() {
        if valueList.count == 0 { return }
        var currentValue = fixFrequency()
        frequencyValue = fixFrequency()
        var index = 0
        for i in 0..<valueList.count {
            if valueList[i] == currentValue { index = i }
        }
        if index >= 1 && index <= valueList.count - 1 {
            currentValue = valueList[index - 1]
        }
        frequencyValue = currentValue
        print("prevButtonTapped - frequencyValue = \(frequencyValue)")
        changeSliderValue(frequencyValue)
    }
    
    // 라디오의 현재 주파수에서 바로 전의 주파수로 움직이는 nextFrequency 함수
    func moveToNextFrequency() {
        if valueList.count == 0 { return }
        var currentValue = fixFrequency()
        var index = 0
        for i in 0..<valueList.count {
            if valueList[i] == currentValue { index = i }
        }
        if index >= 0 && index <= valueList.count - 2 {
            currentValue = valueList[index + 1]
        }
        frequencyValue = currentValue
        print("nextButtonTapped - frequencyValue = \(frequencyValue)")
        changeSliderValue(frequencyValue)
    }
    
    // sliderValue를 바뀐 주파수 값에 따라서 변경하는 함수
    func changeSliderValue(_ inputValue: Double) {
        // 1. 슬라이더의 값을 현재 주파수 값으로 바꾼다.
        frequencySlider.endPointValue = inputValue
        // 2. valuelabel의 text도 바꾼다.
        valueLabel.text = String(format: "%.1f"+"MHz", inputValue)
        // 3. frequencyValue를 슬라이더 값을 받아온다.
        frequencyValue = inputValue
    }
    
    // 현재 주파수값으로 radioData에서 streamingUrl을 찾아서 pathForResource의 파일명을 리턴하는 함수
    func getStreamingUrl(_ currentFrequencyValue: Double) -> String? {
        if radioList.count == 0 { return nil }
        for radio in radioList {
            if Double(radio.frequency!) == currentFrequencyValue {
                return radio.streamingUrl
            }
        }
        return nil
    }
    
    // 라디오 재생
    func streamRadio() {
        guard let fileName = getStreamingUrl(fixFrequency()) else { return }
        print(fileName)
        let extensionName = "m4a"
        // forResource: 파일 이름(확장자 제외) , withExtension: 확장자(mp3, wav 등) 입력
        guard let url = Bundle.main.url(forResource: fileName, withExtension: extensionName) else {
            return
        }
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 1.0
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    // 라디오 일시정지
    func pauseRadio() {
        audioPlayer?.pause()
    }
    // 라디오 정지
    func stopRadio() {
        audioPlayer?.stop()
    }
    
    // 플레이버튼이 눌리면 상단의 라디오 정보를 로드하는 함수
    func changeLabel() {
        radioNameLabel.text = String(format: "%.1f"+"MHz", frequencyValue)
        if radioList.count == 0 { return }
        var radioName = ""
        for radio in radioList {
            if Double(radio.frequency!) == frequencyValue {
                radioName = radio.title!
            }
        }
        frequencyValueLabel.text = radioName.uppercased()
    }
    
    // 좋아요를 누른 리스트 만들기
    func setupLikeLists() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 25)
        let imageIcon = UIImage(systemName: "heart.square.fill",
                                withConfiguration: configuration)?.withTintColor(.red, renderingMode: .alwaysOriginal)
        var menuItems = [UIAction]()
        for (key, value) in heartList {
            if value == true {
                let eachMenu = UIAction(title: key.title!.uppercased(),
                                        subtitle: String(format: "%.1f"+"MHz", Double(key.frequency!)!),
                                        image: imageIcon,
                                        handler: { _ in  self.changeByHeartSelected(key.title!) })
                menuItems.append(eachMenu)
            }
        }
        print("menuItem.count - \(menuItems.count)")
        let menu = UIMenu(title: "Like Lists", options: [], children: menuItems)
        print("menu - \(menu)")
        moreButton.menu = menu
    }
    
    // 왼쪽 moreButton에서 좋아요를 누르면 해당 정보로 바뀌는 함수
    func changeByHeartSelected(_ selectedKey: String) {
        for radio in radioList {
            if radio.title! == selectedKey {
                changeSliderValue(Double(radio.frequency!)!)
                changeLabel()
                reloadInputViews()
            }
        }
    }
    
    // IBAction
    // 좋아요 저장한 목록들이 터치되었을 때
    @IBAction func perferredListTapped(_ sender: Any) {
        print("preferredListTouched - start")
        setupLikeLists()
        reloadInputViews()
        print("preferredListTouched - done")
    }
    
    
    // 상단에 하트버튼이 눌리면 해당 정보를 업데이트
    @IBAction func hearButtonTapped(_ sender: Any) {
        var key = RadioData()
        
        for radio in radioList {
            if radio.title!.uppercased() == frequencyValueLabel.text {
                key = radio
                if heartList[key] == false {
                    heartList.updateValue(true, forKey: key)
                } else {
                    heartList.updateValue(false, forKey: key)
                }
            }
        }
        changeHeartButtonImage()
        heartListUpdate = true
        setupLikeLists()
    }
    
    // 아래 슬라이더로 볼륨 조절하는 함수
    @IBAction func changeVolume(_ sender: Any) {
        audioPlayer?.volume = volumeSlider.value
    }
    
    // 이전버튼 터치
    @IBAction func backButtonTouched(_ sender: Any) {
        playButton.isSelected = false
        stopRadio()
        moveToPreviousFrequency()
        changeLabel()
        changeHeartButtonImage()
    }
    
    // 다음 버튼 터치
    @IBAction func nextButtonTouched(_ sender: Any) {
        playButton.isSelected = false
        stopRadio()
        moveToNextFrequency()
        changeLabel()
        changeHeartButtonImage()
    }
    
    // 재생 버튼 터치
    @IBAction func playButtonTouched(_ sender: Any) {
        print("play Button Touched")
        playButton.isSelected.toggle()
        animationStatus = playButton.isSelected ? true : false
        playWaveAnimation()
        changeSliderValue(fixFrequency())
        changeLabel()
        informationLabelAnimate()
        playButton.isSelected ? streamRadio() : pauseRadio()
    }
}

// 현재 위치 찾는 CLLocationManager
extension RadioViewController: CLLocationManagerDelegate {
    
    func findLocation() {
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManger.startUpdatingLocation() //위치 정보 받아오기 시작
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationList.updateValue(location.coordinate.latitude, forKey: "latitude")
            locationList.updateValue(location.coordinate.longitude, forKey: "longitude")
            locationStatus = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
