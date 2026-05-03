import 'package:final_servixa/features/home/presentation/widgets/item_card_large.dart';
import 'package:flutter/material.dart';



class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
  });

  final String image;
  final String title;
  final String location;
  final num price;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ItemCard(
          image: image,
          location: location,
          price: price,
          title: title,
        );
      },
       childCount: 4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
       // crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio:3.5,
      ),
    );
  }
}
