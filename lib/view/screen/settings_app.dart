import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/core/utilti/Color.dart';
import 'package:homeservice/view/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../generated/l10n.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // color: (Colors.grey[200]),
        margin: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: const CircleAvatar(
                radius: 70,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              "مهند طقاطقة",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo'),
            ),
            const Divider(),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple[200],
                  child: const Icon(Icons.dark_mode),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Text("الوضع الليلي",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo')),
                const SizedBox(
                  width: 80,
                ),
                Switch(value: false, onChanged: (value) {})
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "  عام",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green[200],
                          child: const Icon(Icons.person),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("اعدادات الحساب",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo')),
                            Text("اعدادات الحساب",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo')),
                          ],
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.yellow[200],
                          child: const Icon(Icons.language),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Text("الارشيف",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo')),
                        const SizedBox(
                          width: 126,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    InkWell(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.clear();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (ctx) => const login()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red[200],
                          child: const Icon(Icons.logout),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Text("تسجيل الخروج",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo')),
                        const SizedBox(
                          width: 100,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ]),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
// Text(S.of(context).Settings),
            //  Container(
            //   color: whiteColor,
            //   margin: EdgeInsets.only(top: 80),
            //   alignment: Alignment.center,
            //   child: CircleAvatar(
            //     //backgroundImage: AssetImage('image/back.jpg'),
            //     radius: 40,
            //   ),
            // ),
            // const Text(
            //   'NAME',
            //   style: TextStyle(
            //       color: Colors.blue,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 2.0),
            // ),
            // const SizedBox(height: 10.0),
            // const Text(
            //   'Karim atrash',
            //   style: TextStyle(
            //       color: Colors.black, fontSize: 20.0, letterSpacing: 1.0),
            // ),
            // const SizedBox(height: 15.0),
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.email,
            //       color: Colors.grey,
            //     ),
            //     const SizedBox(width: 15),
            //     Text(
            //       'atrashkareem@gmail.com',
            //       style: TextStyle(
            //           color: Colors.grey[400],
            //           fontSize: 18.0,
            //           letterSpacing: 1.0),
            //     )
            //   ],
            // ),
            // Divider(
            //   height: 60,
            //   color: Colors.grey[800],
            // ),
            // TextButton.icon(
            //   onPressed: () {},
            //   label: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Manege Profil',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //       Icon(
            //         Icons.arrow_forward_ios,
            //         color: Colors.black,
            //       )
            //     ],
            //   ),
            //   icon: const Icon(
            //     Icons.shopping_bag_outlined,
            //     color: Colors.black,
            //   ),
            // ),
            // TextButton.icon(
            //   onPressed: () {},
            //   label: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Order invoice',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //       Icon(
            //         Icons.arrow_forward_ios,
            //         color: Colors.black,
            //       )
            //     ],
            //   ),
            //   icon: const Icon(
            //     Icons.shopping_bag_outlined,
            //     color: Colors.black,
            //   ),
            // ),
            // TextButton.icon(
            //   onPressed: () {},
            //   label: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Placed order',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //       Icon(
            //         Icons.arrow_forward_ios,
            //         color: Colors.black,
            //       )
            //     ],
            //   ),
            //   icon: const Icon(
            //     Icons.shopping_bag_outlined,
            //     color: Colors.black,
            //   ),
            // ),
            // TextButton.icon(
            //   onPressed: () {},
            //   label: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'About',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //       Icon(
            //         Icons.arrow_forward_ios,
            //         color: Colors.black,
            //       )
            //     ],
            //   ),
            //   icon: const Icon(
            //     CupertinoIcons.exclamationmark_circle,
            //     color: Colors.black,
            //   ),
            // ),
            // const SizedBox(
            //   height: 100,
            // ),
            // TextButton.icon(
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.blue[900],
            //     fixedSize: const Size(400.0, 50.0),
            //   ),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/login');
            //   },
            //   label: const Text(
            //     'LogOut',
            //     style: TextStyle(color: Colors.white, fontSize: 15),
            //   ),
            //   icon: const Icon(
            //     Icons.exit_to_app_outlined,
            //     color: Colors.white,
            //   ),
            // )