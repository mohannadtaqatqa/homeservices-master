import 'package:flutter/material.dart';
import 'package:homeservice/view/screen/appint_user.dart';
import 'package:homeservice/view/screen/request_page.dart';

class Appointement extends StatelessWidget {
  const Appointement({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(child:Text( 'طلباتي')),
    Tab(child: Text('مواعيدي')),
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
          Request(),
          AppointmentPage()
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
