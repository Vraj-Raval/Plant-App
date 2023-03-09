import 'package:app_ui/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'addapi.dart';

class MainFile2 extends StatefulWidget {
  final dynamic id;

  MainFile2({required this.id});

  @override
  _MainFile2State createState() => _MainFile2State();
}

class _MainFile2State extends State<MainFile2> {
  late Future<Map<String, dynamic>> _detailsFuture;

  @override
  void initState() {
    super.initState();
    _detailsFuture = fetchDetailsById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black54, //change your color here
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder<Map<String, dynamic>>(
            future: _detailsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final details = snapshot.data!;
                return Container(
                  color: Color(0xff296e48).withOpacity(.2),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(

                          child: Image.network(
                            '${details['plantimg']}',
                            width: 500,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,left: 15),
                          child: Text(
                            '${details['plantname']}',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                                color: Color(0xff296e48),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15,top: 10),
                          child: Text('Plant Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 15,right: 5),
                          child: Text(
                            '${details['description']}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.6),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 15),
                          child: Container(
                            child: Text(
                              "Price:" +"\$"+ '${details['plantprice']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                            child: Container(
                              width: 320,
                              height: 45,
                              decoration: BoxDecoration(
                                color:Color(0xff296e48),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: 25),)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MainFile4(
                                            userDetails: UserDetails(
                                              id: details['id'].toString(),
                                              image: details['plantimg'],
                                              name: details['plantname'],
                                              price: details['plantprice'].toString(),
                                            ),
                                          );
                                        },
                                      ),
                                    ).then(
                                          (value) {
                                        setState(() {});
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.sync,
                                    size: 40,
                                    color: Color(0xff296e48),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 50),
                                  child: IconButton(
                                      onPressed: () async {
                                        try {
                                          await deleteUser('${snapshot.data!['id']}')
                                              .then((value) => setState(() {}));
                                          Navigator.pop(context);
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                        size: 40,
                                      ))),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> fetchDetailsById(dynamic id) async {
    final response = await http.get(
        Uri.parse('https://63fb211e2027a45d8d608527.mockapi.io/plant/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to fetch details");
    }
  }

  Future<void> deleteUser(dynamic id) async {
    final response = await http.delete(
      Uri.parse('https://63fb211e2027a45d8d608527.mockapi.io/plant/$id'),
      headers: {'Authorization': 'Bearer <your access tokens>'},
    );

    if (response.statusCode == 200) {
      print('record deleted sucessfully');
    } else {
      throw Exception("Failed to delete data");
    }
  }
}
