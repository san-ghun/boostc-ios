# boostc-ios

---

### [1-MusicPlayer](https://github.com/san-ghun/boostc-ios/tree/main/1-MusicPlayer)

- [AudioPlayer-tutorial](https://github.com/san-ghun/AudioPlayer-tutorial)

Build a basic audio file player application with `AVAudioPlayer` class in `AVFoundation` framework.

tags:    
`Xcode`, `Storyboard`, `UIKit`, `UILabel`, `UIButton`, `UISlider`, `AVFoundation`, `AVAudioPlayer`, `Auto Layout`, `Design Pattern`, `Model-View-Controller Pattern`, `MVC`, `IBOutlet`, `IBAction`, `Assets`, `Bundle`, `Timer` 

<details>
  <summary>about `UIControl.Event`</summary>
  
  - `UIControl.Event.touchDown`: 컨트롤을 터치했을 때 발생하는 이벤트
  - `UIControl.Event.touchDownRepeat`: 컨트롤을 연속 터치 할 때 발생하는 이벤트
  - `UIControl.Event.touchDragInside`: 컨트롤 범위 내에서 터치한 영역을 드래그 할 때 발생하는 이벤트
  - `UIControl.Event.touchDragOutside`: 터치 영역이 컨트롤의 바깥쪽에서 드래그 할 때 발생하는 이벤트
  - `UIControl.Event.touchDragEnter`: 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔다가 다시 들어왔을 때 발생하는 이벤트
  - `UIControl.Event.touchDragExit`: 터치 영역이 컨트롤의 일정 영역 바깥쪽으로 나갔을 때 발생하는 이벤트
  - `UIControl.Event.touchUpInside`: 컨트롤 영역 안쪽에서 터치 후 뗐을때 발생하는 이벤트
  - `UIControl.Event.touchUpOutside`: 컨트롤 영역 안쪽에서 터치 후 컨트롤 밖에서 뗐을때 이벤트
  - `UIControl.Event.touchCancel`: 터치를 취소하는 이벤트 (touchUp 이벤트가 발생되지 않음)
  - `UIControl.Event.valueChanged`: 터치를 드래그 및 다른 방법으로 조작하여 값이 변경되었을때 발생하는 이벤트
  - `UIControl.Event.primaryActionTriggered`: 버튼이 눌릴때 발생하는 이벤트 (iOS보다는 tvOS에서 사용)
  - `UIControl.Event.editingDidBegin`: UITextField에서 편집이 시작될 때 호출되는 이벤트
  - `UIControl.Event.editingChanged`: UITextField에서 값이 바뀔 때마다 호출되는 이벤트
  - `UIControl.Event.editingDidEnd`: UITextField에서 외부객체와의 상호작용으로 인해 편집이 종료되었을 때 발생하는 이벤트  
  - `UIControl.Event.editingDidEndOnExit`: UITextField의 편집상태에서 키보드의 return 키를 터치했을 때 발생하는 이벤트
  - `UIControl.Event.allTouchEvents`: 모든 터치 이벤트
  - `UIControl.Event.allEditingEvents`: UITextField에서 편집작업의 이벤트
  - `UIControl.Event.applicationReserved`: 각각의 애플리케이션에서 프로그래머가 임의로 지정할 수 있는 이벤트 값의 범위
  - `UIControl.Event.systemReserved`: 프레임워크 내에서 사용하는 예약된 이벤트 값의 범위
  - `UIControl.Event.allEvents`: 시스템 이벤트를 포함한 모든 이벤트
  
</details>

<details>
  <summary>about `UIButton`</summary>
  
  - How to connnect button with method.
    1. `addTarget(_:action:for:)`
    2. `@IBAction`
  
    ```Swift
    func doSomething()
    func doSomething(sender: UIButton)
    func doSomething(sender: UIButton, forEvent event: UIEvent)
    ```
  
  - States of UIButton
    - `default`, `highlighted`, `focused`, `selected`, `disabled`
    - states are able to use with combination. ex) `[default + highlighted]`
  
  - Properties of UIButton
    - `enum UIButtonType`: type of button, types have different shapes and actions
    - `var titleLabel: UILabel?`
    - `var imageView: UIImageView?`
    - `var tintColor: UIColor!`
  
  - Methods of UIButton
    ```Swift
    // 특정 상태의 버튼의 문자열 설정
    func setTitle(String?, for: UIControlState)
  
    // 특정 상태의 버튼의 문자열 반환
    func title(for: UIControlState) -> String?
  
    // 특정 상태의 버튼 이미지 설정
    func setImage(UIImage?, for: UIControlState)
  
    // 특정 상태의 버튼 이미지 반환
    func image(for: UIControlState) -> UIImage?
  
    // 특정 상태의 백그라운드 이미지 설정
    func setBackgroundImage(UIImage?, for: UIControlState)
  
    // 특정 상태의 백그라운드 이미지 반환
    func backgroundImage(for: UIControlState) -> UIImage?
  
    // 특정 상태의 문자열 색상 설정
    func setTitleColor(UIColor?, for: UIControlState)
  
    // 특정 상태의 attributed 문자열 설정
    func setAttributedTitle(NSAttributedString?, for: UIControlState)
    ```
  
</details>

<details>
  <summary>about `UILabel`</summary>
  
  - Properties of UILabel
    - `var text: String?`
    - `var attributedText: NSAttributedString?`
    - `var textColor: UIColor!`
    - `var font: UIFont!`
    - `var textAlignment: NSTextAlignment`: left / right / center / justified / natural
    - `var numberOfLines: Int`
    - `var baselineAdjustment: UIBaselineAdjustment`: Align Baseline / Align Center / None
    - `var lineBreakMode: NSLineBreakMode`: Character wrap / Word wrap / Truncate head / Truncate middle / Truncate tail
  
</details>

<details>
  <summary>about `UISlider`</summary>
  
  - How UISlider interact with user action.
    - When user change that value of slider, the slider call a method then do the followed action.
    - By default, when the user moves the thumb of the slider, the event is called continuously, but when the `isContinous` property value is set to false, the event is called when the user **releases the thumb** of the slider.
  
  - How to connnect slider with method.
    1. `addTarget(_:action:for:)`
    2. `@IBAction`
  
    ```Swift
    func doSomething()
    func doSomething(sender: UISlider)
    func doSomething(sender: UISlider, forEvent event: UIEvent)
    ```
  
  - Properties of UISlider
    - `var minimumValue: Float`, `var maximumValue: Float`
    - `var value: Float`
    - `var isContinuous: Bool`
    - `var minimumValueImage: UIImage?`, `var maximumValueImage: UIImage?`
    - `var thumbTintColor: UIColor?`
    - `var minimumTrackTintColor: UIColor?`, `var maximumTrackTintColor: UIColor?`
  
  - Methods of UISlider
    ```Swift
    //  슬라이더의 현재 값 설정
    func setValue(Float, animated: Bool)

    //  특정 상태의 minimumTrackImage 반환
    func minimumTrackImage(for: UIControlState) -> UIImage?

    // 특정 상태의 minimumTrackImage 설정
    func setMinimumTrackImage(UIImage?, for: UIControlState)

    // 특정 상태의 maximumTrackImage 반환
    func maximumTrackImage(for: UIControlState) -> UIImage?

    // 특정 상태의 minimumTrackImage 설정
    func setMaximumTrackImage(UIImage?, for: UIControlState)

    //  특정 상태의 thumbImage 반환
    func thumbImage(for: UIControlState) -> UIImage?

    //특정 상태의 thumbImage 설정
    func setThumbImage(UIImage?, for: UIControlState)
    ```

</details>

---

### [2-SignUp](https://github.com/san-ghun/boostc-ios/tree/main/2-SignUp)

- [SignUp-demo](https://github.com/san-ghun/boostc-ios/tree/main/2-SignUp/SignUp-demo)
- [SignUpPage-tutorial](https://github.com/san-ghun/SignUpPage-tutorial)
- [TapGesture-tutorial](https://github.com/san-ghun/TapGesture-tutorial)
- [UIImagePickerController-tutorial](https://github.com/san-ghun/UIImagePickerController-tutorial)
- [DatePicker-tutorial](https://github.com/san-ghun/DatePicker-tutorial)

Build a basic sign up process interface application with navigation interface and modal.

tags:    
`Design Patterns`, `Delegation Pattern`, `Singleton`, `Target-Action`, `View Transition`, `Navigation Interface`, `Modality`, `UIKit`, `UITextField`, `UIDatePicker`, `UIStackView`, `UIImagePickerController`, `UINavigationController`, `UIGestureRecognizer`, `View Controller States Methods`, `Foundation`, `DateFormatter`, `Dictionary`, `guard` 

<details>
  <summary>about `UIGestureRecognizer`</summary>
  
  - Subclasses of UIGestureRecognizer class
    - UITapGestureRecognizer: 싱글탭 또는 멀티탭 제스처
    - UIPinchGestureRecognizer: 핀치(Pinch) 제스처
    - UIRotationGestureRecognizer: 회전 제스처
    - UISwipeGestureRecognizer: 스와이프(swipe) 제스처
    - UIPanGestureRecognizer: 드래그(drag) 제스처
    - UIScreenEdgePanGestureRecognizer: 화면 가장자리 드래그 제스처
    - UILongPressGestureRecognizer: 롱프레스(long-press) 제스처
  
  - Properties of UIGestureRecognizer
    - `var state: UIGestureRecognizerState` : 현재 제스처 인식기의 상태를 나타냅니다.
    - `var view: UIView?` : 제스처 인식기가 연결된 뷰입니다.
    - `var isEnabled: Bool` : 제스처 인식기가 사용 가능한 상태인지를 나타냅니다.
    - `var cancelsTouchInView` : 제스처가 인식되었을 때 터치 이벤트가 뷰로 전달되는 여부에 영향을 미칩니다.
      - 이 프로퍼티가 true(기본값)이고 제스처 인식기가 제스처를 인식했다면, 해당 제스처의 터치는 뷰로 전달되지 않습니다. 이전에 전달된 터치들은 `touchesCancelled(_:with:)` 메시지를 통해 취소됩니다. 제스처 인식기가 제스처를 인식 못하거나 이 프로퍼티의 값이 false라면 뷰가 모든 터치를 전달받게 됩니다.
    - `var delaysTouchesBegan` : began 단계에서 제스처 인식기가 추가된 뷰에 터치의 전달 지연 여부를 결정합니다.
    - `var delaysTouchesEnded` : end 단계에서 제스처 인식기가 추가된 뷰에 터치의 전달 지연 여부를 결정합니다.
  
  - Methods of UIGestureRecognizer
    ```Swift
    // 제스처 인식기를 타깃-액션의 연결을 통해 초기화
    init(target: Any?, action: Selector?)
  
    // 제스처가 발생한 좌표를 반환
    func location(in: UIView?) -> CGPoint
  
    // 제스처 인식기 객체에 타깃과 액션을 추가
    func addTarget(Any, action: Selector)
  
    // 제스처 인식기 객체로부터 타깃과 액션을 제거
    func removeTarget(Any?, action: Selector?)
  
    // 여러 개의 제스처 인식기를 가지고 있을 때, 제스처 인식기 사이의 의존성을 설정
    func require(toFail: UIGestureRecognizer)
    ```

</details>

---

### [3-Weather](https://github.com/san-ghun/boostc-ios/tree/main/3-Weather)

- [Weather-demo](https://github.com/san-ghun/boostc-ios/tree/main/3-Weather/Weather-demo)
- [SimpleTable-tutorial](https://github.com/san-ghun/boostc-ios/tree/main/3-Weather/SimpleTable-tutorial)
- [CodableWithJSON](https://github.com/san-ghun/boostc-ios/tree/main/3-Weather/CodableWithJSON-tutorial)

Build a basic weather application that process JSON data to show weather condition, using navigation controller and table view.

tags:   
`UIKit`, `UITableView`, `UITableViewCell`, `View Reuse`, `Table View Cell Customize`, `Codable`, `JSONDecoder`, `Design Patterns`, `Delegation Pattern`, `View Transition`, `Navigation Interface` 

---

### 4-Album

- Album-demo

Build a basic photo album application that show photos in photo library with shape of collection view, using `Photos` Framework.    
Using collection view, user can select a list of photos and delete photos. Also, user can change the order method of photos. By tapping the photo, user can access new window and able to zoom photo.

tags:    
`Photos`, `UIKit`, `UICollectionView`, `UICollectionViewCell`, `UICollectionViewFlowLayout`, `UINavigationItem`, `UIBarButtonItem`, `UIStoryboardSegue`, `UIScrollView`, `Concurrency Programming`, `Asynchronous Programming`, `OperationQueue`, `Design Patterns`, `Delegation Pattern`, `View Transition`, `Navigation Interface`, `View Reuse`, `Auto Layout` 

---

### 5-BoxOffice




