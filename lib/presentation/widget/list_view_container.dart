import 'package:flutter/material.dart';
import 'visibility_text.dart';
import '../../core/util/constants.dart';

class ListViewContainer extends StatefulWidget {
  const ListViewContainer({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  final int index;

  @override
  State<ListViewContainer> createState() => _ListViewContainerState();
}

class _ListViewContainerState extends State<ListViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Palette.sliverListViewContainer,
        border: Border(
          bottom: BorderSide(
            width: Dimensions.listViewBorderWidth,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.postsScreenListViewPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VisibilityText(
              objectAttribute:
                  '${Strings.postScreenUserId} ${widget.snapshot.data![widget.index].userId}',
              isVisible: true,
            ),
            VisibilityText(
              objectAttribute:
                  '${Strings.postScreenTitle} ${widget.snapshot.data![widget.index].title}',
              isVisible: true,
            ),
            VisibilityText(
              objectAttribute:
                  '${Strings.postScreenBody} ${widget.snapshot.data![widget.index].body}',
              isVisible: widget.snapshot.data![widget.index].body != null,
            ),
          ],
        ),
      ),
    );
  }
}
