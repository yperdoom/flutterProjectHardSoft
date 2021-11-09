import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// stless comando de atalho para chamar app

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int count = 0;
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;
  String messageCabaco = "";

  get child => null;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      if (!isFull) {
        count++;
      }
    });
    print(count);
  }

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
            Text(
              isFull ? 'Lotado' : 'Monitoring',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 80,
                color: isFull ? Colors.red : Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 38),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ledOff.png',
                  width: 90,
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/ledOff.png',
                  width: 90,
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/ledOff.png',
                  width: 90,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
