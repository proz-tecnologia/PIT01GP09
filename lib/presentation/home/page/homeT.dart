import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = Image.network("http://www.gstatic.com/webp/gallery/1.jpg");
    var container = Container(
      child: image,
      padding:
          const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      width: 200.0,
      height: 200.0,
    );

    return MaterialApp(
      title: "Scroller",
      home: Scaffold(
        body: Center(
            child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              //first row is horizontal scroll
              var singleChildScrollView = SingleChildScrollView(
                  child: Row(
                    children: <Widget>[
                      container,
                      container,
                      container,
                    ],
                  ),
                  scrollDirection: Axis.horizontal);
              return singleChildScrollView;
            } else {
              return Row(
                children: <Widget>[container, container],
              );
            }
          },
          itemCount:
              10, // 9 rows of AllGenresAndMoods + 1 row of PopularGenresAndMoods
        )),
      ),
    );
  }
}
