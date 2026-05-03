import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.location, required this.name ,this.image});
  final String name;
  final String location;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
         CircleAvatar(backgroundColor: AppColors.white,radius:30,),
          Expanded(
            child:ListTile(
              title:Text(name,style: TextStyle(fontSize:16,fontWeight:FontWeight.w500,color:AppColors.grey700)),
              subtitle: Row(children: [
                SvgPicture.asset('assets/icons/location_icon.svg',width:16,height:16,fit: BoxFit.none,),
                Text(location,style: TextStyle(fontSize:12,fontWeight:FontWeight.w400,color: AppColors.grey600)),
              ]),
              trailing: SvgPicture.asset('assets/icons/location.svg',width:34,height:34,fit:BoxFit.none),
            ),
            ),
        ],
      
    );
  }
}
