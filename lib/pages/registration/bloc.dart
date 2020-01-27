import 'package:rxdart/rxdart.dart';
import 'validator.dart';

class Bloc extends Object with Validators implements BaseBloc {

  // 姓の入力
  final _firstNameController = BehaviorSubject<String>();
  Function(String) get firstNameChanged =>
      _firstNameController.sink.add;
  Stream<String> get firstName =>
      _firstNameController.stream.transform(firstNameValidator);

  // 名の入力
  final _lastNameController = BehaviorSubject<String>();
  Function(String) get lastNameChanged =>
      _lastNameController.sink.add;
  Stream<String> get lastName =>
      _lastNameController.stream.transform(lastNameValidator);

  // メールアドレスの入力
  final _mailAddressController = BehaviorSubject<String>();
  Function(String) get mailAddressChanged =>
      _mailAddressController.sink.add;
  Stream<String> get mailAddress =>
      _mailAddressController.stream.transform(mailAddressValidator);

  // パスワードの入力
  final _passwordController = BehaviorSubject<String>();
  Function(String) get passwordChanged =>
      _passwordController.sink.add;
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  /// サブミット可能かのチェック
  Stream<bool> get submitCheck =>
      Observable.combineLatest4(firstName, lastName, mailAddress, password, (String f, String l, String m, String p) => true);

  @override
  void dispose() {
    _firstNameController?.close();
    _lastNameController?.close();
    _mailAddressController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
