##Git Crash 
```diff: /../Podfile.lock: No such file or directory
 diff: /Manifest.lock: No such file or directory error: The sandbox is not in sync with the Podfile.lock. 
 Run 'pod install' or update your CocoaPods installation.```

## - 발생 상황
오늘 그동안 깃에 올리지 않고 맥에 있던 자료들을 업로드했습니다. 근데 레퍼지토리를 새로만들고 pod init하고 install 까지 한 프로젝트  처음에 푸쉬하고  다시 내려받으니 저런 에러가 떴네요 ㅠㅠ 

일단  Podfile.lock과 Manifest.lock 말썽인 것 같습니다. 

##- 해결법 

1 . pod이 설치된 곳으로 경로를 이동합니다.(이때 Xcode를 꺼주세요.)
2 . 커맨드창에 ```rm -rf Pods``` 를 해줍니다.
3 . 다 되면 ```rm -rf Podfile.lock```을 해주면 pod에 대한 부분이 모두 삭제될 겁니다.
4 . ```pod install```을해서 다시 설치 해 줍니다.
5 . Xcode를 켜서 빌드 한번 새로하면 정상작동!  
