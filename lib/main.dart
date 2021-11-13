// import 'dart:html';

import 'package:flutter/material.dart';

const request = "localhost";

void main() {
  runApp(const MyApp());
}

// stless comando de atalho para chamar app

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool l1 = false; // red
  bool l2 = false; // yellow
  bool l3 = false; // green
  bool b1 = false; // red
  bool b2 = false; // yellow
  bool b3 = false; // green

  bool bO1 = false;
  bool bO2 = false;
  bool bO3 = false;

  get child => null;

  void button1() {
    setState(() {
      b1 = !b1;
      l1 = !l1;
    });
  }

  void button2() {
    setState(() {
      b2 = !b2;
      l2 = !l2;
    });
  }

  void button3() {
    setState(() {
      b3 = !b3;
      l3 = !l3;
    });
  }

  // void increment() {
  //   setState(() {
  //     // if (!isFull) {
  //     //   count++;
  //     // }
  //   });
  //   // print(count);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      backgroundColor: Colors.black,
      body: Container(
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ledOn.png'),
            fit: BoxFit.fitWidth,
          ),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Monitor de nível lógico',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                l1
                    ? Image.asset(
                        'assets/images/ledOn.png',
                        width: 90,
                      )
                    : Image.asset(
                        'assets/images/ledOff.png',
                        width: 90,
                      ),
                const SizedBox(width: 16),
                l2
                    ? Image.asset(
                        'assets/images/ledOn.png',
                        width: 90,
                      )
                    : Image.asset(
                        'assets/images/ledOff.png',
                        width: 90,
                      ),
                const SizedBox(width: 16),
                l3
                    ? Image.asset(
                        'assets/images/ledOn.png',
                        width: 90,
                      )
                    : Image.asset(
                        'assets/images/ledOff.png',
                        width: 90,
                      ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {button1()},
                  child: bO1
                      ? Image.asset('assets/images/buttonOn.png', scale: 5)
                      : Image.asset('assets/images/buttonOff.png', scale: 5),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => {button2()},
                  child: bO2
                      ? Image.asset('assets/images/buttonOff.png', scale: 5)
                      : Image.asset('assets/images/buttonOff.png', scale: 5),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => {button3()},
                  child: bO3
                      ? Image.asset('assets/images/buttonOn.png', scale: 5)
                      : Image.asset('assets/images/buttonOff.png', scale: 5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
