import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Q1 extends StatefulWidget {
  @override
  _Q1State createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  bool isYesSelected = false;
  bool isNoSelected = false;
  int selectedYear = DateTime.now().year;
  int selectedMonth = 1;
  int selectedDay = 1;

  void _showConfirmationDialog() {
    final selectedDate = DateTime(selectedYear, selectedMonth, selectedDay);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Child history"),
        content: Text("The selected date of birth is: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Change"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Sure"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD6E7), Color(0xFFB5E4F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Top Image
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.03),
              height: screenHeight * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/MAE 1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Question Title
            Text(
              "Do you have children?",
              style: GoogleFonts.inriaSerif(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            // Yes/No Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isYesSelected = true;
                    isNoSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF965391).withOpacity(
                      isYesSelected ? 1.0 : 0.59),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.012,
                    horizontal: screenWidth * 0.392,
                  ),
                ),
                child: Text(
                  "Yes",
                  style: GoogleFonts.inriaSerif(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.1),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isYesSelected = false;
                  isNoSelected = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF965391).withOpacity(
                    isNoSelected ? 1.0 : 0.59),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.012,
                  horizontal: screenWidth * 0.392,
                ),
              ),
              child: Text(
                "No",
                style: GoogleFonts.inriaSerif(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Date of Birth Picker
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              child: Column(
                children: [
                  Text(
                    "Select the child's date of birth",
                    style: GoogleFonts.inriaSerif(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.2,
                          child: ListWheelScrollView(
                            itemExtent: 40,
                            physics: FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedYear = DateTime.now().year - index;
                              });
                            },
                            children: List.generate(
                              100,
                                  (index) => Center(
                                child: Text(
                                  "${DateTime.now().year - index}",
                                  style: GoogleFonts.inriaSerif(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.2,
                          child: ListWheelScrollView(
                            itemExtent: 40,
                            physics: FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedMonth = index + 1;
                              });
                            },
                            children: List.generate(
                              12,
                                  (index) => Center(
                                child: Text(
                                  "${index + 1}",
                                  style: GoogleFonts.inriaSerif(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.2,
                          child: ListWheelScrollView(
                            itemExtent: 40,
                            physics: FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedDay = index + 1;
                              });
                            },
                            children: List.generate(
                              31,
                                  (index) => Center(
                                child: Text(
                                  "${index + 1}",
                                  style: GoogleFonts.inriaSerif(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Start Button
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.05),
              child: ElevatedButton(
                onPressed: _showConfirmationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.017,
                    horizontal: screenWidth * 0.142,
                  ),
                ),
                child: const Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
