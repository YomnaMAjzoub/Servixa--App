import 'package:final_servixa/common/widgets/gradient.dart';
import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/core/routing/app_router.dart';
import 'package:final_servixa/features/profile/data/models/profile_menu_model.dart';
import 'package:final_servixa/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:final_servixa/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:final_servixa/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutItems = [
      ProfileMenuItem(
        title: "My Ads",
        icon: "assets/icons/my-ads.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "My Reviews",
        icon: "assets/icons/reviews.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Notifications",
        icon: "assets/icons/notifications.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Favorite",
        icon: "assets/icons/favorites.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Popular Question",
        icon: "assets/icons/question.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Rating",
        icon: "assets/icons/rating.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Share This App",
        icon: "assets/icons/shares.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Profile Detail",
        icon: "assets/icons/profile.svg",
        onTap: () {},
      ),
    ];

    final settingsItems = [
      ProfileMenuItem(
        title: "Change Password",
        icon: "assets/icons/change.svg",
        onTap: () {},
      ),

      ProfileMenuItem(
        title: "Change Language",
        icon: "assets/icons/language.svg",
        onTap: () {},
      ),
    ];

    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.offNamed(AppRouter.home);
                  },
                  icon: const Icon(Icons.arrow_back, color: AppColors.grey700),
                ),

                const SizedBox(height: 20),

                const ProfileHeaderCard(),

                const SizedBox(height:20),

        
                const ProfileSectionTitle(title: "About The App"),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
          
                  ),
                  child: Column(
                    children: aboutItems
                        .map(
                          (item) => ProfileMenuTile(
                            title: item.title,
                            icon: item.icon,
                            onTap: item.onTap,
                          ),
                        )
                        .toList(),
                  ),
                ),

                const SizedBox(height: 20),

                const ProfileSectionTitle(title: "Settings"),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      ...settingsItems.map(
                        (item) => ProfileMenuTile(
                          title: item.title,
                          icon: item.icon,
                          onTap: item.onTap,
                        ),
                      ),

                      ProfileMenuTile(
                        title: "Logout",
                        icon: "assets/icons/logout.svg",
                        textColor:AppColors.red,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
