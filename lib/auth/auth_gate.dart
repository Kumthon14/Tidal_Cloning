import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tidal/screens/profile_screen.dart';

import '../screens/login.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return ProfileScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
