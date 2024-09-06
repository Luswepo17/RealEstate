import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rental_app/common/widgets/text/product_title_text.dart';
import 'package:rental_app/features/shop/screens/product-detail/widgets/product_detail_image_slider.dart';
import 'package:rental_app/features/shop/screens/store/store.dart';
import 'package:rental_app/utils/constants/colors.dart';
import 'package:rental_app/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => _showSellerDetails(context), // Show bottom sheet
          child: const Text("Contact Seller"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Seller name',
                        style: Theme.of(context).textTheme.bodyLarge!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => const StoreScreen()),
                        child: const Text("View store"),
                      )
                    ],
                  ),
                  Text(
                    "K4000",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  const AppProductTitleText(
                    title: "3 Bedroomed house",
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  const AppProductTitleText(
                    title: "Lusaka, Meanwood",
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const AppProductTitleText(
                        title: "Status:",
                      ),
                      const SizedBox(
                        width: AppSizes.spaceBtwItems / 2,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(" Available "),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Long description",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: AppColors.darkGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to show bottom sheet with seller details
  void _showSellerDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Seller Details",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('John Doe'), // Seller's name
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('+1234567890'), // Seller's phone number
                onTap: () => _launchPhone('+1234567890'), // Open phone dialer
              ),
              ListTile(
                leading: const Icon(Iconsax.direct_right),
                title: const Text('+1234567890'), // Seller's phone number
                onTap: () => sendSMS('+1234567890'), // Open phone dialer
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Chat on WhatsApp'),
                onTap: () => _launchWhatsApp('+1234567890'), // Open WhatsApp
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('johndoe@example.com'), // Seller's email
                onTap: () =>
                    _launchEmail('johndoe@example.com'), // Open email client
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to launch phone dialer
  void _launchPhone(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // print('Could not launch $url');
    }
  }

  // Function to launch WhatsApp
  void _launchWhatsApp(String phoneNumber) async {
    final Uri url =
        Uri.parse('https://wa.me/$phoneNumber'); // Use the WhatsApp URL scheme
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      //print('Could not launch $url');
    }
  }

  // Function to launch email client
  void _launchEmail(String email) async {
    final Uri url = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      //print('Could not launch $url');
    }
  }

  void sendSMS(String phoneNumber) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      //print('Could not launch $smsUri');
    }
  }
}
