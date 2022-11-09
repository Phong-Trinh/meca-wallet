import 'package:flutter/material.dart';

class DetailBranchAppbar extends StatelessWidget {
  final String title;
  final bool isTitleExpanded;
  final bool isSliverAppBarExpanded;

  const DetailBranchAppbar(
      {super.key,
      required this.title,
      required this.isTitleExpanded,
      required this.isSliverAppBarExpanded});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: isSliverAppBarExpanded ? Colors.black : Colors.white,
          size: 26.2),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.42,
          wordSpacing: 1.48),
      // show and hide SliverAppBar Title
      title: isTitleExpanded ? Text(title) : null,
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 280,
      // show and hide FlexibleSpaceBar title
      flexibleSpace: isSliverAppBarExpanded
          ? null
          : FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/coffee-shop-cover.png',
                fit: BoxFit.fill,
              ),
            ),
    );
  }
}
