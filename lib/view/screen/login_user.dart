import 'package:flutter/material.dart';
import 'package:homeservice/view/screen/login.dart';
import 'package:homeservice/view/widgit/login_provider.dart';

class Login_User extends StatelessWidget {
  const Login_User({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(child: Text('تسجيل الدخول كعميل')),
    Tab(child:Text( "تسجيل الدخول كمقدم خدمة")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            tabs: myTabs,
          ),
        ),
        body: const TabBarView(children: [
          login(),
          login_provider()
        ]
            // myTabs.map((Tab tab) {
            //   final String label = tab.text!.toLowerCase();
            //   return Center(
            //     child: Text(
            //       'This is the $label tab',
            //       style: const TextStyle(fontSize: 36),
            //     ),
            //   );
            // }).toList(),
            ),
      ),
    );
  }
}
