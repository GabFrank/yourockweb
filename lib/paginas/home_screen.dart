import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/subjects.dart';
import 'package:yourockonline/widgets/player_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _volumeSubject = BehaviorSubject.seeded(1.0);
  final _speedSubject = BehaviorSubject.seeded(1.0);

  AudioPlayer _player;
  String url = "http://stream.zeno.fm/d77xxturz1zuv";
  bool isPlaying;
  bool isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AudioPlayer.setIosCategory(IosCategory.playback);
    _player = AudioPlayer();
    _player.setUrl(url).catchError((error) {
      // catch audio error ex: 404 url, wrong url ...
      print(error);
    });
  }

  @override
  void dispose() {
    _volumeSubject.close();
    _speedSubject.close();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Icon(
          Icons.radio,
          color: Colors.black,
          size: 35,
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: PlayerWidget(),
      ),
    );
  }
}
