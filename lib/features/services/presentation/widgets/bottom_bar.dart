import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/orders/presentation/screens/offer_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only( top: 8),
      height: MediaQuery.of(context).size.height*0.12,
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        items: [
        BottomNavigationBarItem( 
          icon:SizedBox(
            width: MediaQuery.of(context).size.width*0.43,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppColors.main500, width: 1),
                ),
              ),
              onPressed:(){},
             child:Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                SvgPicture.asset('assets/icons/messages.svg',width:21,height:20,fit: BoxFit.none,),
                 Text('Chat',style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.main500,
                 )),
               ],
             )),
          ),
        label:''),
       
        BottomNavigationBarItem(icon: SizedBox(
            width: MediaQuery.of(context).size.width*0.43,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.main500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppColors.main500, width: 1),
                ),
              ),
              onPressed:(){
                Get.bottomSheet(  
                  OfferBottomSheet());
              },
             child:Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                SvgPicture.asset('assets/icons/offer.svg',width:24,height:24,fit: BoxFit.none,),
                 Text('Make An Offer',style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.yellow,
                 )),
               ],
             )),
          ),
        label: ''),
      ]),
    );
  }
}
