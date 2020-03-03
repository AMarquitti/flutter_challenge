import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../User/model/user_model.dart';
import '../state/home_store.dart';

List<UserModel> useInitializeUserList() =>
    Hook.use(const _InitializeUserList());

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
    final ReactiveModel<HomeStore> homeModel = Injector.getAsReactive<HomeStore>();
    homeModel.setState((store) => store.fetchActiveUsers());
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
