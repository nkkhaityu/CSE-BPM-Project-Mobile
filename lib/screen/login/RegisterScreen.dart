import 'dart:async';
import 'dart:convert';
import 'package:cse_bpm_project/model/User.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:cse_bpm_project/source/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  FocusNode _myFocusNode1 = new FocusNode();
  FocusNode _myFocusNode2 = new FocusNode();
  FocusNode _myFocusNode3 = new FocusNode();
  FocusNode _myFocusNode4 = new FocusNode();
  FocusNode _myFocusNode5 = new FocusNode();

  bool _isClicked = false;

  @override
  void dispose() {
    super.dispose();
    _myFocusNode1.dispose();
    _myFocusNode2.dispose();
    _myFocusNode3.dispose();
    _myFocusNode4.dispose();
    _myFocusNode5.dispose();
  }

  @override
  void initState() {
    super.initState();
    _myFocusNode1 = new FocusNode();
    _myFocusNode2 = new FocusNode();
    _myFocusNode3 = new FocusNode();
    _myFocusNode4 = new FocusNode();
    _myFocusNode5 = new FocusNode();
    _myFocusNode1.addListener(_onOnFocusNodeEvent);
    _myFocusNode2.addListener(_onOnFocusNodeEvent);
    _myFocusNode3.addListener(_onOnFocusNodeEvent);
    _myFocusNode4.addListener(_onOnFocusNodeEvent);
    _myFocusNode5.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.lightBrand),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: Text(
                  'Welcome Aboard!',
                  style: TextStyle(fontSize: 22, color: MyColors.black),
                ),
              ),
              Text(
                'Signup with BPM in single steps',
                style: TextStyle(fontSize: 16, color: MyColors.mediumGray),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: StreamBuilder(
                  // stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    focusNode: _myFocusNode5,
                    controller: _usernameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: _myFocusNode5.hasFocus
                              ? MyColors.lightBrand
                              : MyColors.mediumGray),
                      prefixIcon: Container(
                        width: 50,
                        child: Icon(Icons.account_circle_outlined, color: Colors.grey[400]),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.lightGray, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.lightBrand, width: 2.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: StreamBuilder(
                  // stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    focusNode: _myFocusNode1,
                    controller: _nameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                          color: _myFocusNode1.hasFocus
                              ? MyColors.lightBrand
                              : MyColors.mediumGray),
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset('images/ic_user.png'),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: MyColors.lightGray, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: MyColors.lightBrand, width: 2.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                // stream: authBloc.phoneStream,
                builder: (context, snapshot) => TextField(
                  focusNode: _myFocusNode2,
                  controller: _phoneController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    errorText: snapshot.hasError ? snapshot.error : null,
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        color: _myFocusNode2.hasFocus
                            ? MyColors.lightBrand
                            : MyColors.mediumGray),
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('images/ic_phone.png'),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.lightGray, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.lightBrand, width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                  // stream: authBloc.emailStream,
                  builder: (context, snapshot) => TextField(
                    focusNode: _myFocusNode3,
                    controller: _emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: _myFocusNode3.hasFocus
                              ? MyColors.lightBrand
                              : MyColors.mediumGray),
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset('images/ic_mail.png'),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.lightGray, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.lightBrand, width: 2.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                // stream: authBloc.passStream,
                builder: (context, snapshot) => TextField(
                  focusNode: _myFocusNode4,
                  obscureText: true,
                  controller: _passController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    errorText: snapshot.hasError ? snapshot.error : null,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: _myFocusNode4.hasFocus
                            ? MyColors.lightBrand
                            : MyColors.mediumGray),
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('images/ic_lock.png'),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.lightGray, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.lightBrand, width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onSignUpClicked,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: MyColors.lightBrand,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Already a User? ',
                  style: TextStyle(fontSize: 16, color: MyColors.black),
                  children: [
                    TextSpan(
                      text: 'Login Now',
                      style: TextStyle(
                        color: MyColors.lightBrand,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUpClicked() async {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    pr.update(message: "Đăng ký...");
    await pr.show();

    _isClicked = true;
    String userName = _usernameController.text;
    String pass = _passController.text;
    String fullName = _nameController.text;
    String phone = _phoneController.text;
    String email = _emailController.text;

    final http.Response response = await http.post(
      'http://nkkha.somee.com/odata/tbUser',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserName": userName,
        "Mail": email,
        "Phone": phone,
        "Password": pass,
        "FullName": fullName
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      User user = User.fromJson(data);

      final http.Response response2 = await http.post(
        'http://nkkha.somee.com/odata/tbUserRole',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "UserId": "${user.id}",
          "RoleId": "1",
        }),
      );

      if (response2.statusCode == 200) {
        await pr.hide();
        Flushbar(
          icon:
          Image.asset('images/ic-check-circle.png', width: 24, height: 24),
          message: 'Đăng ký thành công!',
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context);
      } else {
        await pr.hide();
        Flushbar(
          icon:
          Image.asset('images/icons8-exclamation-mark-48.png', width: 24, height: 24),
          message: 'Đăng ký thất bại!',
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context);
      }
    } else {
      await pr.hide();
      Flushbar(
        icon:
        Image.asset('images/icons8-exclamation-mark-48.png', width: 24, height: 24),
        message: 'Đăng ký thất bại!',
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
      )..show(context);
    }
  }
}
