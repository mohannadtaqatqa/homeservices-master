import 'package:flutter/material.dart';
import 'package:homeservice/core/function/DateUtil.dart';
import 'package:http/http.dart';

class cardBoking extends StatefulWidget {
  final String name1;
  final String name2;
  final String phone;
  final String servicename;
  final String datereq;
  final String descrbtion;
  final String city;
  final String address;
  //final OnTap ontap;
  final int requestid;
  final int status;
  final String newDate;
  const cardBoking(
      {super.key,
      required this.name1,
      required this.name2,
      required this.phone,
      required this.servicename,
      required this.datereq,
      required this.descrbtion,
      required this.city,
      required this.address,
      required this.requestid,
      required this.status,
      required this.newDate});

  @override
  State<cardBoking> createState() => _cardBokingState();
}

class _cardBokingState extends State<cardBoking> {
  Future<void> _accept(requestid) async {
    await post(Uri.parse('http://10.0.2.2:5000/approverequest/$requestid'));
  }

  Future<void> _reject(requestid) async {
    await post(Uri.parse('http://10.0.2.2:5000/rejectrequest/$requestid'));
  }

  int status = 3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Container(
          margin: const EdgeInsets.fromLTRB(020, 0, 20, 15),
          padding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(26, 153, 206, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.person,
              size: 64,
              color: Colors.white,
            ),
            const SizedBox(
              width: 22,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "${widget.name1} ${widget.name2}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text("${widget.phone}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(" ${widget.servicename}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ]),
            const Spacer(),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Center(
                            child: Text('تفاصيل الموعد'),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                    ' مقدم الخدمة:  ${widget.name1} ${widget.name2}'),
                                Text('الخدمة: ${widget.servicename}'),
                                if (widget.status != 3)
                                  Text(
                                      'التاريخ: ${DateUtil.formatDate(widget.datereq)}'),
                                Text('الوصف: ${widget.descrbtion}'),
                                Text(
                                    'العنوان :${widget.city}-${widget.address} '),
                                if (widget.status == 3)
                                  Text(
                                      'التاريخ المقترج  :${DateUtil.formatDate(widget.newDate)}'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            if (widget.status == 3)
                              TextButton(
                                onPressed: () {
                                  _accept(widget.requestid);
                                 
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Colors.green, // Set text color
                                ),
                                child: const Text('قبول'),
                              ),
                            if (widget.status == 3)
                              TextButton(
                                  onPressed: () {
                                    _reject(widget.requestid);
                                   
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('رفض')),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('اغلاق'),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.arrow_forward_ios,
                    size: 30, weight: 1000, color: Colors.white))
          ])),
    );
  }
}