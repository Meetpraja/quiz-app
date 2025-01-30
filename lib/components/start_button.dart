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
        margin: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Color.fromRGBO(15, 70, 154, 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(Icons.navigate_before_sharp,color: Colors.white,size: 25,),
            Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
          ],
        )
      ),
    );
  }
}
