import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            FavoriteWidget(),
          ],
        )
    );
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme
          .of(context)
          .primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumn(Icons.call, 'CALL'),
            buildButtonColumn(Icons.near_me, 'ROUTE'),
            buildButtonColumn(Icons.share, 'SHARE'),
          ],
        )
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
          softWrap: true,
        )
    );

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Top Lakes'),
            ),
            body: ListView(
              children: [
                Image.asset(
                    'images/lake.jpg',
                    height: 320.0,
                    fit: BoxFit.cover
                ),
                titleSection,
                buttonSection,
                textSection,
              ],
            )
        )
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteWidgetState();
}

class FavoriteWidgetState extends State {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        SizedBox(
            width: 18.0,
            child: Container(
                child: Text('$_favoriteCount')
            )
        )
      ],
    );
  }

  _toggleFavorite() {
    setState(() {
      if (_isFavorited) _favoriteCount--;
      if (!_isFavorited) _favoriteCount++;
      _isFavorited = !_isFavorited;
    });
  }


}
