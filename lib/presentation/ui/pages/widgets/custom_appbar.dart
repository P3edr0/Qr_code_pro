import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context, String title, Color pageColor) {
  return AppBar(actions: [
    Container(
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.center,
      color: pageColor,
    )
  ]);
}
