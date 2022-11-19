import 'package:flutter/material.dart';
import 'package:bmi_calculator/results_page.dart';

class ResultsPage extends StatefulWidget {
  int height;
  int weight;
  int age;
  ResultsPage({Key? key, required this.height,required this.weight, required this.age}) : super(key: key);
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    var bmi = (widget.weight/((widget.height/100) * (widget.height/100))).toStringAsFixed(1);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255,14,18,38,),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(13, 18, 38, 1),
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'BMI RESULT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      '$bmi',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

