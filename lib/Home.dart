import 'package:ape/Images.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Icon(Icons.home, color: Colors.black12, size: 128.0),
          Icon(Icons.notifications, color: Colors.black12, size: 128.0),
          Icon(Icons.person, color: Colors.black12, size: 128.0),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.yellow,
        child: TabBar(
          controller: _controller,
          unselectedLabelColor: Colors.black38,
          indicatorColor: Colors.black54,
          indicatorWeight: 0.5,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.notifications)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text('APE'),
      centerTitle: false,
      elevation: 0.0,
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(Icons.more_horiz),
          tooltip: 'More',
          onSelected: (String value) => debugPrint(value),
          itemBuilder: (context) => <PopupMenuItem<String>>[
                PopupMenuItem(
                  value: "Search",
                  child: ListTile(
                      title: Text('Search Button', textAlign: TextAlign.right),
                      trailing: Icon(Icons.search, size: 22),
                      onTap: () => Navigator.pop(context)),
                ),
                PopupMenuItem(
                  value: "Settings",
                  child: ListTile(
                      title: Text('Setting Button', textAlign: TextAlign.right),
                      trailing: Icon(Icons.settings, size: 22),
                      onTap: () => Navigator.pop(context)),
                ),
              ],
        ),
      ],
    );
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              '阿猿',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            accountEmail: Text('ayuan@dingding.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars1.githubusercontent.com/u/35946000?s=400&u=56381a9606a5263b20b991db35fe6747bf9959a7&v=4'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: AssetImage(headBackgroundImage),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(Colors.grey[400].withOpacity(0.4), BlendMode.hardLight))),
          ),
          ListTile(
              title: Text('Messages', textAlign: TextAlign.right),
              trailing: Icon(Icons.message, size: 22),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text('Favorite', textAlign: TextAlign.right),
              trailing: Icon(Icons.favorite, size: 22),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text('Settings', textAlign: TextAlign.right),
              trailing: Icon(Icons.settings, size: 22),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text('Logout', textAlign: TextAlign.right),
              trailing: Icon(Icons.exit_to_app, size: 22),
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
