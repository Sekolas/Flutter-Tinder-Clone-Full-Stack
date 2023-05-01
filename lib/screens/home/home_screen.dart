import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          SvgPicture.asset(
            'assets/logo.svg',
            height: 50,
          ),
          Text(
            'ARROW',
            style:Theme.of(context).textTheme.headlineSmall,
          )
        ],),
      ),
    );
  }
}
