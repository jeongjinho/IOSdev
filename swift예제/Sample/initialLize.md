# Swift InitialLizing


## 이곳은  공부하면서 활용한 initilaLizing을 정리 해놓은 것 입니다. ##

### 01
```swift
let profileImageView: UIImageView = {

let imageView = UIImageView()
imageView.contentMode = .scaleToFill  
return imageView
}()
```
### - 설명 ###
클래스 내에서 profileImageView를 생성할때  속성까지 한번해  지정해서 만든 imageView를 	return 받아 property 에 객체 생성 하는 방법

``` imageView.contentMode = .scaleToFill``` 처럼 속성을 여러개 설정하면 좀더 편하게 쓸 수 있을 것 같다. 
