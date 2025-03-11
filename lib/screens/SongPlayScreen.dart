import 'dart:ui'; // เพิ่มการ import
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SongPlayScreen extends StatefulWidget {
  final List<dynamic> songs;
  final int currentIndex;

  const SongPlayScreen({
    Key? key,
    required this.songs,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _SongPlayScreenState createState() => _SongPlayScreenState();
}

class _SongPlayScreenState extends State<SongPlayScreen> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;
  bool isLooping = false;
  bool isShuffling = false;
  late List<int> shuffledIndexes;

  Color shuffColor = const Color.fromARGB(255, 104, 104, 104);
  Color loopColor = const Color.fromARGB(255, 104, 104, 104);

  IconData LikeIcon = IconlyLight.heart;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    shuffledIndexes = List.generate(widget.songs.length, (index) => index);

    loadSong();

    _audioPlayer.onPositionChanged.listen((pos) {
      setState(() {
        _position = pos;
      });
    });

    _audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        _duration = dur;
      });
    });

    // ฟังก์ชันเมื่อเพลงจบ
    _audioPlayer.onPlayerComplete.listen((event) {
      if (isLooping) {
        loadSong(); // เล่นวนซ้ำ
      } else {
        _playNext();
      }
    });
  }

  void loadSong() async {
    final song = widget.songs[widget.currentIndex];
    final songTitle = song['title'] ?? '';
    final songUrl =
        supabase.storage.from('Songs').getPublicUrl(songTitle + '.mp3');

    // ดึงค่า duration จาก Database (วินาที)
    final int songDuration = (song['duration']).toInt() ?? 0;
    setState(() {
      _duration = Duration(seconds: songDuration);
    });

    if (songUrl.isNotEmpty) {
      await _audioPlayer.play(UrlSource(songUrl));
      setState(() {
        isPlaying = true;
      });
    }
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void seekTo(double value) {
    final position = Duration(seconds: value.toInt()); // แปลงเป็น int
    _audioPlayer.seek(position);
  }

  void _playNext() {
    int nextIndex = isShuffling
        ? shuffledIndexes.firstWhere((index) => index != widget.currentIndex)
        : (widget.currentIndex + 1) % widget.songs.length;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SongPlayScreen(
          songs: widget.songs,
          currentIndex: nextIndex,
        ),
      ),
    );
  }

  void _playPrevious() {
    int prevIndex = isShuffling
        ? shuffledIndexes.firstWhere((index) => index != widget.currentIndex)
        : (widget.currentIndex - 1 + widget.songs.length) % widget.songs.length;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SongPlayScreen(
          songs: widget.songs,
          currentIndex: prevIndex,
        ),
      ),
    );
  }

  void toggleLoop() {
    setState(() {
      isLooping = !isLooping;
      if (loopColor == const Color.fromARGB(255, 104, 104, 104)) {
        loopColor = Colors.white;
      } else {
        loopColor = const Color.fromARGB(255, 104, 104, 104);
      }
    });
  }

  void toggleShuffle() {
    setState(() {
      isShuffling = !isShuffling;
      if (shuffColor == const Color.fromARGB(255, 104, 104, 104)) {
        shuffColor = Colors.white;
      } else {
        shuffColor = const Color.fromARGB(255, 104, 104, 104);
      }
      shuffledIndexes.shuffle();
    });
  }

  void toggleLike() {
    setState(() {
      if (LikeIcon == IconlyLight.heart) {
        LikeIcon = IconlyBold.heart;
      } else {
        LikeIcon = IconlyLight.heart;
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final song = widget.songs[widget.currentIndex];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter:
                ImageFilter.blur(sigmaX: 20, sigmaY: 20), // ค่าความเบลอ
            child: Image.network(
              'https://imtdfqzdxiubsudpbmyx.supabase.co/storage/v1/object/public/Covers/${song['title']}.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Center(
                      child: Text(
                        'Playing',
                        style: TextStyle(
                          fontFamily: 'Nationale',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: Icon(IconlyLight.bookmark),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://imtdfqzdxiubsudpbmyx.supabase.co/storage/v1/object/public/Covers/${song['title']}.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  ListTile(
                    title: Text(
                      song['title'] ?? 'No Title',
                      style: TextStyle(
                          fontFamily: 'Nationale',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      song['artist'] ?? 'Unknown Artist',
                      style: TextStyle(fontFamily: 'Nationale', fontSize: 18),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(LikeIcon),
                          onPressed: toggleLike,
                        ),
                        IconButton(
                          icon: Icon(IconlyLight.download),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // ** SeekBar **
                  Slider(
                    value: _position.inSeconds.toDouble(),
                    max: _duration.inSeconds.toDouble(),
                    onChanged: seekTo,
                    activeColor: Colors.white,
                  ),

                  // ** แสดงเวลา (ปัจจุบัน / ระยะเวลาทั้งหมด) **
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(_position),
                          style: TextStyle(
                            fontFamily: 'Nationale',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 104, 104, 104),
                          ),
                        ),
                        Text(
                          _formatDuration(_duration),
                          style: TextStyle(
                            fontFamily: 'Nationale',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 104, 104, 104),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ปุ่มควบคุม
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          isLooping ? Icons.repeat_one : Icons.repeat,
                          size: 20,
                        ),
                        color: loopColor,
                        onPressed: toggleLoop,
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_previous, size: 36),
                        color: Colors.white,
                        onPressed: _playPrevious,
                      ),
                      IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50),
                        color: Colors.white,
                        onPressed: togglePlayPause,
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next, size: 36),
                        color: Colors.white,
                        onPressed: _playNext,
                      ),
                      IconButton(
                        icon: Icon(
                          isShuffling ? Icons.shuffle : Icons.shuffle_rounded,
                          size: 20,
                        ),
                        color: shuffColor,
                        onPressed: toggleShuffle,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันแปลงเวลาให้เป็นรูปแบบ mm:ss
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
