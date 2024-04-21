import 'package:flutter/material.dart';
import 'package:homeservice/core/function/DateUtil.dart';
import 'package:intl/intl.dart';

class Datepicker extends StatefulWidget {
  Datepicker(
      {super.key,
      required this.selectedDateController,
      required this.DescriptionController});

  final TextEditingController DescriptionController;
  final TextEditingController selectedDateController;

  @override
  State<Datepicker> createState() => _DatepickerState();
}
class _DatepickerState extends State<Datepicker> {
   DateTime? dateValue;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
          foregroundColor: Colors.blue[300],
          // fixedSize: const Size(173, 45),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('اختر تاريخ الحجز'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.calendar_month_outlined),
                          onPressed: () async {
                            final DateTime now = DateTime.now();
                            final DateTime firstDate =
                                DateTime(now.year, now.month, now.day);
                            final DateTime lastDate = DateTime(
                              now.year + 3,
                            );
                            final datepicker = await showDatePicker(
                                initialDate: now,
                                context: context,
                                firstDate: firstDate,
                                lastDate: lastDate);
                            setState(() {
                              if (datepicker != null) {
                                dateValue = datepicker;
                                widget.selectedDateController.text =
                                    "${(datepicker)}";
                                // widget.controller.text =
                                //     formatter.format(datepicker);
                              }
                            });
                            print(
                                " date is ${widget.selectedDateController.text}");
                            print("${dateValue}");
                          },
                        ),
                        Text(
                          dateValue == null
                              ? "date"
                              : DateUtil.formatDate(dateValue!.toString()),
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: widget.DescriptionController,
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: "وصف"),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'الغاء'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('حجز'),
                ),
              ],
            ),
          );
        },
        icon: const Icon(
          Icons.calendar_month_outlined,
          size: 40,
        ));
  }
}
