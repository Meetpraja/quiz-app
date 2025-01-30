import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.title,
    required this.onTap
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        splashColor: Colors.grey,
        borderRadius:BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Color.fromRGBO(86, 204, 242, 1.0)
          ),
          child: Text(title,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}
