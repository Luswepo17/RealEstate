import 'package:flutter/material.dart';
import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/text/app_section_heading.dart';
import 'package:rental_app/features/personalization/screens/create-listing/widgets/create_listing_form.dart';
import 'package:rental_app/utils/constants/sizes.dart';

class CreateListing extends StatelessWidget {
  const CreateListing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text("Add new listing"),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppSectionHeading(
                title: "Fill in the form",
                showActionButton: false,
                smallSize: true,
              ),
              Divider(),
              Createlistingform()
            ],
          )),
    );
  }
}
