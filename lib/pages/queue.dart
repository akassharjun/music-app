import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class QueuePage extends StatelessWidget {
  final SongInfo _songInfo;

  QueuePage(this._songInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 40),
        Text(
          "PLAYING FROM",
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
        Text(_songInfo.album),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: ClipRRect(
            child: Image.file(
              File(_songInfo.albumArtwork),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _songInfo.title.split('(')[0],
                style: TextStyle(fontSize: 22),
                maxLines: 1,
              ),
              SizedBox(height: 1),
              Text(
                _songInfo.artist.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: 0.25,
          onChanged: (double value) {},
          activeColor: Colors.amber[700],
          inactiveColor: Colors.white54,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '0.41',
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              Text(
                _songInfo.year,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              Text(
                '3.24',
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.white70,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        Container(height: 50.0),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.fast_rewind,
                  size: 35.0,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  size: 35.0,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.fast_forward,
                  size: 35.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
