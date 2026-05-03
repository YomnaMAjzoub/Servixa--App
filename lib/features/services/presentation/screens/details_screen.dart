import 'package:final_servixa/core/constants/app_colors.dart';
import 'package:final_servixa/features/map/data/models/location_model.dart';
import 'package:final_servixa/features/services/data/models/rating_model.dart';
import 'package:final_servixa/features/services/data/models/review_model.dart';
import 'package:final_servixa/features/services/presentation/widgets/bottom_bar.dart';
import 'package:final_servixa/features/services/presentation/widgets/contact_section.dart';
import 'package:final_servixa/features/services/presentation/widgets/description_section.dart';
import 'package:final_servixa/features/services/presentation/widgets/features_section.dart';
import 'package:final_servixa/features/services/presentation/widgets/location_section.dart';
import 'package:final_servixa/features/services/presentation/widgets/price_section.dart';
import 'package:final_servixa/features/services/presentation/widgets/reviews_section.dart';
import 'package:final_servixa/features/services/presentation/widgets/top_reviews_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsScreen extends StatefulWidget {
const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final int activeIndex = 0;

  final List<String> images = [
    'assets/images/item.png',
    'https://i.pravatar.cc/400?img=1',
    'https://i.pravatar.cc/400?img=2',
    'https://i.pravatar.cc/400?img=3',
  ];

  final ratingData = RatingSummary(
  average: 4.0,
  totalReviews: 345,
  distribution: {
    5: 0.33,
    4: 0.48,
    3: 0.28,
    2: 0.12,
    1: 0.10,
  },
);

LocationModel locationData = LocationModel(
  lat: 37.7749,
  lng: -122.4194,
  address: "742 Evergreen Terrace, Springfield",
);

List<ReviewModel> reviews = [
  ReviewModel(
    name: "lilia sallem",
    image: "https://i.pravatar.cc/150?img=1",
    date: "6/15/2025",
    rating: 4,
    review:
        "Great product! Works as expected, easy to use, and feels high-quality. Just wish the battery lasted a bit longer.",
  ),
  ReviewModel(
    name: "lilia sallem",
    image: "https://i.pravatar.cc/150?img=2",
    date: "6/15/2025",
    rating: 4,
    review:
        "Great product! Works as expected, easy to use, and feels high-quality. Just wish the battery lasted a bit longer.",
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: AppColors.grey50,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.33,
           floating: true,
          // pinned: true,
            backgroundColor: AppColors.white,
            actions: [
               IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/about.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/share.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                        ),
                      ),
            ],
            flexibleSpace:FlexibleSpaceBar(
           background:  Stack(
             children: [
               Positioned.fill(
                 child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: Offset(1, 1),
                          color: AppColors.shadowb,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/item.png'),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
               ),
                PositionedDirectional(
                  bottom: 16,
                  start: 0,
                  end: 0,
                  child:Center(
                    child: AnimatedSmoothIndicator(
                                  activeIndex: activeIndex,
                                  count: 4,
                                  effect: ColorTransitionEffect(
                                    activeDotColor: AppColors.main500,
                                    dotColor: Colors.white70,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                  ),
                                  ),
                  ),
               ),
             ],
           ),
          ),
          ),
          SliverToBoxAdapter(
         child: PriceSection(),
          ),

          SliverToBoxAdapter(
            child: DescriptionSection(),
          ),
          SliverToBoxAdapter(
            child: FeaturesSection(),
          ),
          SliverToBoxAdapter(
            child: LocationSection(),
          ),
          SliverToBoxAdapter(
            child: ReviewsSection(),
          ),
          SliverToBoxAdapter(child:ContactSection(rating:ratingData),),
          SliverToBoxAdapter(child: TopReviewsSection(reviews: reviews),),
        ],
      ),
    );
  }
}
