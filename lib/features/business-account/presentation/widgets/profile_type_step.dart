import 'package:easy_localization/easy_localization.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectProfileTypeScreen extends StatelessWidget {
  const SelectProfileTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: 101,
              height: 101,
              child: SvgPicture.asset(
                'assets/images/type-image.svg',
                fit: BoxFit.none,
                width: 80,
                height: 80,
                alignment: AlignmentGeometry.topCenter,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'business_title1'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.grey700,
              ),
            ),
        
            SizedBox(height: 24),
        
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              height: MediaQuery.of(context).size.height * 0.54,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
               physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Handle category tap
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.all(10),
                      margin: EdgeInsetsDirectional.all(7),
                      width:MediaQuery.of(context).size.width*0.42,
                      height: MediaQuery.of(context).size.height*0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.yellow,
                      ),
                      child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset('assets/icons/plumbing.svg', width:49.4, height:50.1, fit: BoxFit.none),
                                  Text(
                                   'Engineering ',
                                    style: GoogleFonts.roboto(
                                     textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey600,
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
