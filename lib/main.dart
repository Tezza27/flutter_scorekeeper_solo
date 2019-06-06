import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Score Keeper",
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        primaryTextTheme: TextTheme(
          title: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent),
          //AppBar Text
          headline: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
          //Team names
          subtitle: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent),
          //Score
          button: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurple), //Button Text
        )),
    home: ScoreCounter(),
  ));
}

class ScoreCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScoreCounterState();
  }
}

class _ScoreCounterState extends State<ScoreCounter> {
  int counterHome = 0;
  int counterAway = 0;
  String scoreStringHome = "0";
  String scoreStringAway = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Score Keeper"),
        ),
        body: Container(
            color: Theme.of(context).accentColor,
            child: Column(children: <Widget>[
              Container(
                child: Row(children: <Widget>[
                  Expanded(
                      child: Container(
                    child: Column(
                      children: <Widget>[
                        Text("HOME TEAM",
                            style: Theme.of(context).primaryTextTheme.headline),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 0.0,
                                    left: 16.0,
                                    right: 16.0),
                                child: Text(scoreStringHome,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Theme.of(context).accentColor,
                              elevation: 10.0,
                              child: Text("ADD GOAL"),
                              onPressed: addHomeScore),
                        )
                      ],
                    ),
                  )),
                  Container(height: 300.0, width: 2.0, color: Colors.black),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: <Widget>[
                        Text("AWAY TEAM",
                            style: Theme.of(context).primaryTextTheme.headline),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 0.0,
                                    left: 16.0,
                                    right: 16.0),
                                child: Text(scoreStringAway,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Theme.of(context).accentColor,
                              elevation: 10.0,
                              child: Text("ADD GOAL"),
                              onPressed: addAwayScore),
                        )
                      ],
                    ),
                  ))
                ]),
              ),
              Container(height: 2.0, color: Colors.black),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).accentColor,
                    elevation: 10.0,
                    child: Text("RESET SCORES"),
                    onPressed: resetScores),
              )
            ])));
  }

  void addHomeScore() {
    setState(() {
      counterHome++;
      scoreStringHome = counterHome.toString();
    });
  }

  void addAwayScore() {
    setState(() {
      counterAway++;
      scoreStringAway = counterAway.toString();
    });
  }

  void resetScores() {
    setState(() {
      counterHome = 0;
      counterAway = 0;
      scoreStringHome = counterHome.toString();
      scoreStringAway = counterAway.toString();
    });
  }
}
