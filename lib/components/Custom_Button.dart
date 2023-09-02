// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({super.key, required this.label, required this.onPressed});
 final String label;
 final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.black,
        onPressed: () {
          onPressed();
        },
        child:  Text(
          label,
        ),
      ),
    );
  }
}
