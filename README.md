# AnimWaveRadio

### App Feature

<table>
<tr>
<td>
<img src="https://user-images.githubusercontent.com/111719007/220984104-ceb9bed8-939d-4a62-8347-6d04765d4fee.gif" width="220" />
</td>
<td>
<img src="https://user-images.githubusercontent.com/111719007/220984124-5a3b7954-af92-41c4-babb-3bafc0ab6b77.gif" width="220" />
</td>
<td>
<img src="https://user-images.githubusercontent.com/111719007/220984147-13c19ed3-1fdd-4d3a-9e17-47e1aba1f53d.gif" width="220" />
</td>
<td>
<img src="https://user-images.githubusercontent.com/111719007/220984157-a10fbf26-5fac-47fa-9460-71d832c62f4e.gif" width="220" />
</td>
</tr>
</table>

### App Description

이 앱은 라디오 기능이 없는 기기(아이폰8 이후에 애플에서 아이폰에 대한 라디오 주파수 직접 수신을 지원하지 않음)에서도 라디오를 즐길 수 있도록 해줍니다. 현재 위치 정보를 받아와 인근 지역의 라디오 목록을 가져오며, 라디오 주소를 가져오는 각각의 API를 활용하여 라디오 스트리밍을 지원합니다. 이 앱을 통해 사용자는 인터넷 연결만 있으면 언제 어디서든 쉽게 라디오를 들을 수 있습니다.

또한, 이 앱은 사용자가 자주 듣는 라디오를 저장해둘 수 있어서 편리하게 이용할 수 있습니다. 

### How to run

```
> cd AnimWaveRadio-iOS
> open AnimWaveRadio-iOS.xcodeproj
> ...
```

### Core Features

1. 애니메이션 효과를 통해 라디오 모양을 구성하여 시각적으로 즐길 수 있습니다.
2. CircularSlider를 이용해 라디오 주파수를 쉽게 조작하여 라디오를 선택할 수 있습니다.
3. 뒤로가기, 앞으로가기, 재생, 멈춤 버튼을 이용하여 라디오를 쉽게 제어할 수 있습니다.
4. 좋아하는 라디오를 선택하거나 해제하고, 좋아하는 라디오의 리스트를 확인할 수 있습니다.
5. 선택한 라디오가 재생될때 라디오의 정보와 현재시간을 하단 텍스트에서 확인할 수 있습니다.

### How to implement

1. 애니메이션 효과를 통해 라디오 모양을 구성하는 방법:
```
AnimeView를 이용하여 라디오 모양을 구성하는 화면 상단에 위치한 뷰를 생성하였습니다.
이 뷰 내부에 작은 정사각형, 직사각형, 원 등의 뷰를 생성해 라디오 모양을 생성하고,
Timer 기능을 사용하여 작은 뷰들을 순서대로 움직이게 만들어 라디오 모양을 구성하였습니다.
```
2. CircularSlider를 이용해 라디오 주파수를 조절하는 방법:
```
CircularSlider 라이브러리(HGCircularSlider)를 이용하여 슬라이더를 생성하였습니다.
슬라이더 값 변경 시 해당 주파수에 맞는 라디오를 불러오도록 설정합니다.
슬라이더 값을 변경하였을 때 라디오 API에 일치하는 주파수가 없을 경우에는 
fixFrequency 함수를 이용하여 사용자가 선택한 주파수와 가장 가까운 주파수로 이동하도록 만듭니다.
```
3. 뒤로가기, 앞으로가기, 재생, 멈춤 버튼을 이용하여 라디오를 제어하는 방법:
```
뒤로가기, 앞으로가기, 재생 및 멈춤 버튼을 생성하고, 눌렀을 때 해당 기능을 수행하도록 구현하였습니다.
이 때, AVAudioPlayer를 사용하였습니다.
```
4. 좋아하는 라디오를 선택하거나 해제하고, 좋아하는 라디오의 리스트를 확인하는 방법:
```
좋아하는 라디오를 선택할 수 있는 하트 버튼과, 리스트를 확인할 수 있는 More 버튼을 생성하여, 
해당 정보를 [라디오 정보]:[Bool] 타입의 딕셔너리로 이용하여 좋아하는 라디오 정보를 저장하고, 선택한 라디오를 좋아하는 라디오 목록에 추가 또는 삭제합니다.
좋아하는 라디오 목록을 확인할 때는 버튼의 menubar 기능을 사용자의 선택에 따라 동적으로 추가 및 삭제하여 구성하였습니다.
```
5. 라디오 정보 텍스트 구현하는 방법:
```
원하는 위치에 label을 생성하고, 해당 label의 maxWidth와 각 글자들의 spacing에 맞추어
현재 보여지는 string과 앞으로 보여주질 string의 두개의 스택을 FIFO방식으로 삽입 또는 삭제하여 지속적으로 보여질 수 있게 구성하였습니다.
```

### Problems

1. API 가져오기
```
API 파싱을 할 때 라이브 스트리밍되는 라디오 주소를 가져오기 위해서는 
전 세계 5만 개의 라디오를 스트리밍해주는 radio.co의 API를 사용해야 하는데, 
이 API는 무료 체험이 불가능하고 사용하려면 최소 1달에 59달러를 지불해합니다...... 
그래서, 라디오 mockup 데이터를 JSON 파일로 만들고, 
이 데이터를 사용하는 모델을 만들어서 로컬에서 Bundle URL을 사용해야 하는 방식을 사용했습니다
뿐만아니라, 나의 현재위치를 라디오 목록을 요청하는 openapi를 사용할 때에는 
"법정동코드"라는 변수를 요청 값의 primary 변수로 필요로 하기 때문에 
CLLocation으로 받아온 위도, 경도를 법정동코드로 파싱하는 또다른 api를 사용해야해서 
이 역시, 가상의 mock json을 직접 구현했습니다.

이 때, 직접 만든 json file에 에러가 나서 한참을 고생했는데 알고보니 주석이 swift에서 사용하는 // // 
형식이 json파일에 사용되면 에러가 난다는 사실을 알았습니다.
```
2. AVAudioPlayer 사용하기
```
AVAudioPlayer를 사용하여 로컬에 있는 음원 파일을 재생할 때, 
AVAudioPlayer 빌드 에러가 계속 발생했는데... 
URL 문제인지 확인하기 위해 bundle을 사용한 로컬 URL path를 변경했지만 그대로였고, 
audioplayer instance의 생성문제 일수도 있다고 생각하여, 
옵셔널 타입으로 선언하거나 함수에서 직접 선언하여 사용하였지만 해결되지 않았습니다. 
또한, 시뮬레이터에서만 발생할 수 있는 가능성이 있다고 생각해서 
실제 아이폰과 직접 연결해서 빌드해보았지만 문제가 해결되지 않았습니다. 
그러다 알게 된 것은 Xcode 버전에 따라 mp4 파일을 AVAudioPlayer가 재생할 수 없는 경우가 있어 
mp4 형식을 m4a로 변경하면 문제가 쉽게 해결된다는 것?? 파일을 변환해보니 너무도 손쉽게 해결하였습니다.
```
3. Circle View 구현하기
```
UIKit에서는 swiftui의 Circle()로 view를 생성할 수 있는것과 달리 
직접적인 생성이 불가하기 때문에 UIView의 cornerRadius를 조절하여 원 모양의 뷰를 생성하였고, 
이 원을 특정 포인트에 맞추어 회전시키기 위해서는 Pi를 활용한 수학적인 접근이 필요하기 때문에 
extension class를 만들어 에니메이션 뷰를 직접 구현했습니다. 
```

### MVC Design

Model
```
RadioStation = 라디오 스테이션 정보를 담고 있는 모델
RadioStationAPI = 라디오 스테이션 API를 호출하고, 결과를 파싱하는 모델
LocationAPI = 현재 위치 API를 호출하고, 결과를 파싱하는 모델
FavoriteRadioManager = 즐겨찾기한 라디오 스테이션을 관리하는 모델
```
View
```
AnimationView = 라디오 메인뷰에 보여지는 애니매이션 뷰
FavoriateView = 즐겨찾기한 라디오 스테이션 목록을 보여주는 뷰 
CircularView = 라디오 주파수를 선택하는 뷰
InformationView = 라디오의 상세정보를 보여주는 레이블 뷰
```
Controller
```
RadioViewController = 라디오와 관련된 뷰와 모델을 관리하는 컨트롤러
```
