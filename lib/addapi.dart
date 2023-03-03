import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'maifile.dart';


class AddApi extends StatefulWidget {
  const AddApi({Key? key}) : super(key: key);

  @override
  State<AddApi> createState() => _AddApiState();
}

class _AddApiState extends State<AddApi> {
  final _formkey=GlobalKey<FormState>();
  final _imagecontroller=TextEditingController();
  final _name=TextEditingController();
  final _price=TextEditingController();
  bool _isLoading=false;
  Future<void>_addData()async{
    setState(() {
      _isLoading=true;
    });

    final apiUrl='https://63fb211e2027a45d8d608527.mockapi.io/plant';
    final response=await http.post(Uri.parse(apiUrl),body:{
      'plantimg':_imagecontroller.text,
      'plantname':_name.text,
      'plantprice':_price.text,
    });
    if(response.statusCode==201)
    {
      Navigator.pop(context,true);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add data')),);
    }
    setState(() {
      _isLoading=false;
    });
  }
  Future<void> putAccountData() async {
    String url = 'some url';
    final Map payload = {
      "plantname": _name.text,
      "plantprice": _price.text
    };
    try {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(payload));
      print(response.body);
    } catch (er) {}
  }
  @override
  void dispose(){
    _imagecontroller.dispose();
    _name.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                child: TextFormField(
                  controller: _imagecontroller,
                  decoration: InputDecoration(labelText: 'Image url'),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'Image url is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16,),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'NAme is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16,),
              Container(
                margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                child: TextFormField(
                  controller: _price,
                  decoration: InputDecoration(labelText: 'price'),
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'price is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 32,),
              Container(
                margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                child: ElevatedButton(

                    onPressed: _isLoading ? null :(){
                  if(_formkey.currentState!.validate()){
                    _addData();
                  }
                }, child: _isLoading ? CircularProgressIndicator():Text('Add data')),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              //   child: ElevatedButton(
              //
              //       onPressed: () async {
              //         await putAccountData();
              //         print(_name.text);
              //         print(_price.text);
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => MainFile2(id: null,)),
              //         );
              //       }, child: _isLoading ? CircularProgressIndicator():Text('Update data')),
              // ),
            ],
          ),
        ),
      ),),
    );

  }
}
