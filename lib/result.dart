// ignore_for_file: curly_braces_in_flow_control_structures, duplicate_ignore

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.ismale, required this.age})
      : super(key: key);
  final double result;
  final bool ismale;
  final int age;
  // ignore: non_constant_identifier_names
  String get Resultphase {
    String resulttext = '';
    if (result >= 30)
      // ignore: curly_braces_in_flow_control_structures
      resulttext = "Obese";
    else if (result > 25 && result < 30)
      resulttext = "OverWeight";
    else if (result >= 18.5 && result <= 24.9)
      resulttext = "Normal";
    else
      resulttext = "Thin";

    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Result",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: .1,
                )
              ]),
              padding: const EdgeInsets.all(10),
              child: Card(
                shadowColor: Colors.blueGrey.withOpacity(.8),
                color: Colors.blueGrey,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Gender : ${ismale ? "Male" : "Female"} ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "Result : ${result.toStringAsFixed(1)} ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        "Healthiness : $Resultphase ",
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Age : $age ",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
