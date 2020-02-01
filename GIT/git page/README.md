## 1. Git의 기초
 사용하는 이유 및 사용과정에 대한 설명




- 파일의 수정본, 협업이 필요할 때 효율적으로 관리할 수 있는 방안?
- delta와 snapshot이 필요해진다. 

- **버전관리시스템의 등장**
1. **중앙 집중식 버전관리 시스템 (CVCS)**
     -드라이브에 올려놓고 하나씩 수정하는 형태
     -협업시 어렵고, 중앙서버(와이파이 없이 불가능), 변경시 다시 다운필요
2. **분산 버전 관리 시스템(DVCS)**
     -메인서버(어떤 식으로 수정되었는지)에서 모든 정보를 내 컴퓨터에 가져옴
     -버전을 내 컴퓨터에서 수정한 후에, 원격으로 올릴수 있다. 메모리 용량차지도 적다. 
     -따라서 협업도 편리하다 


- 분산버전관리 시스템 중 하나가 git, 또한 git은 일종의 프로그램이다. (저장을 위한 것)
- git은 시스템 전체를 스냅샷으로 취급한다. 변경하지 않은 파일은 새로 저장하지 않고, 링크만 저장하는 형태이다(일종이 포인터의 형태)
- git을 효율적으로 협업하는 방법, 브랜치 관리 방법이 다르기 때문에 회사나 원하는 프로젝트에 따라 원하는 기능이 달라진다. 

-**easy git** <br>
1. git을 사용하겠다고 선언
2. 파일을 추가/수정/삭제
3. 원하는 변경 사항 선택
4. 상태 업데이트(계속 업데이트 수정)

-**선언**<br>
- 흔히 Repo라고 부른다. (깃을 관리하는 하나의 메인 저장소이다)
- 사용자가 변경한 모든 내용을 추적하는 공간이다(하나의 디렉토리로 볼 수가 있다, 현재사상태, 수정상태 모두..)
- git은 이제 local에서 가능한 형태(서버 죽어도 무상관), git은 데이터를 추가만 할 수 있다. ‘삭제’도 하나의 기록으로 추가된다는 의미이다. 
git은 파일을 추적하지 않는다. 각 문자와 줄을 추적한다.(어떻게 수정이 되었는지를 알려준다. )



-**파일 상태**<br>
- 어떤 파일들을 딱히 저장할 필요가 없다면? 따로 처리하는 경우. (untacked와 tracked로 나뉜다). git이 추적하는 파일은 총 3가지 상태이다. 
- unmodified, modified, staged. stage는 말 그대로 우리가 올린 내용을 강단에 올리는 것과 같다고 생각한다. 
- staging을 하면 커밋하고 싶은 파일을 선택, commit을 하면 실제 새로운 버전으로 업로드를 하게 된다. 왜 2번할까? 원하는 부분만을 먼저 올릴 수 있도록 하기 위해. 


-**커밋완료**<br>
커밋을 하면 이상한 40자리 숫자+알파벳 조합이 생긴다. 파일의 내용을 주소로 생성한다(40자리의 hash값을 나타낸다는 말이다)


-**다룰 수 있는 방법** <br>
 sourcetree를 사용할 수도 있고, 혹은 terminal을 통해 직접 타고 들어가 활용해 볼 수가 있다. 






## 2. githib실습하기



- git을 회사서버나 원격서버에 깔고 같이 관리하는 방법은 힘들다. 따라서 여러사람이 협업하기 위해 사용하는 원격호스팅방법이 github, gitlab이다. opensource를 github에서 관리하고 개발을 github에서 하게 된다. 

- git repository에 새로운 값을 만들면 ‘새로운 폴더’가 만들어졌다고 본다. (project등을 만드는 방법 or readme를 만드는 방법, 다른 코드를 참고하면 코드 overview가 나오는데 이를 입력하는 방법에 대한 질문이 필요)

- 소프트웨어 버전의 개발과정, ‘major-minor-patch’의 2~4가지의 숫자나 알파벳으로 구성이 되어 버전이 업데이트된다고 생각하면 편하다. 하지만 에러는 예측할 수 없고 소비자의 니즈는 계속 바뀌기 때문에 대부분의 프로젝트는 순차적인 진행이 불가능하다. 

- 기존의 버전은 기존의 develop과정으로 관리하며, brach를 만드어 다르게 관리하게 되는 방법을 보인다. 




- **프로젝트 시작 선언**
- **git init**(git초기화 의미 로컬에서 진행한다-트리의 시작점이라고 생각한다, 축의 흐름을 master 가지라고 생각한다)
- 버전 저장은 .git(컴퓨터에서는 숨김파일이다. 버전의 snapshot정보를 의미한다)
- 저장이 싫다면 .gitignore파일로 작성한다. 
- readme.md : 설명작성
어떻게 보면 readme가 포트폴리오로 발전할 수 있는 기반이 될 수가 있다. 
프로젝트의 설명, 사용방법, license 등을 기술 + repo의 mainpage를 기술



**readme의 순서에 대한 예제**
1. 프로젝트 내용(이미지, 로고)
2. 설치 방법-코드설치, 다운 방법 등
3. 코드 예제
4. 개발 환경 설정 방법-mac, window에 따른 방법
5. 기여방법 – 권한이 없지만, 수정 요청방법
6. 로그 변경 – 변경사항에 대한 저장
7. 크레딧 – 수정에 대한 기여자(contributor)
8. 라이센스 – 오픈소스 활용시, 논문구현에 대한 저작권에 대한 추가 등
9. 연락처 – 관심이 있는 사람이 나에게 contact할 수 있는 부분을 의미한다. 


- (ex) data analytics에서 tensorflow작성시, 어떤 부분에 대한 수정이 있었는지를 수정한다면 내가 크레딧에 올라갈 수도 있겠고, 그것이 바로 포트폴리오의 일부가 되는 것이다. 
(기능개발, invent, 주석처리, 오탈자 수정 등 모두 가능하다)

- **git add [file]** : [file]을 스테이지로 올림, 폴더나 전체도 모두 가능하다
공개하기 전에 모두 정리하는 단계를 의미한다. 
- **git status, git diff** : 어떤 파일을 수정했고, 스테이징 했는지를 보이는 방법
- **git commit –m “add README.md”** : 간단한 설명과 함께 commit(이전버전에서 현재버전으로 확실히 업데이트 된 것이다)

- **git log** : 이전 commit기록을 살펴본다. (commit, Date, author, message를 확인 가능)
만약 sourcetree를 사용하면 git log가 자동으로 보여진다. 
- **git remote add origin [url]** : origin이라는 이름으로 [url]과 연결
(원격으로 올리기 전에 url연결해 주는 것을 의미한다. origin은 일종의 관용어이다.)
- **git push origin master** : 원격 저장소 master branch에 업데이트, 메인 버전을 origin에 업데이트 하겠다는 의미(동기화 완성)-push완성






#### **<git bash기본 명령어>**

- **clear**  : 전체 입력어 삭제, 변경사항이 없어지는 것이 아니므로 거의 계속 치는 명령어라고 생각하면 된다. 
- **mkdir github_practice** : make directory + dir이름
- cd github_practice : change dir
- ls : 리스트
- git init : git을 사용한다는 선언이 필요하다. 



- code . : visual studio code와 연동하는 방법
(생성시 README.md가 같이 생성이 된다, vs에서 markdown으로 만든다)

- code로 visual studio code가 열리면 code에서 모든 내용을 관리하면 이하의 push, add, commit의 내용은 sourcetree에서 다루는 것이 편한다. 
- cat README.md : README의 내용을 확인이 가능하다
- ls -al : 숨김처리된 파일까지 모두 확인이 가능한 경우

- git status : 현재 git의 상태를 확인하는 방법
git add README.md : stage에 올리는 방법
git status : 다시 현재의 상태를 확인하는 방법

- 실제로 stage에 올렸다는 것은 commit할 준비가 되었다는 의미. 
git commit -m 'add readme.md' : 실제로 커밋하는 방법

- git status : 현재 사항이 모두 upgrade되었으므로, 당연히 commit할 사항이 없다고 입력된다. 

- git log : 누가, 언제 어떤 내용을 올렸는지에 대한 확인이 가능한 내용

- git diff : 과거의 readme와 현재의 readme를 비교하는 과정을 의미한다. 

- git add. : 전체 내용을 모두 올리는 경우를 의미한다.

---

**버전의 이동** <br>
- git checkout + 앞에 commitcode의 7자리 : head를 바꾸는 과정
- git log : 이전의 내용을 head로 가리키고 있음. 
- git checkout master : 컴퓨터에서 수정된 이후의 내용을 다시 head로 바꾸는 과정
- git log --all : 이전의 수정사항까지의 log를 전체 확인하는 방법

---


- git help : 어떤 명령어를 사용해야 할지에 대한 overview가 나온다. 

- git remote add origin https://github.com/chunghyunhee/github_practice.git
 : 원격 저장소에 url을 origin 으로 저장하고, 연결하는 방법
- git push -u origin master : origin master에 실제 저장하는 방법
- git -v : 연결되어 있는지를 확인하는 방(version확인)

- (실제 repository를 F5하면, 이제까지 작업하던 내용이 변경된 것을 
볼 수가 있다. 실제 github에서의 commit을 보면, 어떤 변경사항이 있었는지를 code형태로 볼 수가 있다.또한 바로 코드리뷰 기능가능 )






- **원격 저장소 다운받기**<br>
- git clone [url] 원격 저장소에서 다운로드 :　내 컴퓨터에서 기존의 log까지 모두 다운이 가능한 경우
하지만 master branch를 바로 clone하는 것은 좋지 않다(배포용이기 때문에).
- git branch [name] : [name] branch를 만든다
필요한 기능은 병렬적으로 관리하는 것이 필요하기 때문이다. 필요한 기능을 원하는 시점에 원하는 기능을 만들 때까지 완성이 가능하는 경우, 처음에 brach를 만들어 commit하는 순간 개발루트가 생성이 되는 형태이다. 
- git checkout [name] : [name] branch로 이동하기 
브랜치 간에도 자유롭게 이동할 수 있다. (브랜치는 결국 개발 협업을 위한 도구이다). master루트 따로, branch개발 따로 해서 개발을 완성하는 경우를 의미한다. 







- **브랜치 합치기** <br>
- git merge [name] : [name] branch를 현재 branch로 합친다. 즉 기능 완성 이후 push로 원격 저장소에 저장을 해야 한다. 
- git rebase master　: branch를 합칠 경우에, 고리를 없애고 하나의 고리를 형성하는 것을 의미한다. 
- git branch –d [name] : 완료된 branch는 지우는 것을 의미한다. 




## sourcetree에서 visual로 보는 경우
- code . : visual studio code에서 새로운 code내용을 만든다(여기서는 newfile.txt파일을 생성했다. 이후에 sourcetree에서 F5를 하면, ‘커밋하지 않은 새로운 파일’이 생성된다.아직 stage에 올리지 않은 파일임을 의미한다.  )
- sourcetree에서 ‘파일 상태’에서 선택파일 stage에 올리기를 통해 stage가능





- **branch를 생성하는 방법** <br>
- branch생성시에는 ‘어디에서 만들것인지’에 대한 생각이 필요하다. 
- 대부분 master에서의 오른쪽으로 생성.(master 옆에 branch가 생성이 된다)
- 파일 상태에서 stage에 올리고 커밋가능.(커밋란에 ‘branch first commit’으로 커밋한다. 삿리 커밋란에 적는 내용은 어떤 것을 커밋했는지에 대한 간단한 comment일 뿐 정해진 내용은 아니다. 관용적인 표현일 것임)
- 실제 tree형태로 연결됨을 시각적으로 확인하기위해 master의 위치로 가서, (head가 master), vs code에서 test3 file을 생성한다. 
후에 history를 확인하면 branch형태로 생성됨을 확인이 가능하다. 


- **branch합치는 방법**<br>
master branch에서 test_branch와 마지막 master branch를 합치려 한다. branch에서 오른쪽 커서로 병합을 확인한다. 
(그렇다면 현재 분기 상에는 Merge로 표기가 되어 있을 것이다. )

- **branch삭제하는 방법**<br>
이미 merge한 형태에 대해서는 이전의 branch가 필요가 없기 때문에 master로 버전 변경후, 위 옵션에서 ‘브랜치->브랜치 삭제’를 한다. 즉 후에는 브랜치를 삭제한 기록만 있고, 브랜치를 따로 관리하지는 않는다. 

- **원격서버에 올리는 방법**<br>
현재 branch에 표시되어 있는만큼 원격서버에 올라간 형태이다. 즉 이제까지의 작업을 올릴 필요가 있다는 의미이다. 위의 옵션에서 ‘push’를 통해 원격서버에 add, remove add commit을 실행한다. 후에 master와 origin/master가 같은 위치에 있다는 것은 원격으로 올라갔다는 것을 의미한다. 
- 실제 github에는 commit이 여러개로 확인이 됨을 알 수가 있다. 이런식으로 colaborator을 진행할 경우에, 사용하게 될 것이다 다른 사람이 clone을 받고 협업후에, 새로운 결과물을 만드는 형태로 진행이 된다. 



- **버전을 원격저장소에서 가져오는 방법 : full/fetch**<br>
1. fit fetch : 원격저장소와 동기화 (‘가져온다’, branch만 생성)
2. git pull : 원격저장소와 동기하 하고 merge(‘가져오고 동기화’, branch생성하고 합친다)


- **실수한 commit을 reset하는 경우**<br>
- git rest [option] [branch] : branch이후의 기록을 없애는 경우
- but 이미 원격저장소에 올라간 상태에서 reset을 하게 되면 버전이 안맞는다. 

- git revert [branch] : 수정한 기록도 남기는 방법
협업하는데 커밋 로그를 지우면 서로 버전이 맞지 않으므로 수정기록까지 남기는 방법을 의미한다. (거의 대부분 사용한다. 지우되, 지우는 방법을 추가하는 경우를 의미)

- 실제 sourcetree에서는 ‘커밋되돌리기‘를 사용하면, 새로운 노드가 하나 생성이 됨을 확인이 가능하다. (앞에서 만든 branch로부터 다시 되돌리는 과정을 의미한다.)


---
## 4. Git page의 사용
---

- markdown문법
텍스트에 양식을 입히는 작업에 대한 문법이다. 
연동의 문제, githubpage에서의 연동도 하나의 스킬이다. 

- 실제로 githubpage나 readme를 작성할 때, markdown문법을 그대로 사용한다. 

**markdown문법예제**

```markdown
\#은 Header를 의미합니다.

# H1 태그 

## H2 Tag

### H3 Tag

#### H4 Tag

##### H5 Tag


\# 를 5개 이상 쓴다는 것? -> 잘못된 분류!! 


---

_italic_
*italic*

**bold**

**_italic+bold_**

~~hello~~

> Quate문 작성 - **정현희**

---

* list 1
* list 2
* list 3
  - A
    - B

1. list 1
2. list 2
3. list 3
   1. A
      1. B

| 제목  | description | 비고  |
| --- | ----------- | --- |
| 안녕  | 1           | 2   |
| 할로  | 3           | 4   |



---

[subinium의 블로그](subinium.github.io)




![subinium](https://subinium.github.io/assets/images/mac_asb.jpg)

---

`simple code`

```cpp(코드 확인하는 방법)
#include <stdio.h>

int main(){
    printf("hello world");
    return 0;
}


---

$a^2 + b^2 = c^2$

$$(\alpha + \beta)^2 = \alpha^2 + 2 \alpha \beta + \beta^2$$

---


graph LR
    1-->2
    1-->4
    2-->3


```

(visual studtio- markdown enhanced를 통해 어떻게 표현되고 있는지를 볼 수가 있다.) <br>


### 내 github에 commit하는 방법
git init <br>
git remote -v <br>
git add   #stage에 올리겠다. <br>
git commit -m 'blog start' #커밋할 메세지 입력 및 커밋 <br>
git push origin master #원격 동기화  <br>
<br>

### 블로그 commit, push를 gitbash에서 조정
cd blog_blog (해당파일에서 수정했으므로) <br>
git add .<br>
git commit –m ‘commit posts’ <br>
git push origin master #원격 동기화 <br>








