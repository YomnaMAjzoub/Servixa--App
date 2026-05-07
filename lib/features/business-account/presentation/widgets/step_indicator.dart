import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.currentStep,
     this.totalSteps = 4,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index){
        bool isActive = index-1 < currentStep;

        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin:  EdgeInsets.symmetric(horizontal: 8),
            height: 8.5,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.main500
                  : AppColors.grey100,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        );
      })
    );
  }
}
