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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> fetchData() async {
    final response = await supabase.from('Songs').select('*');
    return response; // response เป็น List<dynamic>
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 0.12,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/frank.jpg'),
                                        fit: BoxFit.cover)),
                                width: MediaQuery.of(context).size.width * 0.12,
                                height: MediaQuery.of(context).size.width,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: FutureBuilder<List<dynamic>>(
                                  future: fetchData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child:
                                              CircularProgressIndicator()); // โหลดข้อมูล
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child: Text(
                                              'Error: ${snapshot.error}')); // แสดงข้อผิดพลาด
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return Center(
                                          child: Text(
                                              'No data found')); // ไม่มีข้อมูล
                                    }

                                    final songs =
                                        snapshot.data!; // ดึงข้อมูลจาก snapshot

                                    return ListView.builder(
                                      itemCount: songs.length,
                                      itemBuilder: (context, index) {
                                        final song =
                                            songs[index]; // ดึงข้อมูลแต่ละเพลง
                                        return ListTile(
                                          leading: Icon(Icons.music_note,
                                              color: Colors.blue),
                                          title: Text(song['title'] ??
                                              'No Title'), // แสดงชื่อเพลง
                                          subtitle: Text(song['artist'] ??
                                              'Unknown Artist'), // แสดงชื่อศิลปิน
                                        );
                                      },
                                    );
                                  },
                                ),
                                // child: Container(
                                //   child: Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         'test',
                                //         style: GoogleFonts.montserrat(
                                //           fontSize: 16,
                                //           fontWeight: FontWeight.w600,
                                //           color: textPrimaryColor,
                                //         ),
                                //       ),
                                //       Spacer(),
                                //       Text(
                                //         'Tyler',
                                //         style: GoogleFonts.montserrat(
                                //           fontSize: 13,
                                //           fontWeight: FontWeight.w400,
                                //           color: textPrimaryColor,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_horiz,
                                  size: 20,
                                  weight: 15,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      )

      //   SliverToBoxAdapter(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Stack(children: [
      //         Container(
      //           height: 75,
      //           width: MediaQuery.of(context).size.width,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               border: Border.all(
      //                   style: BorderStyle.solid, color: Colors.white),
      //               image: DecorationImage(
      //                   image: AssetImage('assets/images/frank.jpg'),
      //                   fit: BoxFit.cover)),
      //         ),
      //         Text('Test')
      //       ]),
      //     ),
      //   ),
      // ],
    ]);
  }
}
