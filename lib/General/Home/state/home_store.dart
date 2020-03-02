import 'package:challenge/General/Home/repositories/home_repository.dart';
import 'package:challenge/User/model/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeStore {
  final HomeRepository _homeRepository;
  List<UserModel> _competitors;

  HomeStore(this._homeRepository);
  List<UserModel> get competitors => _competitors;

  void fetchCompetitors({int activity = 0}) async {
    final result = await _homeRepository.fetchCompetitors(activity: activity);
    result.fold(
      (competitorsList) => _competitors = competitorsList,
      (error) => throw error,
    );
  }
}
