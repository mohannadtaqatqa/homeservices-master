import 'package:flutter/material.dart';
import 'package:homeservice/core/utilti/Color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});
  getData() async {
    final prefs = await SharedPreferences.getInstance();
    String rating = prefs.getString("rating")!;
    String countRequest = prefs.getString("countRequest")!;
    String userName = prefs.getString("userName")!;
    String lastName = prefs.getString("lastName")!;

    return {
      "rating": rating,
      "countRequest": countRequest,
      "userName": userName,
      "lastName": lastName
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                print(snapshot.data);
                Map data = snapshot.data as Map;
                print(data);
                return Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Stack(children: [
                          Positioned(
                              child: Container(
                            height: 150,
                            color: mainColor,
                          )),
                          Positioned(
                            left: 20,
                            right: 20,
                            top: 50,
                            child: Container(
                                alignment: Alignment.center,
                                height: 240,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${data['userName']} ${data['lastName']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          fontFamily: 'Cairo'),
                                    ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "مستعد للموافقة على عمل",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontFamily: 'Cairo'),
                                            ),
                                            Text(
                                              "انت سوف تتلقى اشعارات عمل جديد",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 16,
                                                  fontFamily: 'Cairo'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Switch(
                                            value: true,
                                            activeColor: Colors.amber[400],
                                            thumbColor:
                                                MaterialStateProperty.all(
                                                    whiteColor),
                                            onChanged: (value) {})
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          Positioned(
                              top: 0,
                              right: 50,
                              left: 50,
                              child: CircleAvatar(
                                radius: 55,
                                child: Icon(
                                  Icons.person,
                                  size: MediaQuery.of(context).size.width * 0.1,
                                ),
                              )),
                        ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.refresh,
                                  color: mainColor,
                                  size: 60,
                                ),
                                const Text(
                                  "5",
                                  style: TextStyle(fontFamily: 'Cairo'),
                                ),
                                Text(
                                  "طلب اعادة عمل",
                                  style: TextStyle(
                                      color: greyColor, fontFamily: 'Cairo'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.work,
                                  color: mainColor,
                                  size: 60,
                                ),
                                const Text(
                                  "5",
                                  style: TextStyle(fontFamily: 'Cairo'),
                                ),
                                Text(
                                  "اعمال جديدة",
                                  style: TextStyle(
                                      color: greyColor, fontFamily: "Cairo"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 250,
                        color: whiteColor,
                        child: Row(textDirection: TextDirection.ltr, children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star_half,
                            textDirection: TextDirection.ltr,
                            size: 50,
                            color: mainColor,
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text("${data['rating']}",
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Cairo")),
                                Text("تقييم",
                                    style: TextStyle(
                                        color: greyColor, fontFamily: "Cairo"))
                              ],
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 250,
                        color: whiteColor,
                        child: Row(textDirection: TextDirection.ltr, children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.thumb_up,
                            textDirection: TextDirection.ltr,
                            size: 45,
                            color: mainColor,
                          ),
                          const SizedBox(
                            width: 23,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text("${data['countRequest']}",
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Cairo")),
                                Text("طلبات تم اكمالها",
                                    style: TextStyle(
                                        color: greyColor, fontFamily: "Cairo"))
                              ],
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
