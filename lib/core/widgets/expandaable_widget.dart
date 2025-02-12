import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ExpandableWidget extends StatefulWidget {
  final String title;
  final String description;
  const ExpandableWidget(
      {super.key, required this.title, required this.description});

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _expansionTileKey = GlobalKey();

  bool _isExpanded = false;

  void _scrollToExpandedTile() {
    Future.delayed(const Duration(milliseconds: 200), () {
      final context = _expansionTileKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorName.colorBackground),
        child: Center(
          child: ExpansionTile(
              key: _expansionTileKey,
              tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.wp),
              leading: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.arrow_right_rounded,
                size: 20.hp,
              ),
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.wp),
              title: BuildText(
                text: widget.title,
                fontSize: 16.hp,
                weight: FontWeight.w600,
                family: FontFamily.barlowSemiBold,
                color: ColorName.colorBlack,
              ),
              showTrailingIcon: false,
              expandedAlignment: Alignment.center,
              onExpansionChanged: (isExpanded) {
                setState(() {
                  _isExpanded = isExpanded;
                });

                if (isExpanded) {
                  _scrollToExpandedTile();
                }
              },
              children: [Html(data: widget.description)]),
        ),
      ),
    );
  }
}
