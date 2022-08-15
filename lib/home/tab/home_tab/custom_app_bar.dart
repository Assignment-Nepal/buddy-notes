import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Ink.image(
            image: NetworkImage(''
                "https://png.pngtree.com/element_pic/00/16/07/115783931601b5c.jpg"),
            fit: BoxFit.cover,
            width: 60,
            height: 40,
          ),
          Row(children: [
            Icon(Icons.search),
            SizedBox(width: 16,),
            Icon(Icons.notifications_active),
          ],)
        ],
      ),
    );
  }
}