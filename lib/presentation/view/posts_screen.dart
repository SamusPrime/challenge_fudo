import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/util/constants.dart';
import '../../data/model/post_impl.dart';
import '../bloc/interfaces/i_posts_bloc.dart';
import '../widget/list_view_container.dart';
import '../widget/widgets.dart';
import 'post_creation_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            screenSize.width,
            Dimensions.customAppBarBarSizeHeight,
          ),
          child: CustomAppBar(
            titleText: Strings.customAppBarPostsTitleText,
          ),
        ),
        backgroundColor: Palette.loginScreenBackground,
        body: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: Dimensions.sliverListContainerBoxConstraintsMinHeight,
            ),
            child: FutureBuilder<List<PostImpl>>(
              future: Provider.of<IPostsBloc>(
                context,
                listen: false,
              ).getPosts(
                Services.postsEndpoint,
              ),
              initialData: const [],
              builder: (
                BuildContext context,
                AsyncSnapshot<List<PostImpl>> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Palette.circularProgressIndicator,
                          ),
                        ),
                      ),
                    );
                  case ConnectionState.active:
                    return const ToastBar(
                      detailMessage: Strings.waitingForData,
                    );
                  case ConnectionState.none:
                    return const ToastBar(
                      detailMessage: Strings.futureBuilderToastError,
                    );
                  case ConnectionState.done:
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return ListViewContainer(
                          snapshot: snapshot,
                          index: index,
                        );
                      },
                    );
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Palette.postsScreenFloatingActionButtonBackground,
          label: Text(
            Strings.postScreenNewPostText,
          ),
          icon: const Icon(
            Icons.post_add_outlined,
            size: Dimensions.loginScreenFloatingActionButtonIconSize,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostCreationScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
