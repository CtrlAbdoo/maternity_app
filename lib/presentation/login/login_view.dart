import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maternity_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:maternity_app/presentation/register/register_view.dart';
import 'package:maternity_app/presentation/resources/color_manager.dart';
import 'package:maternity_app/presentation/resources/font_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
                                  onTap: () {
                                    // Handle sign in action
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
