import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maternity_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:maternity_app/presentation/register/register_view.dart';
import 'package:maternity_app/presentation/resources/color_manager.dart';
import 'package:maternity_app/presentation/resources/font_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDzMZudRySjN_QOMxxgM7iPFjRzuLIjDzo",
      authDomain: "mama-tivity-78154.firebaseapp.com",
      projectId: "mama-tivity-78154",
      storageBucket: "mama-tivity-78154.firebasestorage.app",
      messagingSenderId: "151382857029",
      appId: "1:151382857029:web:0ff0c9382d7cea88969a2c",
      measurementId: "G-H3DBGF81RD",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String email;
  late String password;
  String? _errorMessage;

  // Sign-in method using Firebase Authentication
  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to another screen on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterView()), // Replace with your home screen
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Sign_Up.png', // Replace with your background image asset
              fit: BoxFit.cover,
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height, // Full screen height
                child: Column(
                  children: [
                    // Back Button and Logo
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                color: ColorManager.secondary_font_color),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterView()),
                              );
                            },
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/logo2.png', // Replace with your logo asset
                            height: 40,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Mamativity',
                            style: GoogleFonts.inriaSerif(
                              textStyle: TextStyle(
                                fontSize: FontSize.s24,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.primary_font_color,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 150),

                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome\nBack',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inriaSerif(
                            textStyle: TextStyle(
                              fontSize: FontSize.s40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 100),

                    // Form Background
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Email Field
                            TextFormField(
                              onChanged:(value) {
                                email=value;
                              }
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: const UnderlineInputBorder(),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Password Field
                            TextFormField(
                              onChanged :(value){
                                password=value;
                              }
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: const UnderlineInputBorder(),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                suffixIcon: Icon(Icons.visibility_off),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Forgot Password Link
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => ForgotPasswordView()),
                                  );
                                },
                                child: Text(
                                  'Forget password',
                                  style: GoogleFonts.inriaSerif(
                                    textStyle: TextStyle(
                                      fontSize: FontSize.s16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Sign In Button
                            Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      var user = await auth.signInWithEmailAndPassword(
                                        email:email , password:password);
                                        if(user!=null){
                                          Navigator.push(context,MaterialPageRoute(builder:(context)=>register_view(),));
                                        }
                                    }catch (e) {
                                      print (e);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFB6E8F8), // Light blue
                                          Color(0xFF90CAF9), // Sky blue
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      color: ColorManager.primary_font_color,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Sign Up Link
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterView()),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.inriaSerif(
                                  textStyle: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),

                            // Display Error Message
                            if (_errorMessage != null) 
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _errorMessage!,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
