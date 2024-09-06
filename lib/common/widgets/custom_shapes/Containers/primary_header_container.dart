import 'package:flutter/material.dart';
import 'package:rental_app/common/widgets/custom_shapes/Containers/app_circular_container.dart';
import 'package:rental_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:rental_app/utils/constants/colors.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.color,
    required this.height,
  });

  final Widget child;
  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgeWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: AppCircularContainer(
                  backgroondColour: AppColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: AppCircularContainer(
                  backgroondColour: AppColors.textWhite.withOpacity(0.1),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
