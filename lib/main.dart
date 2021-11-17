// import 'dart:html';
// import 'dart:io';
// import 'package:async/async.dart';
// import 'package:flutter/services.dart';
// import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var end = '192.168.0.147'; // amo
// var end = '192.168.100.150'; // casa
// var url = Uri.parse('http://192.168.100.150:3000/');
var url = Uri.parse('http://' + end + ':3000/');

void main() {
  runApp(const MyApp());
  chamada();
}

void chamada() async {}

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
  static Future<String> getFutureDados() async => await Future.delayed(
        const Duration(seconds: 1),
        () async {
          http.Response response = await http.get(url);

          return response.body.toString();
        },
      );

  String messageReceived = "000";
  String messageSend = "000";
  bool l1 = false; // red
  bool l2 = false; // yellow
  bool l3 = false; // green
  bool b1 = false; // red
  bool b2 = false; // yellow
  bool b3 = false; // green

  bool dataDiferent = false;

  bool bO1 = false;
  bool bO2 = false;
  bool bO3 = false;

  get child => null;

  void atualiza(String messageReceived) {
    if (messageReceived[0] == '1') {
      setState(() {
        l1 = !l1;
      });
    } else {}

    if (messageReceived[1] == '1') {
      setState(() {
        l2 = !l2;
      });
    }

    if (messageReceived[2] == '1') {
      setState(() {
        l3 = !l3;
      });
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
    if (l1) {
      messageSend = "1";
    } else {
      messageSend = "0";
    }

    if (l2) {
      messageSend += "1";
    } else {
      messageSend += "0";
    }

    if (l3) {
      messageSend += "1";
    } else {
      messageSend += "0";
    }

    messageSend;

    print(messageSend);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Container(
            width: 250,
            height: 15,
            child: FutureBuilder<String>(
              future: getFutureDados(),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.hasData) {
                  messageReceived = snapshot.data.toString();
                  // ignore: avoid_print
                  print(':)');
                  atualiza(messageReceived);
                } else if (snapshot.hasError) {
                  // ignore: avoid_print
                  print(':(');
                } else {
                  // ignore: avoid_print
                  print(':|');
                }
                return Row();
              },
            ),
          ),
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
    );
  }
}
