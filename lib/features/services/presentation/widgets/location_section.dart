import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_servixa/core/constants/app_colors.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
  
    //   const LatLng position = LatLng(37.7749, -122.4194);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            'Location',
            style: GoogleFonts.roboto(
              fontSize: 22,
              color: AppColors.main,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          
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

          const SizedBox(height: 16),

        
          Card(
            color: AppColors.white,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Expanded(
                    child: ClipRRect(
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(18),topLeft: Radius.circular(18)),
                      child: Image.asset('assets/images/map.png',fit: BoxFit.cover,filterQuality: FilterQuality.high,),
                    ),
                  ),

                 
                 
                    ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: CircleAvatar(
                  radius: 28,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2'),
  ),
             title: Text(
             'Mhamad alhomse',
              style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey700,
    ),
  ),
  subtitle: Padding(
    padding: const EdgeInsets.only(top:4),
    child: Row(
      children: [
        SvgPicture.asset(
          'assets/icons/message.svg',
          width: 14.25,
          height: 14.41,
        ),
        const SizedBox(width:3),
        Flexible(
          child: Text(
            'Mhamad.obadi@gmail.com',
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  ),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(
        'assets/icons/messages.svg',
        width: 24.81,
        height: 24.01,
      ),
      const SizedBox(width: 16),
      SvgPicture.asset(
        'assets/icons/phone.svg',
        width: 23.56,
        height: 22.35,
      ),
    ],
  ),
),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
