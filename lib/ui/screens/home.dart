import 'package:flutter/material.dart';
import 'package:superciti/models/state.dart';
import 'package:superciti/util/state_widget.dart';
import 'package:superciti/ui/screens/sign_in.dart';
import 'package:superciti/ui/widgets/loading.dart';
import'package:superciti/ui/screens/homeScreen.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StateModel appState;
  bool _loadingVisible = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    if (!appState.isLoading &&
        (appState.firebaseUserAuth == null ||
            appState.user == null ||
            appState.settings == null)) {
      return SignInScreen();
    } else {
      if (appState.isLoading) {
        _loadingVisible = true;
      } else {
        _loadingVisible = false;
      }
      final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60.0,
            child: ClipOval(
              child: Image.asset(
                'assets/images/default.png',
                fit: BoxFit.cover,
                width: 120.0,
                height: 120.0,
              ),
            )),
      );




      final signOutButton = FlatButton(
        child: Text(
          'SIGN OUT',
          style: TextStyle(color: Colors.black),textAlign: TextAlign.left,
        ),
        onPressed: () {
          StateWidget.of(context).logOutUser();
        },
      );
      void navigationPage() {
        Navigator.push(context,new MaterialPageRoute(builder: (context) => new Home()),
        );
      }

return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
          home:  Scaffold(
            appBar: AppBar(
              title: Text('Home Page'),

              actions: <Widget>[
                // action button
                signOutButton
              ],
            ),
            drawer: Drawer(
                elevation: 20.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('assets/images/first.png'),
                            fit: BoxFit.cover,
                          )),
                      accountName: new Text(
                            "Surbhi Upadhyay",
                            style: new TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500,color: Colors.white),
                      ),
                      accountEmail: new Text(
                            "surbhi.upadhyay@gmail.com",
                            style: new TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500,color: Colors.white),
                      )
                    ),
                  ],
                )),
            backgroundColor: Colors.white,
            body: LoadingScreen(
              child: new Text(""),
                inAsyncCall: _loadingVisible),
            floatingActionButton: FloatingActionButton(
              onPressed: navigationPage,
              tooltip: 'Increment',
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
            ),
             )
          );
    }
  }
}


