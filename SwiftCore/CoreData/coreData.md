# Core data #

 - 드로잉 앱을 만들기위해서 Realm을 사용하기 전에 코어데이터를 쓰는 법을 간단히라도 알고싶었습니다. 그래서 오늘부터 3일간 코어데이터를 공부하고 정리해보도록 하겠습니다.
 
 
 ### 데이터 모델 ###
 
 처음 프로젝트생성 시 use Core data를 선택 시 use Core Data를 해줍니다.(가급적이면 맨처음해주는 것이 좋은 것 같은 느낌...)
 ![](https://github.com/jeongjinho/IOSdev/blob/master/SwiftCore/CoreData/%EC%BD%94%EC%96%B4%EB%8D%B0%EC%9D%B4%ED%84%B01.png)
 
 

프로젝트 생성 후에는 좌측 네이게이션 창에 프로젝트이름.xddatamodeld라는 파일이 하나 생길 겁니다.(아주 중요한 파일입니다.)

### 데이터 그릇 만들기 ###
파일을 눌러서 보면 아래 부분에 Add Entity가 있을 겁니다. 누르면 defalt 이름인 Entity로 추가가 됩니다.(대문자로 네이밍!)
[코어데이터2]


안에 보시면  attribute를 생성 할 수 있습니다. article이라는 속성을 생성하고 데이터타입은 String으로 했습니다.
[코어데이터3] 


위에까지 만드셨으면 우리는 데이터를 저장 할 수있는 하나의 그릇을 만든 것 입니다. 

물론 두개이상의 Entity를 관계를 설정할 수도 있습니다.(아래 버튼을 선택하면 이미지로도 볼 수 있습니다)
코어데이터[4]

### 앱델리게이트 ###
그릇을 만들었으니 이제 데이터를 담아보겠습니다. 


그전에 AppDelegate.swift를 보면 그전 보다 함수와 프로퍼티가 더 추가 된 것을 볼 수 있습니다.
앱델리게이트 ``` let delegate = UIApplication.shared.delegate as! AppDelegate```를 통해서 델리게이트 가져올 수 있습니다. 
이것을 통해서 context에 접근하고 fetchRequest를 생성 할 수 있습니다. 

이것을 토대로 저는 하나의 클래스로 만들어서 관리하는 코드를 작성해 보았습니다. 
//[코어데이터2]
fetchRequest같은경우 생성된 것을 가져오는 것이 아니라 새로 생성해야 하기 때문에 초기화를 했습니다.

이것을 토대로 Note라는 곳에 접근해서 데이터를 저장해 보겠습니다. 
[코어데이터3] 
미리 만들어 놓은 Class 내에 삽입 메서드입니다. NotePad의 context를 참조하여 Entity에 접근할 수 있습니다.

[코어데이터4]
가지고온 newMemo는 NSManagedObject를 객체를 참조하기때문에 여기서 setValue를 통해서 값을 넣어 줄 수 있습니다. 
그다음 반드시 save를 해줘야 최종적으로 NotePad에 영구적으로 정작 됩니다.

[코어데이터5]
미리 만들어 Class 내의 저장 메서드입니다.(context에 접근할떄는  do catch 구문을 쓰도록 되어 있습니다.)

그리고 졍렬또한 메서드로 구현이 간단히 가능합니다.
[코어데이터6]
생성된 fetchRequest에 NSSortDescriptor를 통해서 해당 Entity에 목록를 가져올 때 key 에
들어가는 attribute 를 오름차순 또는 내림차순으로 가져올 수 있습니다.
