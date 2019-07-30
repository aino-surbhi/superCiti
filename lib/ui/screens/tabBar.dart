import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:superciti/all_translations.dart';



class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  void initState(){
    super.initState();

    // Initializes a callback should something need
    // to be done when the language is changed
    allTranslations.onLocaleChangedCallback = _onLocaleChanged;
  }


  // If there is anything special to do when the user changes the language

  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ${allTranslations.currentLanguage}');
  }


  // Main initialization

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // Tells the system which are the supported languages
      supportedLocales: allTranslations.supportedLocales(),

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String language = allTranslations.currentLanguage;
    final String buttonText = language == 'fr' ? '=> English' : '=> Français';

    return new MaterialApp(

        home:new DefaultTabController(
            length: 2,
            child: new Scaffold(
                appBar: AppBar(title: Text(allTranslations.text('main_title')),
                  backgroundColor: Colors.orange,
                  bottom: new TabBar(tabs: <Widget>[
                    new Tab(text: allTranslations.text('first_tab')),
                    new Tab(text: allTranslations.text('second_tab')),

                  ],
                  ),
                ),




                body: Container(
                    width: double.infinity,

                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Column(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text(buttonText),
                                  onPressed: () async {
                                    await allTranslations.setNewLanguage(language == 'fr' ? 'en' : 'fr');
                                    setState((){});
                                  },
                                ),
                                Text(allTranslations.text('main_body')),
                                Text(allTranslations.text('first_tab')),
                                Text(allTranslations.text('second_tab'))

                              ]


                          ),
                        ),

                      ],


                    )

                )
            )
        )
    );

  }
}

