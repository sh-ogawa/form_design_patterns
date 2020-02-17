import 'package:flutter/material.dart';
import 'package:form_design_patterns/helper/form_widget.dart';
import 'package:form_design_patterns/main.dart';
import 'package:form_design_patterns/utils/log/logger.dart';

import 'bloc.dart';

class RegistrationMainPage extends StatelessWidget {
  final bloc = Bloc();

  // ユーザーIDの登録セクション
  Widget _buildFirstNameSection() {
    return Semantics(
      label: 'input first name',
      child: createTextField(
        label: '姓',
        stream: bloc.firstName,
        changed: bloc.firstNameChanged,
      ),
    );
  }

  // ユーザーIDの登録セクション
  Widget _buildLastNameSection() {
    return Semantics(
      label: 'input last name',
      child: createTextField(
        label: '名',
        stream: bloc.lastName,
        changed: bloc.lastNameChanged,
      ),
    );
  }

  // ユーザーIDの登録セクション
  Widget _buildMailAddressSection() {
    return Semantics(
      label: 'input mail address',
      child: createTextField(
        label: 'メールアドレス',
        keyboardType: TextInputType.emailAddress,
        stream: bloc.mailAddress,
        changed: bloc.mailAddressChanged,
      ),
    );
  }

  // ユーザーIDの登録セクション
  Widget _buildPasswordSection() {
    return Semantics(
      label: 'input password',
      child: createTextField(
        label: 'パスワード',
        stream: bloc.password,
        changed: bloc.passwordChanged,
        obscureText: true,
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
            var firstName = await bloc.firstName.first;
            var lastName = await bloc.lastName.first;
            var mailAddress = await bloc.mailAddress.first;
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
                        Text('姓： $firstName'),
                        Text('名： $lastName'),
                        Text('メールアドレス： $mailAddress'),
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
          child: Text('登録'),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    locator<Logger>().log('I0300001');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('登録フォーム'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.60,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildFirstNameSection(),
                _buildLastNameSection(),
                _buildMailAddressSection(),
                _buildPasswordSection(),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
