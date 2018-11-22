import 'package:flutter/material.dart';

class Searcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearcherState();
}

class SearcherState extends State<Searcher> {
  final TextEditingController _controller = new TextEditingController();

  List<String> _list;
  bool _searching;
  String _searchContent;

  SearcherState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _searching = false;
          _searchContent = "";
        });
      } else {
        setState(() {
          _searching = true;
          _searchContent = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searching = false;
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
          cursorRadius: Radius.circular(1),
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.grey[600],
          decoration: InputDecoration(
            fillColor: Colors.yellow[200],
            filled: true,
            border: OutlineInputBorder(
              gapPadding: 10,
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            suffixIcon: _searching
                ? IconButton(
                    iconSize: 15,
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey[600],
                    ),
                    onPressed: () => _controller.clear(),
                  )
                : null,
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _searching ? _buildFilterItem() : _buildAllItem(),
      ),
    );
  }

  _buildAllItem() {
    return _list.map((item) => ListTile(title: Text(item, textAlign: TextAlign.right))).toList();
  }

  _buildFilterItem() {
    List<String> _remainderList = List();
    for (int i = 0; i < _list.length; i++) {
      String name = _list.elementAt(i);
      if (name.toLowerCase().contains(_searchContent.toLowerCase())) {
        _remainderList.add(name);
      }
    }
    return _remainderList.map((item) => ListTile(title: Text(item, textAlign: TextAlign.right))).toList();
  }
}
