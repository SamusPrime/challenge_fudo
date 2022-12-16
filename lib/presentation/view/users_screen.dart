import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/util/constants.dart';
import '../../data/model/user_model.dart';
import '../bloc/interfaces/i_users_bloc.dart';
import '../widget/visibility/visibility_text.dart';
import '../widget/widgets.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late ScrollController _scrollController;

  double _scrollOffset =
      ConstantsDimension.userScreenScrollOffsetScreenStartValue;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              _scrollOffset = _scrollController.offset;
            },
          );
        },
      );

    Provider.of<IUsersBloc>(
      context,
      listen: false,
    ).getUsers(
      ConstantsService.usersEndpoint,
    );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
            ConstantsDimension.userScreenAppBarSizeHeight,
          ),
          child: UsersAppBar(
            scrollOfSet: _scrollOffset,
          ),
        ),
        backgroundColor: ConstantsPalette.loginScreenBackground,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: ConstantsDimension
                          .usersScreenSliverListContainerBoxConstraintsMinHeight,
                    ),
                    child: FutureBuilder<List<UserModel>>(
                      future: Provider.of<IUsersBloc>(
                        context,
                        listen: false,
                      ).getUsers(
                        ConstantsService.usersEndpoint,
                      ),
                      initialData: const [],
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<List<UserModel>> snapshot,
                      ) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const SizedBox(
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    ConstantsPalette
                                        .usersScreenCircularProgressIndicator,
                                  ),
                                ),
                              ),
                            );
                          case ConnectionState.active:
                            return const ToastBar(
                              detailMessage:
                                  ConstantsString.userScreenWaitingForData,
                            );
                          case ConnectionState.none:
                            return const ToastBar(
                              detailMessage: ConstantsString
                                  .userScreenFutureBuilderToastError,
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
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: ConstantsPalette
                                        .usersScreenSliverListViewContainer,
                                    border: Border(
                                      bottom: BorderSide(
                                        width: ConstantsDimension
                                            .usersListViewBorderWidth,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: ConstantsDimension
                                          .usersListViewPadding,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        VisibilityText(
                                          userAttribute:
                                              '${ConstantsString.userScreenName} ${snapshot.data![index].name}',
                                          isVisible: true,
                                        ),
                                        VisibilityText(
                                          userAttribute:
                                              '${ConstantsString.userScreenUserName} ${snapshot.data![index].username}',
                                          isVisible: true,
                                        ),
                                        VisibilityText(
                                          userAttribute:
                                              '${ConstantsString.userScreenWebsite} ${snapshot.data![index].website}',
                                          isVisible:
                                              snapshot.data![index].website !=
                                                  null,
                                        ),
                                        VisibilityText(
                                          userAttribute:
                                              '${ConstantsString.userScreenCompanyName} ${snapshot.data![index].company?.name}',
                                          isVisible:
                                              snapshot.data![index].company !=
                                                  null,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
