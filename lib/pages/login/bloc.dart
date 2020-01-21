import 'package:rxdart/rxdart.dart';
import 'validator.dart';

class Bloc extends Object with Validators implements BaseBloc {

  // ユーザーIDの入力
  final _userIdController = BehaviorSubject<String>();
  Function(String) get userIdChanged =>
      _userIdController.sink.add;
  Stream<String> get userId =>
      _userIdController.stream.transform(userIdValidator);

  // パスワードの入力
  final _passwordController = BehaviorSubject<String>();
  Function(String) get passwordChanged =>
      _passwordController.sink.add;
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  /// サブミット可能かのチェック
  Stream<bool> get submitCheck =>
      Observable.combineLatest2(userId, password, (String t, String p) => true);

  @override
  void dispose() {
    _userIdController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
