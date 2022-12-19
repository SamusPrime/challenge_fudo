import 'package:flutter/material.dart';

import '../../../core/util/constants.dart';

import '../widget/create_post_button.dart';

import '../widget/widgets.dart';

class PostCreationScreen extends StatefulWidget {
  const PostCreationScreen({Key? key}) : super(key: key);

  @override
  State<PostCreationScreen> createState() => _PostCreationScreenState();
}

class _PostCreationScreenState extends State<PostCreationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            screenSize.width,
            Dimensions.customAppBarBarSizeHeight,
          ),
          child: const CustomAppBar(
            titleText: Strings.customAppBarPostsCreationTitleText,
          ),
        ),
        backgroundColor: Palette.loginScreenBackground,
        body: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: Dimensions.sliverListContainerBoxConstraintsMinHeight,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(
                  Dimensions.postCreationScreenBodyPadding,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      textController: titleController,
                      hintText: Strings.postCreationScreenTextFieldTitle,
                      obscureText: false,
                      boxHeight: Dimensions.loginScreenTextFieldHeight,
                      boxWidth: Dimensions.loginScreenTextFieldWidth,
                    ),
                    CustomTextField(
                      textController: bodyController,
                      hintText: Strings.postCreationScreenTextFieldBody,
                      obscureText: false,
                      boxHeight:
                          Dimensions.postCreationScreenTextFieldBodyHeight,
                      boxWidth: Dimensions.postCreationScreenTextFieldBodyWidth,
                      maxLines:
                          Dimensions.postCreationScreenTextFieldBodyMaxLines,
                    ),
                    GestureDetector(
                      child: CreatePostButton(
                        titleInputController: titleController,
                        bodyInputController: bodyController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
