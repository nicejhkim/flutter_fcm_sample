# Flutter Push Notification Sample

FCM sample for flutter application (android/ ios)

## Android
1. Firebase에 프로젝트 생성
2. AndroidManifest.xml, build.gradle 에 있는 bundle id (com.example.notification_sample)를 새로운 id로 변경
3. Firebase Console에서 google-services.json 다운로드 해서 android/app/ 에 저장

## iOS
1. developer.apple.com 에서 Identifier 생성 (새로 만든 bundle id)
2. xcode의 Signing & Capabilities 에서 변경하거나 project.pbxproj 에 있는 bundle id (example.notificationSample.uaremine)를 새로운 id로 변경
3. (developer.apple.com) 새로 만든 identifier 에서 Push Notification 활성화
4. Development, Production SSL Certificate 생성 (.certSigningRequest 파일 이용) 및 다운로드
5. (4)에서 다운로드 한 .cert 파일을 Keychain Access 에서 .p12 파일로 export
6. developer.apple.com 에서 Apple Push Notifications service 가 enable된 키 생성 및 다운로드
7. Firebase Console의 iOS App - Cloud Messaging 탭에 (6번에서 다운로드 한) APNs Authentication Key와 (5번에서 생성한) APNs Certificates 를 등록
8. Firebase Console에서 GoogleService-info.plist 다운로드 해서 xcode에서 Runner 밑에 추가(파일 복사만 하면 안 되고 꼭 xcode에서 Add Files to "Runner" 해야 함)


documented on https://uaremine.tistory.com/22
