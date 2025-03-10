import 'package:flutter/material.dart';
import 'package:tidal/auth/auth_service.dart';
import 'package:tidal/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('/images/Backgroud_Login.jpg'),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Image(
              image: AssetImage('assets/images/tidal-tall-white-rgb.png'),
              width: 150,
              height: 150,
            ),
            Text(
              'Log in',
              style: TextStyle(
                fontFamily: 'Nationale',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                    fontFamily: 'Nationale',
                    color: Color.fromARGB(255, 77, 77, 77),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  fillColor: const Color.fromARGB(255, 22, 22, 22),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    fontFamily: 'Nationale',
                    color: Color.fromARGB(255, 77, 77, 77),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  fillColor: const Color.fromARGB(255, 22, 22, 22),
                  filled: true,
                  labelStyle: TextStyle(
                    fontFamily: 'Nationale',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextButton(
                onPressed: login,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: 'Nationale',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: const Color.fromARGB(
                      255, 85, 85, 85), // กำหนดสีพื้นหลังปุ่ม
                  foregroundColor:
                      const Color.fromARGB(255, 36, 36, 36), // กำหนดสีข้อความ
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // ปรับความโค้งของมุมปุ่ม
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: const Text(
                    "Don't have account? SignUp",
                    style: TextStyle(
                      fontFamily: 'Nationale',
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                      color: Color.fromARGB(255, 136, 136, 136),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    ));
  }
}
