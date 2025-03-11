import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tidal/widget/ListChoice.dart';
import 'Setting.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Collection',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(),
                ),
              );
            },
                icon: Icon(IconlyLight.setting),
                color: Colors.white,
                iconSize: 21,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_outlined),
                color: Colors.white,
              ),
            ],
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'My Mix',
            icons: Icons.wifi_tethering,
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'Playlists',
            icons: Icons.playlist_play,
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'Albums',
            icons: Icons.album_outlined,
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'Tracks',
            icons: Icons.music_note,
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'Videos',
            icons: Icons.play_circle,
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'Artists',
            icons: IconlyLight.voice,
          ),
          ListChoice(
            colors: Colors.grey,
            text: 'Downloads',
            icons: IconlyLight.download,
          ),
        ],
      ),
    );
  }
}
