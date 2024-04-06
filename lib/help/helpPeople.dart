import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

class ImageDialog_HYO extends StatelessWidget {
  const ImageDialog_HYO({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/hyo.jpg'),
                fit: BoxFit.contain)),
      ),
    );
  }
}

class ImageDialog_Yubin extends StatelessWidget {
  const ImageDialog_Yubin({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/yubin.jpg'),
                fit: BoxFit.contain)),
      ),
    );
  }
}

class HelpPeople extends StatefulWidget {
  const HelpPeople({super.key});

  @override
  State<HelpPeople> createState() => _HelpPeopleState();
}

class _HelpPeopleState extends State<HelpPeople> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Scaffold를 사용하여 화면의 구조를 정의
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '도움 주신 분들',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black87),
          ),
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Container(
              color: Colors.grey.shade200,
              height: 1.0,
            ),
          ), // 상단 앱 바에 표시될 타이틀 설정
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            const Text('Made by',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            const GradientAnimationText(
              text: Text('11기 김성욱\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              colors: [
                Color(0xff8f00ff), // violet
                Colors.indigo,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
              ],
              duration: Duration(seconds: 5),
            ),
            const Text('Illustrated by',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Text('11기 장윤정\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            const Text('Music by',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Text('12.5기 김태리\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            const Text('Idea by',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Text('10기 권종우 (12기 회장), 12.5기 신유진\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            const Text('Sponsored by',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ImageDialog_HYO();
                    });
              },
              child: const GradientAnimationText(
                text: Text('유탄발사기\n',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
                colors: [
                  Color(0xff8f00ff), // violet
                  Colors.indigo,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.orange,
                  Colors.red,
                ],
                duration: Duration(seconds: 5),
              ),
            ),
            const GradientAnimationText(
              text: Text('공군851일병임두빈\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              colors: [
                Color(0xff8f00ff), // violet
                Colors.indigo,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red,
              ],
              duration: Duration(seconds: 5),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ImageDialog_Yubin();
                    });
              },
              child: const GradientAnimationText(
                text: Text('최유빈\n',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
                colors: [
                  Color(0xff8f00ff), // violet
                  Colors.indigo,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.orange,
                  Colors.red,
                ],
                duration: Duration(seconds: 5),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                          content: Text(
                        'Atlas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ));
                    });
              },
              child: const GradientAnimationText(
                text: Text('김태리\n',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
                colors: [
                  Color(0xff8f00ff), // violet
                  Colors.indigo,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.orange,
                  Colors.red,
                ],
                duration: Duration(seconds: 5),
              ),
            ),
            Text('11기 양경은 (12기 부회장)\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('한무당\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('익명의 염소\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('안소연\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('전역하고싶은유승빈\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('허지원\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('마당발블림빙\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('이민주\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('윤석열\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
            Text('의룡인\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[700]),
                textAlign: TextAlign.center),
          ],
        ))));
  }
}
