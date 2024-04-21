import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/core/utilti/Color.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/l10n.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  Future<List<dynamic>> getNotification() async {
    final prefs = await SharedPreferences.getInstance();
    int userId = int.parse(prefs.getString('userId')!);
    final response =
        await get(Uri.parse('http://10.0.2.2:5000/notification/$userId'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final resBody = jsonDecode(response.body);
      print(resBody);
      return resBody;
    } else {
      throw Exception('Failed to fetch notifications: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: mainColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(S.of(context).Notifications, style: Theme.of(context).textTheme.headline5),
              Container(
                padding: const EdgeInsets.all(10),
                height: 522,
                margin: const EdgeInsets.only(top: 10),
                width: 500,
                child: FutureBuilder<List<dynamic>>(
                    future: getNotification(),
                    builder: (context,  AsyncSnapshot<List<dynamic>> snapshot) {
                      List notificationData = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: notificationData.length,
                        itemBuilder: ( context,  index) =>
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          height: 80,
                          child: ListTile(
                            title: Text(notificationData[index]['notification_title'], style: const TextStyle(fontFamily: 'Cairo', fontSize: 20),),
                            subtitle: Text(notificationData[index]['notification_body'], style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
