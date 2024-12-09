import 'package:flutter/material.dart';
import 'package:maternity_app/presentation/onboarding/onboarding_view.dart';
import 'package:maternity_app/presentation/register/register_view.dart';
import 'package:maternity_app/presentation/resources/color_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorManager.BG_Gradient,
        ),
        child: PageView(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          children: [
            OnboardingPage(
              title: 'Welcome to Mamativity',
              description:
              'The perfect app to support your journey through motherhood, from pregnancy to parenting.',
              imagePath: 'assets/images/mother_with_baby1.png',
              buttonText: 'Continue',
              isLast: false,
              onButtonPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            OnboardingPage(
              title: 'Everything you need in one place',
              description:
              '“Pregnancy monitoring week by week”\n“Daily tips for child care”',
              imagePath: 'assets/images/family.png',
              buttonText: 'Continue',
              isLast: false,
              onButtonPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            OnboardingPage(
              title: 'Get started now with Mamativity',
              description:
              'Create your account and enjoy an experience completely customized to your needs.',
              imagePath: 'assets/images/mother_with_child.png',
              buttonText: 'Start now',
              isLast: true,
              onButtonPressed: () {
                // Navigate to RegisterView
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
