import 'dart:async';
import 'dart:convert';
import 'package:cse_bpm_project/home_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class XinGiayNghiaVuScreen extends StatefulWidget {
  @override
  _XinGiayNghiaVuScreenState createState() => _XinGiayNghiaVuScreenState();
}

class _XinGiayNghiaVuScreenState extends State<XinGiayNghiaVuScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _idController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xin Giấy NVQS'),
        backgroundColor: Color(0xff3277D8),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                child: Text(
                  'Sinh viên vui lòng điền đầy đủ các thông tin sau:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff606470),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: StreamBuilder(
                  // stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Họ và tên',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                // stream: authBloc.phoneStream,
                builder: (context, snapshot) => TextField(
                  controller: _idController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    errorText: snapshot.hasError ? snapshot.error : null,
                    labelText: 'Mssv',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder(
                  // stream: authBloc.emailStream,
                  builder: (context, snapshot) => TextField(
                    controller: _emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                // stream: authBloc.passStream,
                builder: (context, snapshot) => TextField(
                  controller: _phoneController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    errorText: snapshot.hasError ? snapshot.error : null,
                    labelText: 'Số điện thoại',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder(
                  // stream: authBloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _contentController,
                    maxLines: 3,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: 'Nội dung',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onSubmitRequest,
                    child: Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSubmitRequest() async {
    String content = _contentController.text;

    final http.Response response = await http.post(
      'http://nkkha.somee.com/odata/tbRequestNVQS',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Content": "$content",
        "UserID": "2",
        "Status": "TK",
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      throw Exception('Failed to create request.');
    }
  }
}
