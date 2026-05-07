import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/common/widgets/elevated_button.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 101,
                height: 101,
                child: SvgPicture.asset(
                  'assets/images/contact-image.svg',
                  fit: BoxFit.none,
                  width: 80,
                  height: 80,
                  alignment: AlignmentGeometry.topCenter,
                ),
              ),
            ),
         
            SizedBox(height: 24),
            Center(
              child: Text(
                'business_title3'.tr(),
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey700,
                ),
              ),
            ),

            SizedBox(height: 24),

            Text(
              'city'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),

              SizedBox(height:12),
              
              Container(
                width: MediaQuery.of(context).size.width*0.91,
                height:48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                 
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText:'city'.tr(), 
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey800
                      ), 
                    suffixIcon: Icon(Icons.keyboard_arrow_down, color: AppColors.main500,size:25), 
                    
                    prefixIcon: SvgPicture.asset('assets/icons/cities.svg',width:18,height: 18,fit: BoxFit.none),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey100, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey100, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey100, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  items: ['City 1', 'City 2', 'City 3'].map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle city selection
                  },
                ),
              ),

              SizedBox(height: 24),

              Text(
              'address_detail'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey600,
              ),
              ),

              SizedBox(height:12),

              CustomFormField(
                width: MediaQuery.of(context).size.width*0.91,
                height:MediaQuery.of(context).size.height*0.12,
                hint: 'address_detail'.tr(),
                prefixConstraints: BoxConstraints(minWidth: 40, minHeight: 40,maxHeight:40,maxWidth:40 ),
                prefix: Align(
                 alignment: AlignmentGeometry.directional(0,-2.2),
                  child: SvgPicture.asset('assets/icons/adress.svg',width:18,height: 18,fit: BoxFit.none),
                ),
                inputAction: TextInputAction.next,
                maxLines: 4,
                keyboard:TextInputType.text,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.grey100,width: 1),
                 ),
                  focused:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                    enabled:OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: AppColors.grey100,width: 1)),
                     obscuretext: false,
                 ),

                 SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/location_icon.svg', width:12.5, height:15, fit: BoxFit.none),
                    SizedBox(width:8),
                    Expanded(
                      child: Text(
                        'location_on_map',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey300,
                        ),
                        ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                Card(
                  color: AppColors.white,
                  elevation: 6,  
                 
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(18),
            ),
            child:SizedBox(
              width:double.infinity,
              height: MediaQuery.of(context).size.height*0.34,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Expanded(
                  child: ClipRRect(
                        borderRadius:  BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18)),
                        child: Image.asset('assets/images/map.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                      ),
                ),
          
                SizedBox(height: 12,),

                 Center(
                   child: CustomElevated(text:'location'.tr(), 
                   height:48,
                   width: MediaQuery.of(context).size.width*0.84, 
                    onPressed:() {
                      
                    },
                     background:AppColors.white,
                      textColor:AppColors.main500
                      ),
                 ),

                 SizedBox(height:20),

                ],
              ),
            ),
                ),


        
           
          ],
        ),
      ),
    );
  } 
}