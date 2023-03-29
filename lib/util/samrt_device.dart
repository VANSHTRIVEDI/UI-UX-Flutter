import "dart:math";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class SmartDevicebox extends StatelessWidget {
  final String smartDeviceName;
  final String iconpath;
  bool poweron;
  void Function(bool)? onChanged;

  SmartDevicebox({
    super.key,
    required this.smartDeviceName,
    required this.iconpath,
    required this.poweron,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: poweron ? Color.fromARGB(255, 21, 19, 19) : Colors.grey[200],
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  iconpath,
                  color: poweron ? Colors.white : Colors.black,
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 25)),
                    Text(
                      smartDeviceName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: poweron ? Colors.white : Colors.black),
                    ),
                    Transform.rotate(
                      angle: pi / 2,
                      child:
                          CupertinoSwitch(value: poweron, onChanged: onChanged),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
