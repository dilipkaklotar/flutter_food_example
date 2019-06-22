import 'dart:math';

import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

var backgroundColor = Color(0xFFf9f9f9);
var colorHeader = Color(0xFF203152);

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.5;

var currentPage = images.length - 1.0;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: bottomBarNavigation(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Hi Thursday',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 25.0,
                        color: colorHeader,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: ExactAssetImage('images/banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search for Dishes",
                        hintStyle: TextStyle(
                            fontFamily: "Roboto-Light", fontSize: 14.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        border: InputBorder.none),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Choose Todays Dishes',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 20.0,
                        color: colorHeader,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),

                Container(
                  height: 100.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      listCategory("Burger", "burger", true),
                      listCategory("Fast Food", "fast_food", false),
                      listCategory("Ice Cream", "ice_cream", false),
                      listCategory("Pizza", "pizza", false),
                      listCategory("Sandwich", "sandwich", false),
                      listCategory("Soup", "soup", false),
                    ],
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),

                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    )
                  ],
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBarNavigation() {
    return new BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "images/navigation/home.png",
              color: colorHeader,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "images/navigation/note.png",
              color: colorHeader,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "images/navigation/notification.png",
              color: colorHeader,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "images/navigation/person.png",
              color: colorHeader,
            ),
          ),
        ],
      ),
    );
  }

  Widget listCategory(String category, String image, var isSelected) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 90,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: isSelected ? 5.0 : 0.0,
            ),
          ],
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/category/" + image + ".png",
                  color: isSelected ? Colors.white : colorHeader,
                  height: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: isSelected ? Colors.white : colorHeader),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width;
        var safeHeight = height;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        images[i],
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
