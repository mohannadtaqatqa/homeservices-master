
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utilti/Color.dart';
import '../../generated/l10n.dart';

class Archives extends StatelessWidget {
  const Archives({super.key});
  getInfoArchive() async{ 
    final prefs = await SharedPreferences.getInstance();
    int userId = int.parse(prefs.getString('userId')!);
    final response = await get(Uri.parse('http://10.0.2.2:5000/GETArchive/customer/:$userId'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Archive),
      ),
      body: SafeArea(child: Container(
        height: MediaQuery.sizeOf(context).height*.39,
        margin:const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Icon(
              Icons.person,
              size: 80,
              color: mainColor,
            ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          flex: 10,
          child: Container(
            decoration: BoxDecoration(
            ),
            child: Column(
              
              children: [  Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                "  مهند طقاطقة",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    "بيت لحم - بيت فجار",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).phoneNumber}:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Text(
                  "widget.phone",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).theService}:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Text(
                  "widget.servname",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).description}:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    "widget.des",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).date}:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Text(
                  "widget.date",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
              ],
            ),
          ),
        )
        
                  ],
        ),
      )),
    );
  }
}