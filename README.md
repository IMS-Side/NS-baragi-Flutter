# 커밋 메시지 규칙
- 커밋 메시지는 " [브랜치 명] type : 내용 "   으로 작성합니다.
- type 은 아래 표를 참고해서 적절한 타입을 선택해주세요.
- 내용은 어떻게 했는지 적는 것 보단 어떤 것을 왜 했는지 위주로 써주세요.
    -  ex) ~ 위젯 left margin 값 10px 수정 X -> sizeBox 추가에 따른 left margin 값 수정
    -  ex) 데이터 type int -> String 변경 -> ~ controller 데이터 형식 변경에 따른 데이터 타입 수정

| 타입       | 설명                                                                              |
|----------|-----------------------------------------------------------------------------------|
| feat     | 새로운 기능 추가                                                                 |
| fix      | 버그 수정 또는 typo                                                              |
| refactor | 리팩토링                                                                         |
| ui       | css 등 사용자 ui 디자인 변경                                                     |
| comment  | 필요한 주석 추가 및 변경                                                         |
| style    | 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우                                 |
| test     | 테스트(테스트 코드 추가, 수정, 삭제, 비즈니스 로직에 변경이 없는 경우)            |
| chore    | 위에 걸리지 않는 기타 변경사항(빌드 스크립트 수정, assets image, 패키지 매니저 등)|
| init     | 프로젝트 초기 생성                                                               |
| rename   | 파일 혹은 폴더명 수정하거나 옮기는 경우                                           |
| remove   | 파일을 삭제하는 작업만 수행하는 경우                                              |