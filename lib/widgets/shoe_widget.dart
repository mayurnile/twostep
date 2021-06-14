import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/page_view_holder.dart';

import '../models/shoe.dart';

import '../constants/routes.dart';

class ShoeWidget extends StatelessWidget {
  final double index;
  final double fraction;
  final Shoe shoe;
  final Color cardColor;

  ShoeWidget({
    required this.index,
    required this.fraction,
    required this.shoe,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    double value = Provider.of<PageViewHolder>(context).value;

    double diff = (index - value);
    //diff is negative = left page
    //diff is 0 = current page
    //diff is positive = next page

    //Matrix for Transform widget to animate
    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(2, 1, 1 / 0.7) //Increasing scale by 90%
      ..setEntry(1, 1, fraction + 0.3) //Changing scale Along Y Axis
      ..setEntry(3, 0, 0.005 * -diff); //Changing perspective Along X Axis

    return Transform(
      transform: pvMatrix,
      alignment: FractionalOffset.center,
      //Actual Widget
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
            Routes.SHOE_DETAILS_SCREENS,
            arguments: [shoe, cardColor]),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: shoe.showModel,
              child: Container(
                padding: const EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  color: cardColor.withAlpha(220),
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${shoe.companyName}',
                          style: textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        SizedBox(
                          width: screenSize.width * 0.3,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${shoe.showModel}',
                              textAlign: TextAlign.start,
                              style: textTheme.headline3,
                            ),
                          ),
                        ),
                        Text(
                          '${shoe.price}',
                          style: textTheme.headline4!.copyWith(
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 10,
              top: 90,
              child: Hero(
                tag: '${shoe.showModel}+1',
                child: Transform.rotate(
                  angle: (-40 * (3.14 / 180)),
                  child: Transform.scale(
                    scale: 1.4,
                    child: Transform.translate(
                      offset: Offset(5, 0),
                      child: Image.asset(
                        shoe.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
