import 'package:flutter/material.dart';
import 'package:homeservice/core/utilti/Color.dart'; 

class Appointment extends StatelessWidget {
  final String fname;
  final String lname;
  final String address;
  final String city;
  final String des;
  final String date;
  final String servname;
  final String phone;

  const Appointment({
    super.key,
    required this.fname,
    required this.lname,
    required this.address,
    required this.city,
    required this.des,
    required this.date,
    required this.servname,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        padding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  size: 64,
                  color: mainColor,
                ),
                const SizedBox(width: 30),
                Text(
                  "$fname $lname",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    "$city - $address",
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Phone:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Text(
                  phone,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Service:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Text(
                  servname,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Description:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    des,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Date:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Text(
                  date,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}