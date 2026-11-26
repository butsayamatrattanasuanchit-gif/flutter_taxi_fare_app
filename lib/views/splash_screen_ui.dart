import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // หน่วงเวลา 3 วินาทีแล้วเปิดไปหน้า HomeUI()
    Future.delayed(
        // ระยะเวลาที่หน่วง
        Duration(
          seconds: 3,
        ),
        // เมื่อครบแล้วให้ทำอะไร -> เปิดไปหน้า HomeUI() แบบย้อนกลับไม่ได้
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TaxiFareUi(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/taxi.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Taxi Fare Calculator',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: MediaQuery.of(context).size.height * 0.028,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.amberAccent,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'คำนวณค่าโดยสารแท็กซี่',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: MediaQuery.of(context).size.height * 0.023,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              color: Colors.amberAccent,
              strokeWidth: MediaQuery.of(context).size.width * 0.012,
              strokeCap: StrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
