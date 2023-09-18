import 'package:bmi_calculator/Widgets/infoCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {
  late double _deviceHeight, _deviceWidth;

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
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Center(
        child: _dataCard(),
      ),
    );
  }

  Widget _dataCard() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data as SharedPreferences; // Get Data

          final date = prefs.getString("bmi_date"); // Get date
          DateTime parseDate = DateTime.parse(date!); // Parse date

          final data = prefs.getStringList("bmi_data"); // Get Data
          return InfoCard(
            height: _deviceHeight * 0.25,
            width: _deviceWidth * 0.8,
            value: "BMI Score: ${data![0]}",
            title: "Status: ${data[1]}",
            child: Text(
                "${parseDate.day} / ${parseDate.month} / ${parseDate.year}"),
          );
        } else {
          return const CupertinoActivityIndicator(
            color: Colors.blue,
          );
        }
      },
    );
  }
}
