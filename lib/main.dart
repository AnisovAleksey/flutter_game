import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:flutter_game/channels.dart';
import 'package:flutter_game/youtube_video_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => RawMaterialButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.0,
            ),
            onPressed: () {
              CustomChannels.dismissCurrent();
            },
          ),
        ),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox.expand(
              child: AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: YoutubeVideoView(
                  videoId: "wgTBLj7rMPM",
                ),
              ),
            ),
          ),
          LayoutBuilder(builder: _buildChessBoard),
          Expanded(
            flex: 1,
            child: SizedBox.expand(
              child: AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: YoutubeVideoView(
                  videoId: "SmTCmDMi4BY",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChessBoard(BuildContext context, BoxConstraints constraints) {
    return ChessBoard(
      onMove: (move) {},
      onCheckMate: (color) {},
      onDraw: () {
        print("draw");
      },
      size: min(constraints.maxWidth, constraints.maxHeight),
    );
  }
}
