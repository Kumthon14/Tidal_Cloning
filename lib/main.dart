import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tidal/screens/profile_screen.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://imtdfqzdxiubsudpbmyx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImltdGRmcXpkeGl1YnN1ZHBibXl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA4Mzg0MzUsImV4cCI6MjA1NjQxNDQzNX0.jU4rLjImAeC8h0zOFq-qh_pmr69WHFUoV4IE_D2CeI4',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // พื้นหลังเป็นสีดำทั้งหมด
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // AppBar เป็นสีดำ
          foregroundColor: Colors.white, // สีตัวอักษรใน AppBar
        ),

        cardColor: Colors.black, // สีของ Card หรือ Widget ที่ใช้ cardColor
        dialogBackgroundColor: Colors.black, // Dialog ดำสนิท
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black, // BottomSheet ดำสนิท
        ),
      ),
      home: ProfileScreen(),
    );
  }
}
