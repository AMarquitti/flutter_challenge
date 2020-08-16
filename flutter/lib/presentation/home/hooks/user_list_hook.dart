import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../application/home/home_state.dart';

List<UserModel> useInitializeUserList() => use(const _InitializeUserList());

class _InitializeUserList extends Hook<List<UserModel>> {
  const _InitializeUserList();

  @override
  _InitializeUserListState createState() => _InitializeUserListState();
}

class _InitializeUserListState
    extends HookState<List<UserModel>, _InitializeUserList> {
  @override
  Future<void> initHook() async {
    super.initHook();
    final ReactiveModel<HomeState> homeModel = RM.get<HomeState>();
    homeModel.setState((HomeState state) => state.fetchActiveUsers());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  List<UserModel> build(BuildContext context) {
    return null;
  }
}
