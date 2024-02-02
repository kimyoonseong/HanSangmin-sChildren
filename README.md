# 모두의 레시피

TEAM : 한상민과아이들

DATE : 2024-02-02

MEMBERS : 한상민, 김윤성, 백성욱, 장정우

## 만든이유

Springboot를 이용한 프로젝트로 회원가입, 로그인, 게시물, 추천 ,비추천, 사진 등 여러가지를 활용하여 응용해볼 수 있는 주제인 ‘나만의 요리 레시피 커뮤니티’가 적합하다고 생각했습니다.

## 개요

작업 순서로는, Entity에 테이블들을 생성후 Jparepository 를 활용하여 workbench 와 상호작용을 하였습니다. 그다음 dto를 생성하여 toEntity toDto 함수를 만들어 서로 왕복을 할 수 있게 하였고, View 을 jsp로 생성하여 사용자에게 입력받게 하였습니다. 그 후 postmapping getmapping annotation을 이용하여 Controller 에 전달한 후, 해당 주소에 해당하는 동작들은 Service 에서 로직을 구현 하였습니다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c58ce017-aaab-4b35-9205-23c854db3c53/895ec85c-a3ea-4729-a7a3-ff44be207c4b/Untitled.png)

- Spring Boot를 활용한 백엔드 실습을 진행하였습니다.
- Header 부분에서 로그인 및 탭 이동 기능, 검색 기능을 부여했습니다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c58ce017-aaab-4b35-9205-23c854db3c53/a04af3f4-6e1f-4c20-bd88-532ec88d6c8b/Untitled.png)

- 게시글 등록을 원할 경우, 아래와 같은 화면에서 사진, 목록 기능을 포함한 텍스트 형태로 입력한 다음 등록합니다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c58ce017-aaab-4b35-9205-23c854db3c53/f9a3d560-c087-4cd4-9a2d-a522789a869e/Untitled.png)

- 작성한 글 목록을 보고 싶다면 게시글 목록 탭을 클릭하여 확인할 수 있습니다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c58ce017-aaab-4b35-9205-23c854db3c53/8494e198-9c43-4e6b-bc21-da00e86c67c8/Untitled.png)

- 검색 기능으로, 글의 제목에 작성한 단어가 포함되어 있다면 검색이 되도록 설정했습니다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c58ce017-aaab-4b35-9205-23c854db3c53/fecbd2e6-51f7-4f35-8e17-aae4b0c4d802/Untitled.png)

- 이 외에도, 회원 탈퇴를 진행 시 작성했던 모든 글이 전부 삭제되는 기능과 추천수로 게시물을 정렬하는 기능, 음식의 사진을 입력하면 해당 음식이 무엇인지 분류하고 레시피를 검색하는 기능 등을 추가했습니다.

## **느낀 점, 어려웠던 점:**

- 한상민
    
    1. jsp 파일 형식으로 보여지는 것을 학습한 이후 Thymeleaf 템플릿 엔진을 사용해보려 도전해봤지만 초기 시간 투자 대비 적용력이 떨어져 2일이라는제한된 시간에 원하는 결과물 얻기가 어렵다고 판단하였습니다. 따라서 이후 과제로 남겨두고 일단 jsp 템플릿을 충분히 학습하고 적용하는 시간을 가졌습니다.
    
    2. 사용자에게 블로그 내용을 입력받는 양식(textarea)에 ckeditor4 를 적용하여 좀 더 사용자 친화적인 웹 에디터를 제공하고자 하였습니다. 하지만 이미지를 복사 붙여넣기 경로가 아닌 실제 lcoal 의 이미지를 불러오는데 있어 어려움이 있었고 해결하지 못했습니다. 또한 DB 에 저장된 html 태그와 함께 있는 text 들의 길이가 길기 때문에 단순히 String 으로 받아오지 않고 LONGTEXT 로 DB 내부 컬럼 자료형을 변환하여 해결하였습니다.
    
    3. github 협업 시 branch 를 새로 만들어 conflit 를 해결하여 merge 하는 과정을 직접 작업하면서 각종 에러들을 해결하는 과정에서 github 협업이 작업 효율성을 굉장히 증대 시킬 수 있음을느낄 수 있었습니다.
    
    4. DB 에 Nullable, defalut, 자료형 들의 사전 정의가 잘 되어있어야 이후 작업에서 번거롭게 다시 reset하는 과정을 없앨 수 있다는 점을 깨달았습니다.
    
- 김윤성
- 백성욱
- 장정우
    
    Springboot에 대한 이해도가 굉장히 낮은상태에서 시작했습니다. 많이 부족했지만, 팀원들이 전혀 귀찮아 하지 않고 내 일처럼 저를 챙겨주며 끌고가줬기 때문에 다행히도 몇몇 구현들을 성공하였습니다.
    
    1. User 
    
    우선 협업하기 위해 User와 board로 나누어서 진행했고, User의 기능들을 구현했습니다. User의 기능들을 구현한 후 사용자의 음식을 찾아 분류할 수 있게끔 하기 위해 image데이터를 찾게 되었습니다.
    
    2. kaggle데이터셋
    
    한식 데이터를 찾기 어려워서 우선 kaggle에 있는 food-101 dataset을 활용하게 되었습니다.
    
    3. AI모델 학습 및 모델 배포 
    
    미리 teachablemachin 사이트를 통해 프로토타입 모델을 배포하였습니다. 해당 모델은 10가지 class를 분류할 수 있고, 추가로 최종모델을 VGG-16모델을 통해 학습하여 48개의 클래스를 분류할 수 있도록 학습하였습니다. 또한 음식검색 게시판에서 음식을 분류 하였을 때 음식의 #를 클릭하였을 때 게시판에 음식을 검색하여 사람들의 다양한 레시피를 볼 수 있도록 분류하였습니다.
    
    4. 모델서빙
    
    flask를 활용하여 API주소를 올린 후 JSP에서 ajax를 활용하여 이미지가 input될 수 있도록 활용하였습니다.
    
    어려웠던 점
    
    1. 한식데이터 찾기 어려움
    
    한식데이터를 찾을 수 없어 가장 많이 사용되는 food101데이터 셋을 활용하였습니다. roboflow에 한식과 관련된 데이터가 있긴 했는데 사용에 어려움이있어 우선 진행하지 못했습니다.
    
    개선 - AI모델을 더 활용하여 사용자가 게시판에 이미지를 입력했을 때도 분류하여 다른 사람의 레시피 정보를 제공할 수 있게끔 개선
    

## **Try (시도할 내용):**

2024_01_31-2024_02_01까지 진행하는 SpringBoot Project
