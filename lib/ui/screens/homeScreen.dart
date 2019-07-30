
import 'package:flutter/material.dart';
import'package:superciti/ui/screens/exchangeData.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<String> value;
  List<String> _filterList;
  @override
  void initState() {
    super.initState();
    value = new List<String>();
    value = [
      "Ahamdabad",
      "Anand",
      "Mumbai",
      "Nasik",
    ];
    value.sort();
  }
  _HomeState() {
//Register a closure to be called when the object changes.

    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {

//Notify the framework that the internal state of this object has changed.

        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;

        });
      }
    });
  }


  void navigationPage() {
    Navigator.push(context,new MaterialPageRoute(builder: (context) => new ExchangeData(post: fetchPost())),
    );
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SearchView ListView"),
        backgroundColor: Colors.orange,
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationPage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
//Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchview,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
//Create a ListView widget
  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: value.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${value[index]}"),
              ),
            );
          }),
    );
  }
//Perform actual search
  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < value.length; i++) {
      var item = value[i];
      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }





//Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_filterList[index]}"),
              ),
            );
          }),
    );
  }
}
