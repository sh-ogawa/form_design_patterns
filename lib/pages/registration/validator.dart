import 'dart:async';

mixin Validators {
  var firstNameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (input, sink) async {
        sink.add(input);
      });

  var lastNameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (input, sink) async {
        sink.add(input);
      });

  var mailAddressValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (input, sink) async {
        sink.add(input);
      });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (input, sink) async {
        sink.add(input);
      });
}
