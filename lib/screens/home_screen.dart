import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tidal/constant/constant.dart';

import '../widget/Essential.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

String getSongImageUrl(String fileName) {
  return supabase.storage.from('Covers').getPublicUrl(fileName);
}

Future<List<dynamic>> fetchData() async {
  final response = await supabase.from('Songs').select('*');
  return response;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Map<String, dynamic>? selectedSong;

  void _onSongSelected(Map<String, dynamic> song) {
    setState(() {
      selectedSong = song; // อัพเดตข้อมูลเพลงที่เลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: Colors.black.withOpacity(0),
        expandedHeight: 100,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsetsDirectional.only(start: 20, bottom: 16),
          title: Text(
            "Home",
            style: textTitle,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search Pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Settings Pressed');
            },
          ),
        ],
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          //Essential
          EssentialWidget(),

          //New track
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Justine.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.9,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Recommended new tracks',
                              style: textSubTitle,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(195, 31, 31, 31),
                                ),
                                child: Icon(
                                  IconlyLight.arrow_right_2,
                                  size: 18,
                                  weight: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.78,
                          child: FutureBuilder<List<dynamic>>(
                            future: fetchData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Center(child: Text('No data found'));
                              }

                              final songs = snapshot.data!;

                              return ListView.builder(
                                itemCount: songs.length,
                                itemBuilder: (context, index) {
                                  final song = songs[index];
                                  return ListTile(
                                    leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://imtdfqzdxiubsudpbmyx.supabase.co/storage/v1/object/public/Covers//${song['title']}.jpg'))),
                                    ),
                                    title: Text(
                                      song['title'] ?? 'No Title',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      song['artist'] ?? 'Unknown Artist',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    trailing: Icon(Icons.more_horiz),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      
    ]);
  }
}
