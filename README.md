## 할일을하자(HIEHJ)

<img width="1000" alt="hiehj_applogo" src="https://github.com/sanc93/hiehj/assets/60124491/97383905-96f8-460d-b7dc-c4aa2549aa2b">


## 앱 소개

할일을하자(HIEHJ)는 To-do앱입니다.  

<img width="1000" alt="hiehj_apppreview" src="https://github.com/sanc93/hiehj/assets/60124491/99a83beb-ac8d-4d65-9b60-c1f048a6b518">

## 화면구성
- 메인화면
  - 해야할일 화면
    - 해야할일 등록 화면
  - 완료한일 화면
## 주요기능
- 해야할일 등록
- 해야할일 삭제
- 해야할일 완료/미완료 설정
- 완료한일 리스트 보기

## 시작가이드
아래 단계에 따라 앱을 실행 해볼 수 있습니다.  

#### 1. Xcode 설치  
먼저 Xcode를 설치해야 합니다
#### 2. 레포지토리 클론  
터미널을 열고 다음 명령을 실행하여 레포지토리를 클론합니다:
```
$ git clone https://github.com/sanc93/hiehj.git
```
#### 3. 프로젝트 열기  
터미널에서 프로젝트 폴더로 이동한 다음 `HIEHJ.xcodeproj` 파일을 더블 클릭하여 Xcode에서 프로젝트를 엽니다.
#### 4. 시뮬레이터 실행  
Xcode에서 프로젝트 상단 메뉴에서 시뮬레이터 디바이스를 선택하고 "Run" 버튼을 클릭하여 앱을 시뮬레이터에서 실행할 수 있습니다.
#### 5. 앱 사용  
앱을 실행하면 각 화면의 기능을 확인할 수 있습니다.

## 작업기간
2023.8.25 - 2023.9.1 (6일간)

## 개발환경

## 아키텍쳐

할일을하자(HIEHJ)앱은 Model-View-Controller (MVC) 아키텍처에 따라 작성되었습니다.

<img width="1000" alt="hiehj_apparchitecture" src="https://github.com/sanc93/hiehj/assets/60124491/3112ce5e-0f9c-49c1-a5f4-27917ba04a89">

## 디렉토리 구조

```

├── .swiftlint
└── HIEHJ
    ├── Resources
    │   ├── SceneDelegate.swift
    │   ├── AppDelegate.swift
    │   ├── Assets
    │   │   └── Assets.xcassets
    │   ├── Storyboards
    │   │   └── LaunchScreen.storyboards
    │   └── Extensions
    │       ├── UIImageViewExtension.swift
    │       ├── UITextFieldExtension.swift
    │       └── StringExtension.swift
    ├── Sources
    │   ├── Models
    │   │   └── Task.swift
    │   ├── Views
    │   │   └── Cells
    │   │       └── TodoListCell.swift
    │   └── Controllers
    │       ├── MainViewController.swift
    │       ├── TodoListViewController.swift
    │       ├── CompletedListViewController.swift
    │       └── AddTaskModalViewController.swift
    ├── Info.plist
    └── InfoPlist.strings
        ├── InfoPlist (English)
        └── InfoPlist (Korean)

```
