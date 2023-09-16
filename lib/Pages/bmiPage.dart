import 'package:bmi_calculator/Providers/bmiPageProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/infoCard.dart';

class BmiPage extends StatefulWidget {
  BmiPage({Key? key}) : super(key: key);

  @override
  _BmiPageState createState() {
    return _BmiPageState();
  }
}

class _BmiPageState extends State<BmiPage> {
  late double _deviceHeight, _deviceWidth;
  late BmiPageProvider _bmiPageProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    _deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    return ChangeNotifierProvider(
      create: (context) => BmiPageProvider(),
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return Builder(builder: (context) {
      _bmiPageProvider = context.watch<BmiPageProvider>();
      return CupertinoPageScaffold(
        child: Container(
          height: _deviceHeight * 0.9,
          width: _deviceWidth,
          padding: EdgeInsets.all(_deviceHeight * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CupertinoNavigationBar(
                middle: Text("BMI Calculator"),
                backgroundColor: Colors.white24,
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ageContainer(),
                    weightContainer(),
                  ]),
              heightContainer(),
              genderContainer(),
              calculateButton(),
            ],
          ),
        ),
      );
    });
  }

  Widget ageContainer() {
    return InfoCard(
      title: "Age",
      value: _bmiPageProvider.age.toString(),
      height: _deviceHeight * 0.2,
      width: _deviceWidth * 0.4,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: CupertinoDialogAction(
              onPressed: () {
                _bmiPageProvider.decrementAge();
              },
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.red,
              ),
              child: const Text('-'),
            ),
          ),
          SizedBox(
            width: 50,
            child: CupertinoDialogAction(
              onPressed: () {
                _bmiPageProvider.incrementAge();
              },
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.green,
              ),
              child: const Text('+'),
            ),
          ),
        ],
      ),
    );
  }

  Widget weightContainer() {
    return InfoCard(
      title: "Weight KG",
      value: _bmiPageProvider.weight.toString(),
      height: _deviceHeight * 0.2,
      width: _deviceWidth * 0.4,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: CupertinoDialogAction(
              onPressed: () {
                _bmiPageProvider.decrementWeight();
              },
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.red,
              ),
              child: const Text('-'),
            ),
          ),
          SizedBox(
            width: 50,
            child: CupertinoDialogAction(
              onPressed: () {
                _bmiPageProvider.incrementWeight();
              },
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.green,
              ),
              child: const Text('+'),
            ),
          ),
        ],
      ),
    );
  }

  Widget heightContainer() {
    return InfoCard(
      title: "Height CM",
      value: _bmiPageProvider.height.toString(),
      height: _deviceHeight * 0.2,
      width: _deviceWidth,
      child: SizedBox(
        width: _deviceWidth * 0.8,
        child: CupertinoSlider(
          value: _bmiPageProvider.height.toDouble(),
          onChanged: (newValue) {
            _bmiPageProvider.changeHeight(newValue.toInt());
          },
          min: 60,
          max: 300,
        ),
      ),
    );
  }

  Widget genderContainer() {
    return InfoCard(
      title: "Gender",
      height: _deviceHeight * 0.2,
      width: _deviceWidth,
      child: CupertinoSlidingSegmentedControl(
        groupValue: _bmiPageProvider.gender,
        children: const {
          "male": Text("Male"),
          "female": Text("Female"),
        },
        onValueChanged: (value) {
          _bmiPageProvider.gender = value!;
        },
      ),
    );
  }

  Widget calculateButton() {
    return SizedBox(
      height: _deviceHeight * 0.07,
      child: CupertinoButton.filled(
        onPressed: () {
          _bmiPageProvider.calculateBMI();
        },
        child: const Text("Calculate BMI"),
      ),
    );
  }
}
