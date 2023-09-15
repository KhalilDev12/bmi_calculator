import 'package:flutter/cupertino.dart';

// Pages
import 'package:bmi_calculator/Pages/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Application",
      routes: {
        "/": (context) => MainPage(),
      },
      initialRoute: "/",
    );
  }
}
