import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// date = 2023/02/23
// --- kakaoLinkapi ---
class Kakaolink_api {
  kakao(String profiletitle, String userName, String point) {
    final FeedTemplate defaultFeed = FeedTemplate(
      content: Content(
        title: '지방소멸테스트',
        description: '#저출산 #폐교 #지방소멸',
        imageUrl: Uri.parse(
            'https://github.com/vxornjs11/Flutter-Semi/blob/master/Frame%206.png?raw=true'),
        link: Link(
            webUrl: Uri.parse('https://developers.kakao.com'),
            mobileWebUrl: Uri.parse('https://developers.kakao.com')),
      ),
      itemContent: ItemContent(
        profileText: profiletitle,
        profileImageUrl: Uri.parse(
            'https://github.com/vxornjs11/Flutter-Semi/blob/master/Frame%206.png?raw=true'),
        titleImageUrl: Uri.parse(
            'https://github.com/vxornjs11/Flutter-Semi/blob/master/Frame%206.png?raw=true'),
        titleImageText: profiletitle,
        // titleImageCategory: 'cake',
        items: [
          ItemInfo(item: userName, itemOp: point),
        ],
        // sum: userName,
        // sumOp: point,
      ),
      social: Social(likeCount: 286, commentCount: 45, sharedCount: 845),
      buttons: [
        Button(
          title: '웹으로 보기',
          link: Link(
            webUrl: Uri.parse('https: //developers.kakao.com'),
            mobileWebUrl: Uri.parse('https: //developers.kakao.com'),
          ),
        ),
        Button(
          title: '앱으로보기',
          link: Link(
            androidExecutionParams: {'key1': 'value1', 'key2': 'value2'},
            iosExecutionParams: {'key1': 'value1', 'key2': 'value2'},
          ),
        ),
      ],
    );
    kan(defaultFeed);
  }

  Future<void> kan(defaultCommerce) async {
    bool isKakaoTalkSharingAvailable =
        await ShareClient.instance.isKakaoTalkSharingAvailable();

    if (isKakaoTalkSharingAvailable) {
      try {
        Uri uri =
            await ShareClient.instance.shareDefault(template: defaultCommerce);
        await ShareClient.instance.launchKakaoTalk(uri);
        print('카카오톡 공유 완료');
      } catch (error) {
        print('카카오톡 공유 실패 $error');
      }
    } else {
      try {
        Uri shareUrl = await WebSharerClient.instance
            .makeDefaultUrl(template: defaultCommerce);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        print('카카오톡 공유 실패 $error');
      }
    }
  }
}
