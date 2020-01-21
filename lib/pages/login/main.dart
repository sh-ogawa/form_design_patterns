import 'package:flutter/material.dart';
import 'package:form_design_patterns/main.dart';
import 'package:form_design_patterns/utils/log/logger.dart';

import 'bloc.dart';

class LoginMainPage extends StatelessWidget {
  final bloc = Bloc();

  // ユーザーIDの登録セクション
  Widget _buildUserIdSection() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('ユーザーIDまたはメールアドレス'),
          StreamBuilder(
            stream: bloc.userId,
            builder: (context, snapshot) {
              locator<Logger>().debug(snapshot.data);
              return TextField(
                enabled: true,
                onChanged: bloc.userIdChanged,
              );
            },
          ),
        ],
      ),
    );
  }

  // ユーザーIDの登録セクション
  Widget _buildPasswordSection() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('パスワード'),
          StreamBuilder(
            stream: bloc.password,
            builder: (context, snapshot) {
              locator<Logger>().debug(snapshot.data);
              return TextField(
                enabled: true,
                onChanged: bloc.passwordChanged,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return StreamBuilder<bool>(
        stream: bloc.submitCheck,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          var func;
          if (snapshot.hasData && snapshot.data) {
            func = () {};
          }

          return RaisedButton(
            onPressed: func,
            child: Text('ログイン'),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    locator<Logger>().log('I0200001');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ログイン'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildUserIdSection(),
            _buildPasswordSection(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

}