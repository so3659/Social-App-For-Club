import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tongtong/theme/theme.dart';
import 'package:tongtong/widgets/customWidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:tongtong/parameter/postParameter.dart';

class FeedPageBody extends StatefulWidget {
  const FeedPageBody({
    super.key,
    required this.uid,
    required this.content,
    this.photoUrls,
    required this.dateTime,
    required this.documentId,
    required this.currentUserId,
  });

  final String uid;
  final String content;
  final List<dynamic>? photoUrls;
  final Timestamp dateTime;
  final String documentId;
  final String currentUserId;

  @override
  FeedPageBodyState createState() => FeedPageBodyState();
}

class FeedPageBodyState extends State<FeedPageBody> {
  int currentPage = 0;
  late FeedPost post;

  @override
  void initState() {
    super.initState();
    postParameter();
  }

  void postParameter() {
    if (widget.photoUrls != null) {
      post = FeedPost(
        uid: widget.uid,
        content: widget.content,
        photoUrls: widget.photoUrls,
        dateTime: widget.dateTime,
        documentId: widget.documentId,
        currentUserId: widget.currentUserId,
      );
    } else {
      post = FeedPost(
        uid: widget.uid,
        content: widget.content,
        dateTime: widget.dateTime,
        documentId: widget.documentId,
        currentUserId: widget.currentUserId,
      );
    }
  }

  Future<void> handleLikeButtonPressed(
      List<dynamic> currentLikedBy, bool isCurrentlyLiked) async {
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('Posts').doc(widget.documentId);
    List<dynamic> updatedLikedBy = List.from(currentLikedBy);

    if (isCurrentlyLiked) {
      updatedLikedBy.remove(widget.currentUserId); // 좋아요 취소
    } else {
      updatedLikedBy.add(widget.currentUserId); // 좋아요 추가
    }

    await postRef.update({'likedBy': updatedLikedBy}); // Firestore 업데이트
    // UI 업데이트는 StreamBuilder가 담당하므로 여기서는 setState() 호출 없음
  }

  @override
  Widget build(BuildContext context) {
    final bool hasImages = widget.photoUrls?.isNotEmpty ?? false;
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Posts')
          .doc(widget.documentId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("오류가 발생했습니다."));
        }

        if (snapshot.hasData && snapshot.data!.data() != null) {
          var data = snapshot.data!.data() as Map<String, dynamic>;
          List<dynamic> likedBy = data['likedBy'] ?? [];
          bool isLiked = likedBy.contains(widget.currentUserId);
          int likesCount = likedBy.length;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                  onTap: () {
                    GoRouter.of(context).push('/postDetailPage', extra: post);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).cardColor,
                              backgroundImage: const AssetImage(
                                  'assets/images/tong_logo.png'),
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
                                    widget.uid,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.black87),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  timeago.format(widget.dateTime.toDate(),
                                      locale: "en_short"),
                                  style: GoogleFonts.mulish(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              widget.content,
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                            if (hasImages)
                              Column(children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                AspectRatio(
                                    aspectRatio: 1.0,
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        ClipRRect(
                                            // ClipRRect를 사용하여 이미지를 둥글게 잘라냅니다.
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: PageView.builder(
                                              onPageChanged: (value) {
                                                setState(() {
                                                  currentPage = value;
                                                });
                                              },
                                              itemCount:
                                                  widget.photoUrls!.length,
                                              itemBuilder: (context, index) {
                                                return Image.network(
                                                  widget.photoUrls![index],
                                                  fit: BoxFit.fitWidth,
                                                );
                                              },
                                            )),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(500)),
                                          child: Text(
                                            '${currentPage + 1} / ${widget.photoUrls!.length}', // 현재 페이지 / 전체 페이지
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                              ]),
                            Container(
                                color: Colors.transparent,
                                // Stack의 크기를 제한하는 Container
                                height: 33, // 적절한 높이 값 설정
                                width: double.infinity, // 너비를 화면 너비와 동일하게 설정
                                child: Align(
                                    alignment:
                                        Alignment.centerLeft, // Row를 오른쪽에 정렬
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: -15, // 아이콘과 텍스트 간의 간격을 조정
                                          top: 3, // 아이콘의 상단 위치 조정
                                          child: IconButton(
                                            icon: isLiked
                                                ? customIcon(
                                                    context,
                                                    icon: AppIcon.heartFill,
                                                    isTwitterIcon: true,
                                                    size: 15,
                                                    iconColor:
                                                        TwitterColor.ceriseRed,
                                                  )
                                                : customIcon(
                                                    context,
                                                    icon: AppIcon.heartEmpty,
                                                    isTwitterIcon: true,
                                                    size: 15,
                                                    iconColor: Colors.grey,
                                                  ),
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                              handleLikeButtonPressed(
                                                  likedBy, isLiked);
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          left: 18, // 아이콘 오른쪽에 텍스트를 위치시키기 위해 조정
                                          top: 15, // 아이콘과 텍스트의 세로 위치를 맞추기 위해 조정
                                          child: Text(
                                            likesCount.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 25, // 아이콘과 텍스트 간의 간격을 조정
                                          top: 3, // 다음 아이콘의 시작점을 조정하세요
                                          child: IconButton(
                                            onPressed: () {
                                              GoRouter.of(context).push(
                                                  '/postDetailPage',
                                                  extra: post);
                                            },
                                            icon: customIcon(
                                              context,
                                              icon: AppIcon.reply,
                                              isTwitterIcon: true,
                                              size: 15,
                                              iconColor: Colors.grey,
                                            ),
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                          ),
                                        ),
                                        const Positioned(
                                          left: 58, // 아이콘과 텍스트 간의 간격을 조정
                                          top:
                                              15, // 아이콘과 텍스트의 세로 위치를 맞추기 위해 조정하세요
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )))
                          ],
                        ))
                      ],
                    ),
                  )),
              Divider(
                color: Colors.grey[200],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
