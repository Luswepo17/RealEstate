import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:rental_app/common/widgets/appbar/appbar.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/app_rounded_container.dart';
import 'package:rental_app/navigation_menu.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:rental_app/utils/helpers/helper_functions.dart';

class AddImageForm extends StatefulWidget {
  const AddImageForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddImageFormState createState() => _AddImageFormState();
}

class _AddImageFormState extends State<AddImageForm> {
  File? _selectedImage; // To hold the selected image
  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker

  final controller = Get.put(NavigationController());
  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _selectedImage =
            File(image.path); // Update the state with the selected image
      });
    }
  }

  void callUploadImageApi() async {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "Success",
        desc: "Listing has been added successfully",
        btnCancelOnPress: () {},
        btnOkOnPress: () => {
              controller.selectedINdex.value = 0,
              Get.to(() => const NavigationMenu())
            }).show();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const AppAppBar(
          title: Text("Upload Images"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : const AppRoundedContainer(
                      height: 200,
                      width: 200,
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppHelperFunctions.screenWidth() / 2.5,
                    child: ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: const Text("Select from Gallery"),
                    ),
                  ),
                  SizedBox(
                    width: AppHelperFunctions.screenWidth() / 2.5,
                    child: ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: const Text("Take a Photo"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              OutlinedButton(
                  onPressed: () => callUploadImageApi(),
                  child: const Text("Done"))
            ],
          ),
        ),
      ),
    );
  }
}
