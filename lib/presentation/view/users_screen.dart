import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/util/constants.dart';
import '../../data/model/user_impl.dart';
import '../bloc/interfaces/i_users_bloc.dart';
import '../widget/grid_view_container.dart';
import '../widget/widgets.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
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
            titleText: Strings.customAppBarUsersTitleText,
          ),
        ),
        backgroundColor: Palette.loginScreenBackground,
        body: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: Dimensions.sliverListContainerBoxConstraintsMinHeight,
            ),
            child: FutureBuilder<List<UserImpl>>(
              future: Provider.of<IUsersBloc>(
                context,
                listen: false,
              ).getUsers(
                Services.usersEndpoint,
              ),
              initialData: const [],
              builder: (
                BuildContext context,
                AsyncSnapshot<List<UserImpl>> snapshot,
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
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Dimensions.usersScreenCrossAxisCount,
                        childAspectRatio: Dimensions.usersScreenGridAspectRatio,
                        mainAxisSpacing:
                            Dimensions.usersScreenGridMainAxisSpacing,
                        crossAxisSpacing:
                            Dimensions.usersScreenGridCrossAxisSpacing,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return GridViewContainer(
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
      ),
    );
  }
}
