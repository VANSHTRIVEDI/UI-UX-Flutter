import 'package:flutter/material.dart';
import 'package:smartui/util/samrt_device.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List mydevices = [
    //[smartDeviceName,icopath,powerstatus]
    ["Bulb", "lib/icons/light-bulb.png", true],
    ["Tv", "lib/icons/smart-tv.png", false],
    ["Fan", "lib/icons/fan.png", false],
    ["AC ", "lib/icons/air-conditioner.png", true],
  ];

  void powerswitchhaschange(bool value, index) {
    setState(() {
      mydevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //appbar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(Icons.person, color: Colors.grey[800])
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //welcome
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("hey"),
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),

            //smart devices

            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text("Smart Devices"),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                itemCount: mydevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemBuilder: (context, index) {
                  return SmartDevicebox(
                    smartDeviceName: mydevices[index][0],
                    iconpath: mydevices[index][1],
                    poweron: mydevices[index][2],
                    onChanged: (value) {
                      debugPrint("heyvansh");
                      powerswitchhaschange(value, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
