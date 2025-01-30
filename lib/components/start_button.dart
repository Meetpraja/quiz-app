import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.title,
    required this.onStart
  });

  final String title;
  final void Function() onStart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onStart,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
