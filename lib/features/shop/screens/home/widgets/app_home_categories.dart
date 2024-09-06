import 'package:flutter/material.dart';
import 'package:rental_app/common/widgets/image_texts_widgets/vertical_image_text.dart';
import 'package:rental_app/utils/constants/image_strings.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return AppVerticalImageText(
            image: AppImages.houseCategory,
            title: 'Rent',
            onTap: () {},
          );
        },
      ),
    );
  }
}
