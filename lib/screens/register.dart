import 'package:flutter/material.dart';
import 'package:tidal/screens/login.dart';

import '../auth/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmpasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password don't match")));
      return;
    }
    try {
      await authService.signUpWithEmailPassword(email, password);

      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Error")));
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
              'Sign Up',
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
              child: TextField(
                obscureText: true,
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Confirm your password",
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
                onPressed: signUp,
                child: Text(
                  'Sign Up',
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: const Text(
                    "Have account? LogIn",
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
