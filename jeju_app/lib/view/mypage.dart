import 'package:flutter/material.dart';
import 'package:jeju_app/model/store.dart';
import 'package:jeju_app/view/mypage_preferences.dart';
import 'package:jeju_app/view/mypage_store.dart';
import 'package:jeju_app/view/sales_record_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late String id = "";
  late String name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('uId'))!;
      name = (prefs.getString('uName'))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.white10,
        title: const Text(''),
        // title: const Text('My Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPage_Preferences(),
                  ),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          left: 9,
                          right: 9,
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 20),
                      child: Text(
                        "$name ??? ???????????????.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  color: Colors.black38,
                  thickness: 0.5,
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 17, left: 9, right: 9, bottom: 15),
                      child: Text(
                        '?????? ?????? ??????',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          // _store();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyPage_Store(),
                            ),
                          );
                        },
                        child: const Text('?????? ??????',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SalesRecordPage(),
                            ),
                          );
                        },
                        child: const Text('?????? ????????????',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          //     Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>  (),
                          //   ),
                          // );
                        },
                        child: const Text('????????? ?????? ????????????',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          //--
                        },
                        child: const Text('?????? ?????????',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
