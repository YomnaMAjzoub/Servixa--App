import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FilterAdType extends StatelessWidget {
  const FilterAdType({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChoiceChip(
         checkmarkColor: AppColors.main400,
          label:  Text("Buying",style: GoogleFonts.roboto(fontSize:14,fontWeight:FontWeight.w500,color:AppColors.grey300),),
          selected: value == "buying",
          onSelected: (_) => onChanged("buying"),
        ),

        ChoiceChip(
          checkmarkColor: AppColors.main400,
          label:  Text("Selling",style: GoogleFonts.roboto(fontSize:14,fontWeight:FontWeight.w500,color:AppColors.grey300)),
          selected: value == "selling",
          onSelected: (_) => onChanged("selling"),
        ),
      ],
    );
  }
}