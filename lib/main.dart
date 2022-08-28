// import 'package:flutter/gestures.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: CalculatorSample()));
}

class CalculatorSample extends StatefulWidget {
  @override
  createState() => _CalculatorSampleState();
}

String ans = "";
List<String> topAns = [];

Color _calcTextColor = Color(0xFF6C6969);

class _CalculatorSampleState extends State<CalculatorSample> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      darkTheme: const NeumorphicThemeData(
        baseColor: Color(0xFF191919),
        intensity: 0.5,
        lightSource: LightSource.topLeft,
        variantColor: Color(0xFFA13333),
        accentColor: Color(0xFFECB365),
        depth: 6,
        defaultTextColor: Colors.white,
        textTheme: TextTheme(
          bodyText1:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          bodyText2:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFF4F5F5),
        intensity: 0.5,
        lightSource: LightSource.topLeft,
        variantColor: Colors.deepOrange,
        accentColor: Colors.orangeAccent,
        depth: 6,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: NeumorphicBackground(child: _PageContent()),
        ),
      ),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  __PageContentState createState() => __PageContentState();
}

class CalcButton {
  final String label;
  final bool textAccent;
  final bool textVariant;
  final bool backgroundAccent;

  CalcButton(
    this.label, {
    this.textAccent = false,
    this.backgroundAccent = false,
    this.textVariant = false,
  });
}

class WidgetCalcButton extends StatelessWidget {
  final CalcButton button;
  final Function onClick;

  WidgetCalcButton(this.button, this.onClick);

  Color _textColor(BuildContext context) {
    if (button.backgroundAccent) {
      if (NeumorphicTheme.of(context)!.isUsingDark) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    } else if (button.textAccent) {
      return NeumorphicTheme.accentColor(context);
    } else if (button.textVariant) {
      return NeumorphicTheme.variantColor(context);
    } else {
      return _calcTextColor;
    }
  }

  Color? _backgroundColor(BuildContext context) {
    return button.backgroundAccent
        ? NeumorphicTheme.accentColor(context)
        : null;
  }

  void onClic() {
    onClick(
      button.label.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14),
      child: NeumorphicButton(
        onPressed: onClic,
        style: NeumorphicStyle(
          surfaceIntensity: 0.15,
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          color: _backgroundColor(context),
        ),
        child: Center(
          child: Text(
            button.label,
            style: TextStyle(fontSize: 24, color: _textColor(context)),
          ),
        ),
      ),
    );
  }
}

ScrollController _controller = ScrollController();

_moveDown() {
  _controller.animateTo(_controller.offset + 30,
      curve: Curves.linear, duration: Duration(milliseconds: 200));
}

class _TopScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: -1 * NeumorphicTheme.of(context)!.current!.depth,
      ),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: 175,
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 120,
                alignment: Alignment.bottomRight,
                child: ListView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return topAns.isEmpty
                        ? Text(ans)
                        : FittedBox(
                            alignment: Alignment.bottomRight,
                            fit: BoxFit.none,
                            child: Text(topAns[index],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: _calcTextColor,
                                  fontWeight: FontWeight.normal,
                                )),
                          );
                  },
                  itemCount: topAns.length,
                  itemExtent: 30,
                ),
              ),
              ans == ""
                  ? Text(ans)
                  : FittedBox(
                      child: Text(ans,
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.normal,
                              color: _calcTextColor))),
            ],
          ),
        ),
      ),
    );
  }
}

int op1 = 0;
int op2 = 0;
var oop = "";

class __PageContentState extends State<_PageContent> {
  final buttons = [
    CalcButton("%", textAccent: true),
    CalcButton("^", textAccent: true),
    CalcButton("sqrt", textAccent: true),
    CalcButton("C", textVariant: true),
    //----
    CalcButton("7"),
    CalcButton("8"),
    CalcButton("9"),
    CalcButton("/", textAccent: true),
    //----
    CalcButton("4"),
    CalcButton("5"),
    CalcButton("6"),
    CalcButton("X", textAccent: true),
    //----
    CalcButton("1"),
    CalcButton("2"),
    CalcButton("3"),
    CalcButton("-", textAccent: true),
    //----
    CalcButton("0"),
    CalcButton("."),
    CalcButton("=", backgroundAccent: true),
    CalcButton("+", textAccent: true),
  ];

  void onClick(
    String op,
  ) {
    setState(() {
      // ans=ans+op;
      var t = "";

      if (oop == "") {
        if (op == 'C') {
          t = "";
          // if (ans != " ") {
          for (var i = 0; i < ans.length - 1; i++) {
            t = t + ans[i];
          }
          // }
          // print("t1: $t $ans");
          ans = t;
        } else if (op == "=") {
          ans = ans;
        } else {
          ans = ans + op;
        }
        op1 =
            int.parse(ans == "" ? "0" : ans.replaceAll(RegExp(r'[^0-9]'), ''));
        if (op == "+") {
          oop = "+";
        }
        if (op == "-") {
          oop = "-";
        }

        if (op == "/") {
          oop = "/";
        }

        if (op == "X") {
          oop = "X";
        }

        if (op == "^") {
          oop = "^";
        }

        if (op == "%") {
          oop = "%";
        }

        if (op == "sqrt") {
          oop = "sqrt";
        }
      } else if (oop != "") {
        var t1 = "";
        if (op == 'C') {
          t = "";
          // if (ans != " ") {
          for (var i = 0; i < ans.length - 2; i++) {
            t = t + ans[i];
          }
          // }
          // print("t2: $t");
          ans = t;
        } else if (op == "=") {
          topAns.add(ans);

          if (oop == "+") {
            // oop = "+";
            ans = (op1 + op2).toString();
          }
          if (oop == "-") {
            // oop = "-";
            ans = (op1 - op2).toString();
          }

          if (oop == "/") {
            // oop = "/";
            ans = (op1 / op2).toString();
          }

          if (oop == "X") {
            // oop = "X";
            ans = (op1 * op2).toString();
          }

          if (oop == "^") {
            // oop = "^";
            ans = (op1 ^ op2).toString();
          }
          if (oop == "%") {
            // oop = "%";
            ans = ((op2 - op1 / op1) * 100).toString();
          }

          if (oop == "sqrt") {
            // oop = "sqrt";
            ans = (sqrt(op2)).toString();
          }

          // print("ans: $ans");
          t1 = "0";
          oop = "";
          _moveDown();
        } else {
          t1 = t1 + op;
          ans = ans + op;
          op2 = int.parse(t1.replaceAll(RegExp(r'[^0-9]'), ''));
        }
      }
    });
  }

  Icon scth = Icon(Icons.wb_sunny_rounded);

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: NeumorphicButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  setState(() {
                    if (NeumorphicTheme.of(context)!.isUsingDark) {
                      NeumorphicTheme.of(context)!.themeMode = ThemeMode.light;
                      _calcTextColor = Color(0xFF6C6969);
                      scth = Icon(
                        Icons.wb_sunny_rounded,
                        color: _calcTextColor,
                      );
                    } else {
                      NeumorphicTheme.of(context)!.themeMode = ThemeMode.dark;
                      _calcTextColor = Color(0xFFEEEEEE);

                      scth = Icon(
                        Icons.nightlight_round,
                        color: _calcTextColor,
                      );
                    }
                  });
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: scth,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // height: 200,
              padding: const EdgeInsets.all(18.0),
              child: _TopScreenWidget(),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 4,
              padding: const EdgeInsets.only(left: 40, right: 40.0),
              // Generate 100 widgets that display their index in the List.
              children: List.generate(buttons.length, (index) {
                return WidgetCalcButton(buttons[index], onClick);
              }),
            ),
          ),
          // Row(
          //   children: <Widget>[
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(() {
          //           NeumorphicTheme.of(context)!
          //               .updateCurrentTheme(NeumorphicThemeData(
          //             depth: 1,
          //             intensity: 0.5,
          //             accentColor: Colors.cyan,
          //           ));
          //         });
          //       },
          //       child: Text(
          //         "style 1",
          //       ),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(() {
          //           NeumorphicTheme.of(context)!
          //               .updateCurrentTheme(NeumorphicThemeData(
          //             depth: 8,
          //             intensity: 0.3,
          //             accentColor: Colors.greenAccent,
          //           ));
          //         });
          //       },
          //       child: Text(
          //         "style 2",
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
