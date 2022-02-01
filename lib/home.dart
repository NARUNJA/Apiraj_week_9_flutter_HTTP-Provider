import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:analog_clock/analog_clock.dart';
import 'drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.indigoAccent],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            icon: const Icon(Icons.home),
            tooltip: 'Show Snackbar',
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('this is Home'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: 1000,
          width: 1000,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 90, 35, 1),
                Color.fromRGBO(39, 105, 171, 0.75),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: AnalogClock(
                decoration: BoxDecoration(
                    border: Border.all(width: 5.0, color: Colors.black),
                    color: Colors.transparent,
                    shape: BoxShape.circle),
                width: 200.0,
                isLive: true,
                hourHandColor: Colors.black,
                minuteHandColor: Colors.black,
                showSecondHand: true,
                numberColor: Colors.black87,
                showNumbers: true,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: true,
                datetime: DateTime(2022, 1, 1, 19, 14, 10),
              )),
              const SizedBox(
                height: 20,
              ),
              DigitalClock(
                is24HourTimeFormat: false,
                digitAnimationStyle: Curves.bounceInOut,
              ),
              const SizedBox(
                height: 20,
              ),
              DigitalClock(
                digitAnimationStyle: Curves.elasticOut,
                is24HourTimeFormat: false,
                areaDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                ),
                amPmDigitTextStyle: const TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DigitalClock(
                digitAnimationStyle: Curves.easeOutExpo,
                hourMinuteDigitTextStyle: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DigitalClock(
                areaWidth: 180,
                showSecondsDigit: false,
                hourMinuteDigitTextStyle: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  child: Image.network(
                    'https://i.gifer.com/28ef.gif',
                    height: 100,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerMenu.menu(context),
    );
  }
}
