import 'package:flutter/material.dart';
import 'package:maternity_app/presentation/resources/color_manager.dart';
import 'package:maternity_app/presentation/resources/font_manager.dart';
import 'package:maternity_app/presentation/resources/values_manager.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final bool isLast;
  final VoidCallback onButtonPressed;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    required this.isLast,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        children: [
          const Spacer(),

          // Progress Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  height: 4,
                  width: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isLast
                        ? (i == 0 ? Colors.blue : Colors.grey.shade300) // Last page
                        : (i == 1 && isLast)
                        ? Colors.blue // First page active
                        : (i == 2 && isLast)
                        ? Colors.blue // Second page active
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),


          const SizedBox(height: AppSize.s20),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: FontSize.s22,
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.fontFamily,
              color: ColorManager.primary_font_color,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSize.s20),

          // Image
          Image.asset(
            imagePath,
            height: 250,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: AppSize.s12),

          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.regular,
              fontFamily: FontConstants.fontFamily,
              color: ColorManager.secondary_font_color,
            ),
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Example: Go back
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.medium,
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.txtEditor_font_color,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onButtonPressed, // Use the passed callback
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p20,
                      vertical: AppPadding.p12,
                    ),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSize.s20),
        ],
      ),
    );
  }
}
