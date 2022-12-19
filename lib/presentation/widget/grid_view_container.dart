import 'package:flutter/material.dart';
import 'visibility_text.dart';
import '../../core/util/constants.dart';

class GridViewContainer extends StatefulWidget {
  const GridViewContainer({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);
  final AsyncSnapshot snapshot;
  final int index;

  @override
  State<GridViewContainer> createState() => _GridViewContainerState();
}

class _GridViewContainerState extends State<GridViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: Dimensions.gridViewConstraintsMaxHeight,
        ),
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
            horizontal: Dimensions.usersScreenGridViewPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VisibilityText(
                objectAttribute:
                    '${Strings.userScreenName} ${widget.snapshot.data![widget.index].name}',
                isVisible: true,
              ),
              VisibilityText(
                objectAttribute:
                    '${Strings.userScreenUserName} ${widget.snapshot.data![widget.index].username}',
                isVisible: true,
              ),
              VisibilityText(
                objectAttribute:
                    '${Strings.userScreenWebsite} ${widget.snapshot.data![widget.index].website}',
                isVisible: widget.snapshot.data![widget.index].website != null,
              ),
              VisibilityText(
                objectAttribute:
                    '${Strings.userScreenCompanyName} ${widget.snapshot.data![widget.index].company?.name}',
                isVisible: widget.snapshot.data![widget.index].company != null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
