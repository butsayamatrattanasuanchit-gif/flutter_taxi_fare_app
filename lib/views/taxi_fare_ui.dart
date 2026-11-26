import 'package:flutter/material.dart';

class TaxiFareUi extends StatefulWidget {
  const TaxiFareUi({super.key});

  @override
  State<TaxiFareUi> createState() => _TaxiFareUiState();
}

class _TaxiFareUiState extends State<TaxiFareUi> {
  // สร้างตัวควบคุม TextField
  TextEditingController distanceCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();

  // สร้างตัวแปรแสดงค่าโดยสารแท็กซี่
  String showFare = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Taxi Fare',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/taxi.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'คำนวณค่าโดยสารแท็กซี่',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ระยะทาง (กิโลเมตร)🛣️',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: distanceCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfffffcbf),
                    ),
                  ),
                  hintText: 'กรุณากรอกระยะทาง',
                  fillColor: Color(0xfffffcbf),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'เวลารถติด (นาที)🚦',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: timeCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfffffcbf),
                    ),
                  ),
                  hintText: 'กรุณากรอกเวลารถติด',
                  fillColor: Color(0xfffffcbf),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate input ก่อนแล้วค่อยคำนวณและแสดงผล
                  if (distanceCtrl.text.isEmpty == true ||
                      timeCtrl.text.isEmpty == true) {
                    // แสดงข้อความเตือนด้วย SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('🚨 กรุณากรอกข้อมูลให้ครบถ้วน'),
                        backgroundColor: Colors.blueAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    return;
                  }
                  // คำนวณและแสดงผล แต่อย่าลืมแปลงที่ป้อนใน TextField ให้เป็นตัวเลขก่อน
                  double distance = double.parse(distanceCtrl.text);
                  double time = double.parse(timeCtrl.text) * 3;
                  double fare = 35;
                  if (distance <= 1) {
                    fare = fare + time;
                  } else if (distance <= 10) {
                    fare = fare + (distance - 1) * 6.50 + time;
                  } else if (distance <= 20) {
                    fare = fare + (distance - 1) * 7.00 + time;
                  } else if (distance <= 40) {
                    fare = fare + (distance - 1) * 8.00 + time;
                  } else if (distance <= 60) {
                    fare = fare + (distance - 1) * 8.50 + time;
                  } else if (distance <= 80) {
                    fare = fare + (distance - 1) * 9.00 + time;
                  } else {
                    fare = fare + (distance - 1) * 10.50 + time;
                  }
                  setState(() {
                    showFare = fare.toStringAsFixed(2);
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.43,
                    MediaQuery.of(context).size.width * 0.12,
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'คำนวณค่าโดยสาร',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  // เคลียร์ข้อมูลบนหน้าจอ
                  setState(() {
                    distanceCtrl.text = '';
                    timeCtrl.text = '';
                    showFare = '0.00';
                  });
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.43,
                    MediaQuery.of(context).size.width * 0.12,
                  ),
                  // backgroundColor: Colors.blueGrey,
                ),
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xfffffcbf),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ค่าโดยสารแท็กซี่',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      showFare,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'บาท',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
