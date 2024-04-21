import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Assuming 'Color' provides color constants
import 'package:homeservice/view/widgit/appointment.dart'; // Assuming 'appointment' widget displays appointment details
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Use http for brevity

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});


  Future<List<Map<String, dynamic>>> fetchAppointments() async {
    try {
        final prefs = await SharedPreferences.getInstance();
    int userId = int.parse(prefs.getString('userId')!);
      final response = await http.get(Uri.parse('http://10.0.2.2:5000/appointment/user/$userId'));
      if (response.statusCode == 200) {
        final List resBody = jsonDecode(response.body);
        return resBody.cast<Map<String, dynamic>>(); 
      } else {
        
        throw Exception('Failed to fetch appointments: ${response.statusCode}');
      }
    } catch (error) {
      // after will do this 
      rethrow; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: LayoutBuilder(
        builder: (context, constraints) => FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchAppointments(),
          builder: (context, snapshot) {
            // if (snapshot.hasError) {
            //   return Center(
            //     child: Text(
            //       'Error fetching appointments: ${snapshot.error}', 
            //       style: TextStyle(color: Colors.red),
            //     ),
            //   );
            // }

            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/404.jpg',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 20),
                    Text('You don\'t have any appointments yet.', style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              );
            }

            if (snapshot.hasData) {
              final appointments = snapshot.data!;
              return ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) => Appointment(
                 
                  fname: appointments[index]['provider_fname'],
                  lname: appointments[index]['provider_lname'],
                  city: appointments[index]['city'],
                  address: appointments[index]['address'],
                  des: appointments[index]['description'],
                  date: appointments[index]['date'],
                  phone: appointments[index]['provider_phone'],
                  servname: appointments[index]['servcie_name'],
                ),
              );
            }

            
            return Center(
              child: Column(
                children: [
                  Image.asset(
                    'images/404.jpg',
                    width: 400,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                    Text('You don\'t have any appointments yet.',
                        style: Theme.of(context).textTheme.headline6),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}