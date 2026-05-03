import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class OfferBottomSheet extends StatelessWidget {
  const OfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.57,
      padding:  EdgeInsetsDirectional.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 9,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/Vector.svg',
                  width: 23.25,
                  height: 20.6,
                  fit: BoxFit.none,
                ),
                Text(
                  'Request Catalog',
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey700,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/exit.svg',
                    width: 24,
                    height: 24,
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
            SizedBox(height:24),
            Row(
              spacing: 28,
              children: [
                Text('Need By Date',style: GoogleFonts.roboto(fontSize:16, fontWeight: FontWeight.w500,color: AppColors.grey600)),
                Icon(Icons.calendar_month_outlined,color: AppColors.main500,size: 20,),
              ] 
            ),
            SizedBox(height: 12),
            CustomFormField(
              width:MediaQuery.of(context).size.width*0.9, 
              height:48, hint:'Select Date',
              prefix: SizedBox(width:MediaQuery.of(context).size.width*0.35),
               inputAction:TextInputAction.next,
                keyboard: TextInputType.datetime, 
                border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grey100, ),
            ),
             focused:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.main500, ),
             ), 
             enabled:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grey100, ),
             ),
              obscuretext: false),
             SizedBox(height:24),
             Text('Quantity',style: GoogleFonts.roboto(fontSize:16, fontWeight: FontWeight.w500,color: AppColors.grey600)),
             SizedBox(height:12),
             CustomFormField(width:MediaQuery.of(context).size.width*0.9, 
             height:48,
              hint:'Quantity',
              prefix: SvgPicture.asset('assets/icons/quantity.svg',width:17.99,height:15.87,fit:BoxFit.none,),
               inputAction:TextInputAction.next,
                keyboard: TextInputType.number,
                 border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grey100, ),
             ), 
             focused:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.main500, ),
             ), enabled: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grey100, ),
             ), 
             obscuretext:false),
             SizedBox(height:24),
             Text('Details',style: GoogleFonts.roboto(fontSize:16, fontWeight: FontWeight.w500,color: AppColors.grey600)),
              SizedBox(height:12),
              Expanded(
                child:CustomFormField(width:MediaQuery.of(context).size.width*0.9, 
                 height:MediaQuery.of(context).size.height*0.22,
                hint:'Enter Details',
                maxLines:4,
                 inputAction:TextInputAction.newline,
                  keyboard: TextInputType.multiline,
                prefixConstraints: BoxConstraints(maxHeight:18,maxWidth: 18),
                             // contentpadding: EdgeInsets.all(12),
                prefix:Icon(Icons.chat_outlined,color: AppColors.main500,size:25,opticalSize:16 ),
                   border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.grey100, ),
                             ), 
                             focused:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.main500, ),
                             ), enabled: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.grey100, ),
                             ), 
                             obscuretext:false),
              ),
            SizedBox(height:24),
            Expanded(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(width: 1, color: AppColors.main500),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.main500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.main500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(width: 1, color: AppColors.main500),
                      ),
                    ),
                    onPressed: () {
                      //  not finished yet
                      Get.back();
              
                      Get.snackbar(
                        'you request done',
                        'waiting for it',
                        backgroundColor: AppColors.main500,
                        colorText: AppColors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 3),
                      );
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.yellow,
                      ),
                    ),
                  ),
                ), 
              ],
                        ),
            ),
          ],
        ),
      
    );
  }
}
