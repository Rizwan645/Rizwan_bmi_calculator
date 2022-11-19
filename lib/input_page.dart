import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'enum_file.dart';

void main() {
  runApp(const InputPage());
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 100;
  int weight = 20;
  int age = 10;
  bool tap = false;
  late int current_age;
  late int current_weight;
  gender selectedCard = gender.normal;

  void age_incremeant() async{
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      tap ? age++ : age;
      if (age==101){
        age=100;
      }
      current_age = age;
    });
   tap ? age_incremeant():null;
  }
  void age_decrement() async{
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      tap ? age-- : age;
      if (age==-1){
        age=0;
      }
      current_age = age;
    });
    tap ? age_decrement():null;
  }
  void weight_incremeant() async{
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      tap ? weight++ : weight;
      if (weight==101){
        weight=100;
      }
      current_weight = weight;
    });
    tap ? weight_incremeant():null;
  }
  void weight_decremeant() async{
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      tap ? weight-- : weight;
      if (weight==-1){
        weight=0;
      }
      current_weight = weight;
    });
    tap ? weight_decremeant():null;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255,14,18,38,),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(13, 18, 38, 1),
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          selectedCard = gender.male;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCard==gender.male? Colors.indigo: Colors.white10,
                        ),
                        height: 170,
                        width: 170,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male_sharp,
                              color: Colors.white,
                              size: 100,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          selectedCard = gender.female;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCard==gender.female? Colors.indigo: Colors.white10,
                        ),
                        height: 170,
                        width: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female_sharp,
                              color: Colors.white,
                              size: 100,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10,
                      ),
                      height: 180,
                      width: 368,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'CM',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            min: 50.0,
                            max: 220.0,
                            activeColor: Colors.white,
                            inactiveColor: Color.fromRGBO(140, 140, 149, 1),
                            thumbColor: Colors.pink,
                            value: height.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10,
                      ),
                      height: 170,
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onLongPressStart: (value){
                                  setState((){
                                    tap = true;
                                  });
                                  weight_incremeant();

                                },
                                onLongPressEnd: (value){
                                  setState((){
                                    weight = current_weight;
                                    tap = false;

                                  });
                                },
                                onTap: (){
                                  setState(() {
                                    weight=weight+1;
                                    if (weight==101){
                                      weight=100;
                                    }
                                  });
                                },
                                child: Container(
                                  height:60,
                                  width: 60,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onLongPressStart: (value){
                                  setState((){
                                    tap = true;
                                  });
                                  weight_decremeant();

                                },
                                onLongPressEnd: (value){
                                  setState((){
                                    weight = current_weight;
                                    tap = false;

                                  });
                                },
                                onTap: (){
                                  setState(() {
                                    weight=weight-1;
                                    if (weight==-1){
                                      weight=00;
                                    }
                                  });
                                },
                                child: Container(
                                  height:60,
                                  width: 60,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white10,
                      ),
                      height: 170,
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onLongPressStart: (value){
                                  setState((){
                                    tap = true;
                                  });
                                  age_incremeant();

                                },
                                onLongPressEnd: (value){
                                  setState((){
                                    age = current_age;
                                    tap = false;

                                  });
                                },
                                onTap: (){
                                  setState(() {
                                    age=age+1;
                                    if (age==101){
                                      age=100;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onLongPressStart: (value){
                                  setState((){
                                    tap = true;
                                  });
                                  age_decrement();

                                },
                                onLongPressEnd: (value){
                                  setState((){
                                    age = current_age;
                                    tap = false;

                                  });
                                },
                                onTap: (){
                                  setState(() {
                                    age=age-1;
                                    if (age==-1){
                                      age=00;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ResultsPage(height: height, weight: weight, age: age))
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink,
                  ),
                  height: 80,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),


        ),

      ) ,
    );
  }
}

