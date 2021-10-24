import 'package:QuizMaker/src/navigation/routes.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final categoryItemList = [
  [58122, 'dart'],
  [59517, 'flutter'],
  [62269, 'science'],
  [59200, 'history'],
  [57930, 'math'],
  [58701, 'movies'],
  [57544, 'Geography'],
  [58699, 'Mythology'],
  [58286, 'art'],
  [59677, 'animals'],
  [59639, 'general']
];

class FindByCategoryWidget extends SliverPersistentHeader {
  FindByCategoryWidget() : super(delegate: FindByCategoryWidgetDelegate());
}

class FindByCategoryWidgetDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return FindByCategory();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 300;
}

class FindByCategory extends StatelessWidget {
  final _scrollController = FixedExtentScrollController();

  static const double _itemHeight = 60;
  final int _itemCount = categoryItemList.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(65, 2, 10, 10),
      child: ClickableListWheelScrollView(
        scrollController: _scrollController,
        itemHeight: _itemHeight,
        itemCount: _itemCount,
        onItemTapCallback: (index) {
          int onIndex = _scrollController.selectedItem;
          final category = categoryItemList[onIndex];
          final String categoryName = category[1].toString();
          Navigator.pushNamed(
            context,
            Routes.findByCategory,
            arguments: {'categoryName': categoryName},
          );
        },
        child: ListWheelScrollView.useDelegate(
          magnification: 1.1,
          controller: _scrollController,
          itemExtent: _itemHeight,
          physics: FixedExtentScrollPhysics(),
          overAndUnderCenterOpacity: 0.4,
          perspective: 0.002,
          onSelectedItemChanged: (index) {},
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) => _child(index),
            childCount: _itemCount,
          ),
        ),
      ),
    );
  }
}

Widget _child(int index) {
  final data = categoryItemList[index];
  return SizedBox(
    height: 20.0,
    child: ListTile(
      leading: Icon(
        IconData(data[0] as int, fontFamily: 'MaterialIcons'),
        size: 50,
        color: Colors.purple[400],
      ),
      title: Text(
        data[1].toString(),
        style: GoogleFonts.chango(
          fontSize: 19,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
