import 'package:flutter/material.dart';

import '../models/shoe.dart';

import '../widgets/size_widget.dart';
import '../widgets/new_arrivals.dart';

class ShoeDetailsScreen extends StatefulWidget {
  @override
  _ShoeDetailsScreenState createState() => _ShoeDetailsScreenState();
}

class _ShoeDetailsScreenState extends State<ShoeDetailsScreen> {
  final List<String> shoeSizes = ['7', '8', '8.5', '9', '9.5', '10'];

  int _selectedSize = 0;

  //List of new shoes
  List<Shoe> _newArrivals = Shoe.getNewArrivalssList();

  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;
    final Shoe shoe = args[0];
    final Color cardColor = args[1];

    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //upper portion
          SizedBox(
            height: screenSize.height * 0.4,
            width: screenSize.width,
            child: Stack(
              children: <Widget>[
                //shoe background
                Positioned(
                  right: -screenSize.width * 0.2,
                  top: -screenSize.height * 0.22,
                  left: -10,
                  child: Hero(
                    tag: shoe.showModel,
                    child: ClipOval(
                      child: Container(
                        height: screenSize.height * 0.6,
                        width: screenSize.height * 0.6,
                        decoration: BoxDecoration(
                          color: cardColor.withAlpha(220),
                          // shape: BoxShape.o
                        ),
                      ),
                    ),
                  ),
                ),
                //company name
                Positioned.fill(
                  top: MediaQuery.of(context).padding.top + 16,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '${shoe.companyName}',
                      style: textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                //product image
                Positioned(
                  top: screenSize.height * 0.06,
                  left: 0,
                  right: 5,
                  child: Hero(
                    tag: '${shoe.showModel}+1',
                    child: Transform.rotate(
                      angle: (-15 * (3.14 / 180)),
                      child: Image.asset(
                        shoe.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                //back button
                Positioned(
                  left: 0,
                  top: 22,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          //body part
          Divider(
            color: Colors.black,
            thickness: 1.5,
            endIndent: 22.0,
            indent: 22.0,
          ),
          //details
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: screenSize.width * 0.4,
                  child: FittedBox(
                    child: Text(
                      '${shoe.showModel}',
                      style: textTheme.headline3.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.2,
                  child: FittedBox(
                    child: Text(
                      '${shoe.price}',
                      style: textTheme.headline3.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //description
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 4.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec et molestie augue, ac lobortis ipsum. Nunc eleifend ante sed risus accumsan, et porta quam fermentum. Etiam malesuada varius tortor.',
              textAlign: TextAlign.justify,
              style: textTheme.bodyText2,
            ),
          ),
          //more details button
          Padding(
            padding: const EdgeInsets.only(
              left: 22.0,
              top: 4.0,
            ),
            child: Text(
              'MORE DETAILS',
              style: textTheme.button.copyWith(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2,
              ),
            ),
          ),
          //spacing
          SizedBox(
            height: 12.0,
          ),
          //sizing style
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: screenSize.width * 0.12,
                  child: FittedBox(
                    child: Text(
                      'Size',
                      style: textTheme.headline3.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.2,
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        text: 'UK   ',
                        style: textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'USA',
                            style: textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //sizes list
          SizedBox(
            height: screenSize.height * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: shoeSizes.length,
              itemBuilder: (ctx, index) => InkWell(
                onTap: () => setState(() => _selectedSize = index),
                child: SizeWidget(
                  size: shoeSizes[index],
                  isActive: index == _selectedSize,
                ),
              ),
            ),
          ),
          //heading
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 4.0,
            ),
            child: SizedBox(
              width: screenSize.width * 0.25,
              child: FittedBox(
                child: Text(
                  'More like this',
                  style: textTheme.headline3.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          //more shoes list
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _newArrivals.length,
              itemBuilder: (ctx, index) {
                return NewArrivals(
                  shoe: _newArrivals[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
