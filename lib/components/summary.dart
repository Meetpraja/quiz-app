import 'package:flutter/material.dart';
import 'package:quiz_app/components/summary_item.dart';

class Summary extends StatelessWidget {
  const Summary({super.key,required this.summaryData});

  final List<Map<String, dynamic>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );;
  }
}
