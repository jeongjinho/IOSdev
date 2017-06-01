##Git Crash##
```
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)

	modified:   component/Objective -C/AFNetworking (modified content)
	modified:   portfolio/IOSProject (modified content)
```
## - 발생 상황 ##
GitHub에 올릴 최상위 디렉토리안에 .git 뿐만아니라 하위 디렉토리에도 .git을 가지고 있어서 subModule로 인식하는 문제인해서 add 를 해도 적용이 안되는 현상 

## - 해결법 ##
1. 터미널 창을 열고 GitHub에 올릴 상위 디렉토리로 들어간다.
2.  해당 위치에서 ```find . -name '.git'```쳐서  .git으로 되어 있는 것이 상위 폴더 이외에도  있는지 찾아본다.
3.  있으면  ``` find . -mindepth 2 -name '.git' -prune -exec rm -rf {} +```을 친다. (복붙 ! 참고로 -mindepth 2 상위 디렉토리에 .git은 지우면 안되기때문에)
4.   다시``` find . -name '.git'```을 친다. (안나올 것이닷!)
5.  git add 를 다시 해준다.
6.  해결
