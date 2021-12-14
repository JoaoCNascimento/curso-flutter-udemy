import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home(),));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int count = 0;

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.w700, color: isFull ? Colors.red : Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty ? Color.fromRGBO(255, 0, 0, 0.15) : Color.fromRGBO(255, 255, 255, 0.50),
                          fixedSize: const Size(120, 120),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: isEmpty ? null : decrement,
                      child: Text(
                        'Saiu',
                        style: TextStyle(color: isEmpty ? Color.fromRGBO(120, 120, 120, 1) : Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(width: 32),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isFull ? Color.fromRGBO(255, 0, 0, 0.15) : Color.fromRGBO(255, 255, 255, 0.50),
                          fixedSize: const Size(120, 120),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      onPressed: isFull ? null : increment,
                      child: Text(
                        'Entrou',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
