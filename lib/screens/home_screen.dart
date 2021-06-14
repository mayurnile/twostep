import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:palette_generator/palette_generator.dart';

import '../providers/page_view_holder.dart';

import '../models/shoe.dart';

import '../widgets/shoe_widget.dart';
import '../widgets/new_arrivals.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for managing page index fractions
  late PageViewHolder holder;

  //controller for list
  late PageController _controller;

  //view port fraction for page view
  double fraction = 0.55;

  //List of shoes
  List<Shoe> _shoesList = Shoe.getShoesList();

  //List of new shoes
  List<Shoe> _newArrivals = Shoe.getNewArrivalssList();

  //list of color for shoe cards
  List<PaletteColor> _cardColors = [];

  //for storing current screen index
  int _currentScreen = 0;

  var _isLoading = true;

  ///[to create color pallete from shoe image]
  _updatePalettes() async {
    for (Shoe shoe in _shoesList) {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(
        AssetImage(shoe.imagePath),
        //size: Size(200,100),
      );

      if (generator.dominantColor != null)
        _cardColors.add(generator.dominantColor!);
      else
        _cardColors.add(PaletteColor(Colors.blueAccent, 2));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    //initializing the holder for page index fracitons
    holder = PageViewHolder(value: 0.0);

    //initializing page view controller
    _controller = PageController(
      initialPage: 0,
      viewportFraction: fraction,
    );

    //adding listener to update values in provider
    _controller.addListener(() {
      holder.setValue(_controller.page);
    });

    //generating colors from images
    _updatePalettes();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: textTheme.headline5,
        ),
        actions: <Widget>[
          //search button
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () {},
          ),
          //spaing
          SizedBox(width: 8.0),
          //notifications button
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () {},
          ),
          //spacing
          SizedBox(width: 12.0),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                //List of shoes
                //Initiating Provider of Page Index
                ChangeNotifierProvider<PageViewHolder>.value(
                  value: holder,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _shoesList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        //Actual widget
                        return ShoeWidget(
                          index: index.toDouble(),
                          fraction: fraction,
                          shoe: _shoesList[index],
                          cardColor: _cardColors[index].color,
                        );
                      },
                    ),
                  ),
                ),
                //more title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'More',
                        style: textTheme.headline1,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
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
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentScreen,
        onTap: (value) => setState(() => _currentScreen = value),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ],
      ),
    );
  }
}
