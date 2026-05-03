import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/common/widgets/text_field.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

  InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.grey100, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomGradient(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.offNamed(AppRouter.mainProfile);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.grey700,
                    ),
                  ),

                  const SizedBox(height: 15),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Update ",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey800,
                        ),
                      ),
                      Text(
                        "Profile ",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.main500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 48,
                          hint: 'Name Arabic ',
                          prefix: SvgPicture.asset(
                            'assets/icons/person_icon.svg',
                            width: 13.5,
                            height: 15.75,
                            fit: BoxFit.none,
                          ),
                          inputAction: TextInputAction.next,
                          keyboard: TextInputType.name,
                          border: border,
                          focused: border,
                          enabled: border,
                          obscuretext: false,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomFormField(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 48,
                          hint: 'Name English',
                          prefix: SvgPicture.asset(
                            'assets/icons/person_icon.svg',
                            width: 13.5,
                            height: 15.75,
                            fit: BoxFit.none,
                          ),
                          inputAction: TextInputAction.next,
                          keyboard: TextInputType.name,
                          border: border,
                          focused: border,
                          enabled: border,
                          obscuretext: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  CustomFormField(
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 48,
                    hint: 'Email Address',
                    prefix: SvgPicture.asset(
                      'assets/icons/message.svg',
                      width: 14.25,
                      height: 14.41,
                      fit: BoxFit.none,
                    ),
                    inputAction: TextInputAction.next,
                    keyboard: TextInputType.emailAddress,
                    border: border,
                    focused: border,
                    enabled: border,
                    obscuretext: false,
                  ),

                  SizedBox(height: 24),

                  CustomFormField(
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 48,
                    hint: 'Phone Number',
                    prefix: SvgPicture.asset(
                      'assets/icons/phone-icon.svg',
                      width: 15.44,
                      height: 14.65,
                      fit: BoxFit.none,
                    ),
                    inputAction: TextInputAction.next,
                    keyboard: TextInputType.phone,
                    border: border,
                    focused: border,
                    enabled: border,
                    obscuretext: false,
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.91,
                    height: 48,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                      
                        labelText: 'City',
                        labelStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey800,
                        ),
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/cities.svg',
                          width: 18,
                          height: 18,
                          fit: BoxFit.none,
                        ),
                          suffixIcon:Icon(Icons.arrow_drop_down_sharp,color: AppColors.main500,),
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      items: [
                        DropdownMenuItem(value: 'syria', child: Text('syria')),
                        DropdownMenuItem(value: 'homs', child: Text('homs')),
                        DropdownMenuItem(
                          value: 'aleppo',
                          child: Text('aleppo'),
                        ),
                      ],
                      onChanged: (value) {
                        value = value;
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                   SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              height: 158,
              child: TextFormField(
                maxLines: 10,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: ' Address Detail',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey200,
                  ),
            
                  //contentPadding: EdgeInsets.all(16),
                  //alignLabelWithHint: true,
                  prefixIconConstraints: BoxConstraints(
                    maxHeight:15,
                    maxWidth: 15,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical:16,horizontal:16),
                  prefix: SvgPicture.asset(
                    'assets/icons/adress.svg',
                    width:15,
                    height: 15,
                    fit: BoxFit.none,
                  ),
                  border: border,
                  focusedBorder: border,
                  enabledBorder:border
                ),
              ),
            ),
          SizedBox(height:24),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location_icon.svg',
                width: 12.5,
                height: 15,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  '742 Evergreen Terrace, Springfield',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: AppColors.grey300,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:24),
          Card(
            color: AppColors.white,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18)),
                      child: Image.asset('assets/images/map.png',fit: BoxFit.cover,filterQuality: FilterQuality.high,),
                    ),
                  ),
                 // SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:10,horizontal:16),
                    child: SizedBox(
                      width:MediaQuery.of(context).size.width*0.91,
                      height:48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(color: AppColors.main500,width: 1),
                      ),
                      onPressed:(){},
                       child:Text('View Location',style: GoogleFonts.roboto(fontSize:14,fontWeight: FontWeight.w400,color:AppColors.main500),),
                       ),
                       ),
                  ),
                  
                ],
              ),
            ),
          ),
          SizedBox(height:24),
                      SizedBox(
                      width:MediaQuery.of(context).size.width*0.91,
                      height:48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(color: AppColors.main500,width: 1),
                      ),
                      onPressed:(){},
                       child:Text('Upload picture',style: GoogleFonts.roboto(fontSize:14,fontWeight: FontWeight.w400,color:AppColors.main500),),
                       ),
                       ),
                  
                  SizedBox(height:24),
                   SizedBox(
                      width:MediaQuery.of(context).size.width*0.91,
                      height:48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.main500,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(color: AppColors.main500,width: 1),
                      ),
                      onPressed:(){},
                       child:Text('Update',style: GoogleFonts.roboto(fontSize:14,fontWeight: FontWeight.w400,color:AppColors.yellow),),
                       ),
                       ),
                  

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
