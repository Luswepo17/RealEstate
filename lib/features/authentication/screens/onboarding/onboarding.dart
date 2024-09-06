import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/features/authentication/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:rental_app/features/authentication/screens/onboarding/widgets/on_boarding_next.dart';
import 'package:rental_app/features/authentication/screens/onboarding/widgets/on_boarding_page.dart';
import 'package:rental_app/features/authentication/screens/onboarding/widgets/on_boarding_skip.dart';
import 'package:rental_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:rental_app/utils/constants/image_strings.dart';
import 'package:rental_app/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
