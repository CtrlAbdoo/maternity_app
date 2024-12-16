import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maternity_app/presentation/forgot_password/OTP_view.dart';
import 'package:maternity_app/presentation/forgot_password/reset_password_view.dart';
import 'package:maternity_app/presentation/resources/color_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        // Background Image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Sign_In.png'), // Replace with your image
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar with Back Arrow, Logo, and Title
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logo2.png', // Replace with your logo path
                      height: screenHeight * 0.08,
                      width: screenWidth * 0.1,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'Mamativity',
                      style: GoogleFonts.inriaSerif(
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

              // Title: Forget Password
              Center(
                child: Text(
                  'Forget Password',
                  style: GoogleFonts.inriaSerif(
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Subtitle
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Reset account password and access\nyour personal account again',
                  style: GoogleFonts.inriaSerif(
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Form Section
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.inriaSerif(
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: ColorManager.txtEditor_font_color,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.3),

                      // Next Button Row
                      Row(
                        children: [
                          // "Next" Text
                          Text(
                            'Next',
                            style: GoogleFonts.inriaSerif(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const Spacer(),

                          // Circular Button with Arrow
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerificationCodeView(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFB6E8F8), // Light Blue
                                    Color(0xFF90CAF9), // Sky Blue
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              padding: EdgeInsets.all(screenWidth * 0.06),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: screenWidth * 0.06,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
