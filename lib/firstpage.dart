import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double x = 0;
  double y = 0;

  int max = 12;
  var number = 1;
  void changepic() {
    setState(() {
      number;
      x = 0;
      y = 0;
      print(number);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    x = 0;
    y = 0;
    number = Random().nextInt(max) + 1;
    changepic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          alignment: Alignment(x, y),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/pic$number.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // constraints: BoxConstraints.tightFor(width: 400, height: 900),
            child: Column(
              children: [
                SizedBox(
                  height: 730,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton.extended(
                        onPressed: () {},
                        label: Text('Home'),
                        icon: Icon(Icons.home),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          if (number < max) {
                            number++;
                          } else {
                            number = 1;
                          }
                          changepic();
                          // x = 1000;
                          // y = 0;
                        },
                        label: Text('Next'),
                        icon: Icon(Icons.skip_next),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          number += Random().nextInt(10) + 1;
                          if (number <= max) {
                            number;
                          } else {
                            number -= max;
                          }
                          changepic();
                        },
                        label: Text('Shuffle'),
                        icon: Icon(Icons.shuffle_rounded),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
