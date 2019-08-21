import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongsPage extends StatelessWidget {
  final List<SongInfo> _songs;

  SongsPage(this._songs);

  Widget _buildMusicItem(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: ListTile(
        leading: _buildAlbumArt(index),
        title: _buildSongInfo(index),
        trailing: _buildMoreInfoButton(),
      ),
    );
  }

  IconButton _buildMoreInfoButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }

  Column _buildSongInfo(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _songs[index].title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 2),
        Text(
          _songs[index].artist,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w100, color: Colors.white70),
        ),
      ],
    );
  }

  ClipRRect _buildAlbumArt(int index) {
    return ClipRRect(
      child: Image.file(File(_songs[index].albumArtwork)),
      borderRadius: BorderRadius.circular(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _buildMusicItem(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: _songs.length,
    );
  }
}
