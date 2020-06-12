import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final String size;
  final bool isActive;

  SizeWidget({this.size, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
            width: 1,
          )),
      child: Text(
        size,
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: isActive ? Colors.white : Colors.black),
      ),
    );
  }
}
