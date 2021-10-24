import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class HomeHeader extends SliverPersistentHeader {
  HomeHeader() : super(delegate: HeaderDelegate());
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Header();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/launch_image.png',
          ),
        ),
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 150,
            ),
            const GradientText(text: 'quizemaker', fontSize: 35, width: 300),
          ],
        )
      ],
    );
  }
}
