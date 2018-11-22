import 'package:flutter/material.dart';

class Searcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearcherState();
}

class SearcherState extends State<Searcher> {
  final TextEditingController _controller = new TextEditingController();

  List<String> _list;

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() {
    _list = List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          controller: _controller,
          autofocus: true,
          cursorWidth: 1.5,
          cursorRadius: Radius.circular(40),
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.grey[600],
          decoration: InputDecoration(
            fillColor: Colors.yellow[200],
            filled: true,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text(
              '搜索',
              style: TextStyle(color: Colors.grey[600], fontSize: 17, fontWeight: FontWeight.w100),
            ),
            onPressed: () => debugPrint('search button press.'),
          )
        ],
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _list.map((item) => ListTile(title: Text(item, textAlign: TextAlign.right))).toList(),
      ),
    );
  }
}
