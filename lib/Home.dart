import 'package:ape/Images.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('APE'),
          centerTitle: false,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Tools',
            onPressed: () => debugPrint('tools button press.'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('search button press.'),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'More',
              onPressed: () => debugPrint('more button press.'),
            ),
          ],
        ),
        body: TabBarView(children: <Widget>[]),
        bottomNavigationBar: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.yellow,
                child: TabBar(
                  indicatorColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.notifications)),
                    Tab(icon: Icon(Icons.person)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: InkWell(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(logoImage),
                    radius: 25,
                  ),
                  onTap: () => debugPrint('center navigation press.'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
