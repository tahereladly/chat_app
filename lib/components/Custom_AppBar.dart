// ignore: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({Key? key,this.logo, required this.title, required this.background}) : super(key: key);
   @override
  Size get preferredSize => const Size.fromHeight(60) ;

   final String title;
   String? logo;
   final Color background;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      backgroundColor: background,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [

          Image.asset(logo!,height: 50,),
          Text(
            title,
            style: const TextStyle(color: Color(0xffB4D5DE),),
          ),
        ],
      ),
    ),
    );
  }


}




