import 'package:flutter/material.dart';
import 'package:tongtong/theme/theme.dart';
import 'package:tongtong/widgets/customWidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tongtong/community/memoListProvider.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SunflowerMedium',
        ),
        home: Scaffold(
            body: SizedBox(
          height: context.height,
          width: context.width,
          child: FeedPageBody(),
        )));
  }
}

class FeedPageBody extends StatelessWidget {
  FeedPageBody({super.key});
  List memoInfo = [];

  @override
  Widget build(BuildContext context) {
    memoInfo = context.watch<MemoUpdator>().memoList;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  backgroundImage:
                      const AssetImage('assets/images/tong_logo.png'),
                  radius: 35,
                ),
              ),
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        // memoInfo[0]['userName'],
                        '이름',
                        style: GoogleFonts.mulish(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // "@${timeago.format(
                      //   DateTime.parse(memoInfo[0]['createDate']),
                      //   locale: "en_short",
                      // )}",
                      '시간',
                      style:
                          GoogleFonts.mulish(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  // memoInfo[0]['memoContent'],
                  '내용',
                  style: GoogleFonts.mulish(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(bottom: 0, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Row(children: [
                        IconButton(
                          onPressed: () {},
                          icon: customIcon(
                            context,
                            icon: AppIcon.reply,
                            isTwitterIcon: true,
                            size: 15,
                            iconColor: Colors.grey,
                          ),
                        ),
                        customText(
                          '0',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                          context: context,
                        ),
                      ])),
                      Expanded(
                          child: Row(children: [
                        IconButton(
                          onPressed: () {},
                          icon: customIcon(
                            context,
                            icon: AppIcon.heartEmpty,
                            isTwitterIcon: true,
                            size: 15,
                            iconColor: Colors.grey,
                          ),
                        ),
                        customText(
                          '0',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                          context: context,
                        ),
                      ])),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
        Divider(
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
