import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tidal/constant/constant.dart';
import 'package:tidal/widget/Choice.dart';

import '../widget/ChoiceName.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final ScrollController _scrollController = ScrollController();
  final Search_Controller = TextEditingController();

  final List<String> genres = [
    'Hip-Hop',
    'Pop',
    'R&B / Soul',
    'Rock / Indie',
    'Dance & Electronic',
    'Latin',
    'Country',
  ];

  final List<String> activities = [
    'For DJs',
    'Record Labels',
    'Collabs',
    'Music school',
    'Workout',
    'Sleep',
    'Party',
  ];

  final List<String> decades = [
    '1950s',
    '1960s',
    '1970s',
    '1980s',
    '1990s',
    '2000s',
    '2010s',
  ];

  CrossAxisAlignment _appBaralignment = CrossAxisAlignment.start;
  double _appBarSize = 22;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 200) {
      setState(() {
        _appBaralignment = CrossAxisAlignment.center;
        _appBarSize = 16;
      });
    } else {
      setState(() {
        _appBaralignment = CrossAxisAlignment.start;
        _appBarSize = 22;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // ล้าง Controller เมื่อ Widget ถูกทำลาย
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar (Fixed อยู่ด้านบน)
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: _appBaralignment,
              children: [
                Text(
                  "Explore",
                  style: GoogleFonts.montserrat(
                    fontSize: _appBarSize,
                    fontWeight: FontWeight.w600,
                    color: textPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: Search_Controller,
                  obscureText: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      prefixIcon: Icon(
                        IconlyLight.search,
                        color: Colors.grey,
                        size: 18,
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      constraints: BoxConstraints(maxHeight: 30)),
                )
              ],
            ),
          ),
        ),

        // Expanded ทำให้เนื้อหา Scroll ได้
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                ChoiceName(name: 'Genres'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        genres.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                              right: 20), // ใช้ Padding แทน SizedBox
                          child: ChoiceList(text: genres[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                ChoiceName(name: 'Moods,Activities\n& Events'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        genres.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                              right: 20), // ใช้ Padding แทน SizedBox
                          child: ChoiceList(text: activities[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                ChoiceName(name: 'Decades'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        genres.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                              right: 20), // ใช้ Padding แทน SizedBox
                          child: ChoiceList(text: decades[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                
              ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}
