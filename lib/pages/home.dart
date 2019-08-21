import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/pages/albums.dart';
import 'package:music_app/pages/artists.dart';
import 'package:music_app/pages/playlists.dart';
import 'package:music_app/pages/queue.dart';
import 'package:music_app/pages/songs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterAudioQuery _audioQuery = FlutterAudioQuery();
  final PageController _pageController = PageController(initialPage: 1);

  List<SongInfo> _songs = [];
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  Future _fetchSongs() async {
    _songs = await _audioQuery.getSongs();
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInToLinear,
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Music Player"),
      centerTitle: true,
      backgroundColor: Colors.black26,
      actions: <Widget>[_buildSearchButton()],
    );
  }

  Widget _buildSearchButton() {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
    );
  }

  Widget _buildBody() {
    return _songs.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: <Widget>[
              QueuePage(),
              SongsPage(_songs),
              ArtistsPage(),
              AlbumsPage(),
              PlaylistsPage()
            ],
          );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      child: BottomNavigationBar(
        backgroundColor: Colors.black26,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            title: Text('Queue'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Songs'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Artists'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            title: Text('Albums'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            title: Text('Playlists'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
