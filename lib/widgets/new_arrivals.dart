import 'package:flutter/material.dart';

import '../models/shoe.dart';

class NewArrivals extends StatelessWidget {
  final Shoe shoe;

  NewArrivals({this.shoe});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: screenSize.width * 0.45,
      margin: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.grey.withOpacity(0.4),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 18,
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                color: Colors.pink,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22.0,
                  vertical: 6.0,
                ),
                child: Text(
                  'NEW',
                  style: textTheme.headline2.copyWith(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  shoe.imagePath,
                  width: screenSize.width * 0.35,
                ),
                SizedBox(height: 4.0),
                Text(
                  '${shoe.showModel}',
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: textTheme.headline3.copyWith(
                    color: Colors.black.withOpacity(0.9),
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '${shoe.price}',
                  style: textTheme.headline4.copyWith(
                    color: Colors.black.withOpacity(0.75),
                    fontSize: 16.0,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height : 12.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
