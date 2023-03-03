import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserDetails {
  final dynamic plantimg;
  final dynamic plantname;
  final dynamic plantprice;

  UserDetails(
      {required this.plantimg,
        required this.plantname,
        required this.plantprice});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
        plantimg: json['plantimg'],
        plantname: json['plantname'],

        plantprice: json['plantprice']);
  }
  Map<String,dynamic> toJson() =>{
    'plantimg':plantimg,
    'plantname': plantname,
    'plantprice':plantprice,

  };
}
class Update extends StatefulWidget {
  final UserDetails userDetails;
  Update({required this.userDetails});


  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final _formkey=GlobalKey<FormState>();

  final _imagecontroller = TextEditingController();
  final _plantname = TextEditingController();
  final _plantprice = TextEditingController();


  @override
  void initState() {
    super.initState();
    _imagecontroller.text = widget.userDetails.plantimg;
    _plantname.text = widget.userDetails.plantname;

    _plantprice.text = widget.userDetails.plantprice;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _imagecontroller,
            decoration: InputDecoration(labelText: 'plantimg'),
          ),
          TextFormField(
            controller: _plantname,
            decoration: InputDecoration(labelText: 'name'),
          ),
          TextFormField(
            controller: _plantprice,
            decoration: InputDecoration(labelText: 'plantprice'),
          ),
          ElevatedButton(
            onPressed: () async {
              final userDetails = UserDetails(
                plantimg: _imagecontroller.text,
                plantname: _plantname.text,
                plantprice: _plantprice.text,
              );
              final response = await http.put(
                Uri.parse('https://63fb211e2027a45d8d608527.mockapi.io/plant'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(userDetails),
              );
              if (response.statusCode == 200) {
                print('Enter record successfully');
              } else {
                print('Handle error response');
              }
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
