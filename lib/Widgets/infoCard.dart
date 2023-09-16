import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final String title;
  final String? value;

  InfoCard({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          )
        ],
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          value != null
              ? Text(
                  value!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )
              : Container(),
          child,
        ],
      ),
    );
  }
}
