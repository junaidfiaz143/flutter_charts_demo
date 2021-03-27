import 'package:flutter/material.dart';
import 'package:flutter_charts/screens/customised_limit_line.dart';
import 'package:flutter_charts/screens/gradient_chart_screen.dart';
import 'package:flutter_charts/screens/pie_chart_screen.dart';
import 'package:flutter_charts/screens/stacked_area.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Charts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Charts'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StackedAreaCustomColorLineChart()));
                  },
                  child: Text("Stacked Area Chart")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomizedLine()));
                  },
                  child: Text("Customised Limit Line")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerticalGradient()));
                  },
                  child: Text("Gradient Chart")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PieChartBasic()));
                  },
                  child: Text("Pie Area Chart")),
            ],
          ),
        ));
  }
}
