import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/interfaces/i_posts_bloc.dart';
import '../../core/util/constants.dart';
import 'button_custom_style.dart';

class CreatePostButton extends StatefulWidget {
  final TextEditingController titleInputController;
  final TextEditingController bodyInputController;

  CreatePostButton({
    Key? key,
    required this.titleInputController,
    required this.bodyInputController,
  }) : super(key: key);

  @override
  State<CreatePostButton> createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Dimensions.postCreationScreenButtonPadding,
      ),
      child: GestureDetector(
        onTap: () async {
          await Provider.of<IPostsBloc>(
            context,
            listen: false,
          ).createPosts(
            {
              Strings.createPostButtonJsonTitle:
                  widget.titleInputController.text,
              Strings.createPostButtonJsonBody: widget.bodyInputController.text,
              Strings.createPostButtonJsonUserId: Services.postCreationUserId,
            },
          );

          Navigator.pop(context);
        },
        child: ButtonCustomStyle(
          buttonText: Strings.createPostButtonText,
        ),
      ),
    );
  }
}
