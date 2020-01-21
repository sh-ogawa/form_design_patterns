import 'dart:async';

mixin Validators {
  var userIdValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (input, sink) async {
        sink.add(input);
      });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (input, sink) async {
        sink.add(input);
      });
}
