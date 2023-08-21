// 메인


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../subPage/subPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyhomePageState();
}

class MyhomePageState extends State<MyHomePage> {
  int numbers = 0;
  int currentIndex = 0;


  // 네비 게이션


  @override
  Widget build(BuildContext context) {
    // Scaffold 흰색 배경으로 나오게 한다
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '메인홈',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '메인 콘텐츠',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${numbers}',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // 페이지 이동
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SubPage()));
                      },
                      child: Text('서브페이지_1')),
                  TextButton(onPressed: () {}, child: Text('기본 글자 버튼')),
                  OutlinedButton(onPressed: () {}, child: Text('아웃 라인 버튼')),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (kDebugMode) {
              print('클릭');
            }
            // 화면 숫자 증가
            setState(() {
              numbers++;
            });
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      print('홈');
                      // 페이지 이동
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    iconSize: 100,
                    icon: Column(
                      children: [
                        Icon(
                          Icons.home,
                          size: 25,
                        ),
                        Text(
                          '홈',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                IconButton(
                    onPressed: () {
                      // 페이지 이동
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SubPage()));
                    },
                    icon: Column(
                      children: [
                        Icon(Icons.accessibility,size: 25,),
                        Text(
                          '서브 페이지',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                ),
                IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [
                      Icon(Icons.person,size: 25,),
                      Text(
                        '내 정보',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Column(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.settings,size: 25,),
                            Text(
                              '설정',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
        ));
  }
}
