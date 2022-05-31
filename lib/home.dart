// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';
import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightvalue = 170;
  int weight = 55;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
          Colors.teal,
          Colors.black,
          Colors.teal.withOpacity(.2),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight))),
        actions: [
          IconButton(
              onPressed: () {
                build_flashbar(context);
              },
              icon: const Icon(Icons.abc_outlined))
        ],
        centerTitle: true,
        title: SelectableText("BMI Calculator",
            style: Theme.of(context).textTheme.headline2,
            showCursor: true,
            cursorHeight: 10,
            toolbarOptions:
                const ToolbarOptions(paste: true, cut: true, copy: true)),
      ),
      body: SafeArea(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    m1Expanded(context, "male"),
                    m1Expanded(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Height",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                heightvalue.toStringAsFixed(1),
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const Text(
                                "cm",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Slider(
                            inactiveColor: Colors.white,
                            activeColor:
                                const Color.fromARGB(255, 54, 238, 223),
                            value: heightvalue,
                            onChanged: (newvalue) {
                              setState(() {
                                heightvalue = newvalue;
                              });
                            },
                            min: 90,
                            max: 300,
                          )
                        ]),
                  )),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    m2Expanded(context, "weight"),
                    m2Expanded(context, "age"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  color: Colors.blueGrey,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        var result = weight / pow(heightvalue / 100, 2);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Result(
                              result: result, ismale: isMale, age: age);
                        }));
                      },
                      child: Text(
                        "Calculate",
                        style: Theme.of(context).textTheme.headline2,
                      ))),
            )
          ],
        ),
      ),
    );
  }

  void build_flashbar(BuildContext context) {
    Flushbar(
      title: "hi mego",
      messageText: const SelectableText("hiiiiiii"),
    ).show(context);
  }

  void build_snackbar(BuildContext context) {
    const snakbar = SnackBar(
      content: Text("hi"),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }

  Future<dynamic> build_dialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: const Text("hi "),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black,
                  ),
                  const Text("my name is ahmed"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("close"))
                ],
              ),
            ),
          );
        });
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMale = (type == 'male') ? true : false;
            });
          },
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(type == 'male' ? Icons.male : Icons.female),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  type == 'male' ? "Male" : "Female",
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Center(
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                type == 'age' ? "Age" : "Weight",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'age' ? "$age" : "$weight",
                style: Theme.of(context).textTheme.headline2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    },
                    child: const Icon(Icons.remove),
                    mini: true,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    },
                    child: const Icon(Icons.add),
                    mini: true,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
