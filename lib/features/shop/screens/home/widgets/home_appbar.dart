import 'package:flutter/material.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  String getGreetingMessage() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning!";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon!";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening!";
    } else {
      return "Good Night!";
    }
  }

  @override
  Widget build(BuildContext context) {
    String greetingMessage = getGreetingMessage();
    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greetingMessage,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppBarSubTitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
