import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class KaKaos extends StatefulWidget {
  const KaKaos({super.key});

  @override
  State<KaKaos> createState() => _KaKaosState();
}

class _KaKaosState extends State<KaKaos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kakaotest"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  kakao();
                },
                child: const Text("kakaolink"))
          ],
        ),
      ),
    );
  }
}

kakao() {
  final FeedTemplate defaultFeed = FeedTemplate(
    content: Content(
      title: '지방소멸테스트',
      description: '#저출산 #폐교 #지방소멸 #지금당장 #행동해라 #Lc',
      imageUrl: Uri.parse(
          'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png'),
      link: Link(
          webUrl: Uri.parse('https://developers.kakao.com'),
          mobileWebUrl: Uri.parse('https://developers.kakao.com')),
    ),
    itemContent: ItemContent(
      profileText: 'Kakao',
      profileImageUrl: Uri.parse(
          'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png'),
      titleImageUrl: Uri.parse(
          'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png'),
      titleImageText: 'Cheese cake',
      titleImageCategory: 'cake',
      // items: [
      //   ItemInfo(item: 'cake1', itemOp: '1000원'),
      //   ItemInfo(item: 'cake2', itemOp: '2000원'),
      //   ItemInfo(item: 'cake3', itemOp: '3000원'),
      //   ItemInfo(item: 'cake4', itemOp: '4000원'),
      //   ItemInfo(item: 'cake5', itemOp: '5000원')
      // ],
      // sum: 'total',
      // sumOp: '15000원',
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
