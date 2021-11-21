// import 'dart:html';
// import 'dart:io';
// import 'package:async/async.dart';
// import 'package:flutter/services.dart';
// import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// var end = '192.168.0.147'; // amo
// var end = '192.168.100.150'; // casa
var end = '192.168.196.63'; // casa
// var end = '191.52.128.18'; // unoesc
// var url = Uri.parse('http://192.168.100.150:3000/');
var url = Uri.parse('http://' + end + ':3000/');

void main() {
  runApp(const MyApp());
}

// void chamada() async {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String messageReceived = "0";
  String messageSend = "0";
  bool l1 = false; // red
  bool l2 = false; // yellow
  bool l3 = false; // green
  bool b1 = false; // red
  bool b2 = false; // yellow
  bool b3 = false; // green
  // bool control = false;

  get child => null;

  contador() {
    Timer.periodic(
        const Duration(
          milliseconds: 50,
        ), (Timer t) async {
      http.Response response = await http.get(url);
      if (response.body.isNotEmpty) {
        messageReceived = response.body.toString();
        atualiza();
      }
    });
  }

  Future<void> atualiza() async {
    if (messageReceived == 'R') {
      button1();
      messageReceived = '0';
    }
    if (messageReceived == 'Y') {
      button2();
      messageReceived = '0';
    }
    if (messageReceived == 'G') {
      button3();
      messageReceived = '0';
    }
  }

  void button1() {
    setState(() {
      b1 = !b1;
      l1 = !l1;
      send();
    });
  }

  void button2() {
    setState(() {
      b2 = !b2;
      l2 = !l2;
      send();
    });
  }

  void button3() {
    setState(() {
      b3 = !b3;
      l3 = !l3;
      send();
    });
  }

  void send() {
    if (!l3 && !l2 && !l1) {
      messageSend = 'A';
    }
    if (!l3 && !l2 && l1) {
      messageSend = 'B';
    }
    if (!l3 && l2 && !l1) {
      messageSend = 'C';
    }
    if (!l3 && l2 && l1) {
      messageSend = 'D';
    }
    if (l3 && !l2 && !l1) {
      messageSend = 'E';
    }
    if (l3 && !l2 && l1) {
      messageSend = 'F';
    }
    if (l3 && l2 && !l1) {
      messageSend = 'G';
    }
    if (l3 && l2 && l1) {
      messageSend = 'H';
    }

    messageSend;

    // ignore: avoid_print
    // print(messageSend);

    http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'data': messageSend,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
        child: SizedBox(
          // height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Monitor de nível lógico',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  l1
                      ? Image.asset(
                          'assets/images/ledRed.png',
                          width: 90,
                        )
                      : Image.asset(
                          'assets/images/ledOff.png',
                          width: 90,
                        ),
                  const SizedBox(width: 16),
                  l2
                      ? Image.asset(
                          'assets/images/ledYellow.png',
                          width: 90,
                        )
                      : Image.asset(
                          'assets/images/ledOff.png',
                          width: 90,
                        ),
                  const SizedBox(width: 16),
                  l3
                      ? Image.asset(
                          'assets/images/ledGreen.png',
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
                    child: Image.asset('assets/images/buttonOff.png', scale: 5),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () => {button2()},
                    child: Image.asset('assets/images/buttonOff.png', scale: 5),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () => {button3()},
                    child: Image.asset('assets/images/buttonOff.png', scale: 5),
                  ),
                ],
              ),
              const SizedBox(height: 130),
              GestureDetector(
                onTap: () => {contador()},
                child: Image.asset('assets/images/loading.png', scale: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<String> getFutureDados = Future<String>.delayed(
  //   const Duration(seconds: 0),
  //   () async {
  //     http.Response response = await http.get(url);

  //     return response.body.toString();
  //   },
  // );

            // child: FutureBuilder<String>(
            //   future: getFutureDados,
            //   builder: (
            //     BuildContext context,
            //     AsyncSnapshot<String> snapshot,
            //   ) {
            //     if (snapshot.hasData) {
            //       messageReceived = snapshot.data.toString();
            //       atualiza();
            //       // ignore: avoid_print
            //       print(':)');
            //       // Timer.periodic(
            //       //     const Duration(milliseconds: 500), (Timer t) => {});
            //       print(messageReceived);
            //     } else if (snapshot.hasError) {
            //       // ignore: avoid_print
            //       print(':(');
            //     } else {
            //       // ignore: avoid_print
            //       print(':|');
            //     }
            //     return const SizedBox();
            //   },
            // ),


// child: bO1
//     ? Image.asset('assets/images/buttonOn.png', scale: 5)
//     : Image.asset('assets/images/buttonOff.png', scale: 5),

// child: bO2
//     ? Image.asset('assets/images/buttonOff.png', scale: 5)
//     : Image.asset('assets/images/buttonOff.png', scale: 5),

// child: bO3
//     ? Image.asset('assets/images/buttonOn.png', scale: 5)
//     : Image.asset('assets/images/buttonOff.png', scale: 5),
