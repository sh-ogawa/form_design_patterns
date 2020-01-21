import 'package:flutter/material.dart';
import 'package:form_design_patterns/main.dart';
import 'package:form_design_patterns/utils/log/logger.dart';

import 'bloc.dart';

class LoginMainPage extends StatelessWidget {
  final bloc = Bloc();

  // ユーザーIDの登録セクション
  Widget _buildUserIdSection() {
    return Semantics(
      label: 'input user id',
      child: Column(
        children: <Widget>[
          Text('ユーザーIDまたはメールアドレス'),
          StreamBuilder(
            stream: bloc.userId,
            builder: (context, snapshot) {
              locator<Logger>().debug(snapshot.data);
              return TextField(
                enabled: true,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                maxLength: 20,
                onChanged: bloc.userIdChanged,
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }

  // ユーザーIDの登録セクション
  Widget _buildPasswordSection() {
    return Semantics(
      label: 'input password',
      child: Column(
        children: <Widget>[
          Text('パスワード'),
          StreamBuilder(
            stream: bloc.password,
            builder: (context, snapshot) {
              locator<Logger>().debug(snapshot.data);
              return TextField(
                enabled: true,
                maxLines: 1,
                maxLength: 20,
                obscureText: true,
                onChanged: bloc.passwordChanged,
                textAlign: TextAlign.center,
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
          func = () async {
            var userId = await bloc.userId.first;
            var password = await bloc.password.first;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.80,
                    heightFactor: 0.50,
                    child: Column(
                      children: <Widget>[
                        Text('ユーザーID： $userId'),
                        Text('パスワード： $password'),
                      ],
                    ),
                  ),
                );
              },
            );
          };
        }
        return RaisedButton(
          onPressed: func,
          child: Text('ログイン'),
        );
      }
    );
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
        child: FractionallySizedBox(
          widthFactor: 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildUserIdSection(),
              _buildPasswordSection(),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
