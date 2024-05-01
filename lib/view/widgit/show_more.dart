import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeservice/core/utilti/Color.dart';
import 'package:homeservice/data/model/provider_page.dart';
import 'package:http/http.dart' as http;

class All_service extends StatefulWidget {
  const All_service({super.key});

  @override
  State<All_service> createState() => _All_serviceState();
}

class _All_serviceState extends State<All_service> {
  Future<List<dynamic>> fetchServices() async {
    
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:5000/service'));
      if (response.statusCode == 200) {
        List<dynamic> resbody = jsonDecode(response.body);
        return resbody;
      } else {
        throw Exception('Failed to load services');
      }
    } catch (e) {
      throw Exception('Failed to load services: $e');
    } finally {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الخدمات في التطبيق ",
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 25,
            )),
            
      ),
      body: Column(
        children: [
           FutureBuilder<List<dynamic>>(
                    future: fetchServices(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(color: mainColor),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1 / 0.75,
                          ),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const provider_list(), arguments: snapshot.data![index]['servcie_id']);
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                width: 25,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 177, 168, 168),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                    BoxShadow(
                                      color: Color.fromARGB(255, 254, 253, 253),
                                      offset: Offset(-5, 0),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data?[index]['servcie_name'] ?? '',
                                      style: const TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
        ],
      ),
    );
  }
}