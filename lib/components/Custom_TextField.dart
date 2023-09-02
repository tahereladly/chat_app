// ignore: file_names
import 'package:chat_app/components/Constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.isVisible, this.onSubmitted,this.suffix,this.style,  this.hintText,this.labelText,this.type,this.prefix,  this.controller, }) ;
String? hintText;
String? labelText;
TextInputType? type;
Widget? prefix;
Widget? suffix;
TextStyle? style;
Function(String)? onSubmitted;
 TextEditingController? controller;
 bool? isVisible  ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:isVisible! ,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: style,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.white,
            )),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        prefixIcon: prefix,
          prefixIconColor: Colors.white,
        suffixIcon: suffix,
        suffixIconColor: kBackGroundColor
      ),
      onTap: () {},
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if(value!.isEmpty)
        {
          return 'field is required';
        }
      },
      onFieldSubmitted: (data){
        onSubmitted!(data);
      },

    );
  }
}

class ImageForm extends StatelessWidget {
  const ImageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Image.asset(
        'assets/images/scholar.png',
      ),
    );
  }
}

