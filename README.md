## 할일을하자(HIEHJ)


<img width="1000" alt="hiehj_applogo" src="https://github.com/sanc93/hiehj/assets/60124491/c3465953-23f4-409a-881f-078bcfb77118">

### 앱 소개
할일을하자는 To-do앱입니다.

### 화면구성
- 메인화면
- 해야할일 화면
- 해야할일 등록 화면
- 완료한일 화면
### 주요기능
- 해야할일 등록
- 해야할일 삭제
- 해야할일 완료/미완료 설정
- 완료한일 리스트 보기

### 스택
ㅁㄴㅇㅁㄴ

### 아키텍쳐

할일을하자(HIEHJ) 앱은 Model-View-Controller (MVC) 아키텍처에 따라 작성되었습니다.


### 디렉토리 구조

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
