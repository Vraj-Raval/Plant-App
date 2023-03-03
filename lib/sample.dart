import 'dart:convert';

import 'package:app_ui/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepPurple,
          color: Colors.deepPurple.shade100,

          items: [
            InkWell
              (onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return Profile();
              })));
            },
                child: const Icon(Icons.home_filled)),

            const Icon(CupertinoIcons.search),
            const Icon(CupertinoIcons.list_bullet),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Profile();
                      },));
                },
                child: const Icon(CupertinoIcons.cart_fill)),
          ]
      ),

      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [

                const Icon(Icons.location_on_outlined),

                Container(
                  child: const Text('Sylhet,Bangladesh',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),


                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('images/person.png'),
                  backgroundColor: Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 23,),

            //////////Good Morningg///////////

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning, Male,",
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 4,),
            //Lets Order Fresh items For You

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Lets order fresh items For you",

              ),
            ),
            const SizedBox(height: 24,),
            //Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(height: 0.2),
            ),

            const SizedBox(height: 0.001,),

            /// Categories

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Categories",

              ),
            ),
            const SizedBox(height: 10,),

            ////////////////Api data Display Here////////////////


            FutureBuilder<http.Response>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = jsonDecode(snapshot.data!.body.toString());
                  return Container(
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 190.0,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(data[index]["Image"].toString()),
                                ListTile(
                                  tileColor: Colors.purple.shade100,
                                  title: Text(data[index]['Name'].toString()),

                                  trailing: InkWell(
                                    onTap: () {
                                      // return deleteitem(id);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                else {
                  return Center(child: CircularProgressIndicator(),);
                }
              },
              future: getData(),
            ),


            const SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("My Orders",


              ),
            ),

            const SizedBox(height: 40,),

            //////////Vegetables///////

            Container(
              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor: Colors.orange[100],
                  maxRadius: null,
                  radius: 31,
                  backgroundImage: const AssetImage('images/Carrott.png'),
                ),
                title: const Text("Vegetables",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),


                subtitle: const Text("20 , jun 2022",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("\$60.55",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        )),
                    Text("6 items"),
                  ],
                ),
              ),
            ),

            ///////////////Fruits//////////
            Container(
              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor: Colors.orange[100],
                  maxRadius: null,
                  radius: 31,
                  backgroundImage: const AssetImage('images/avocado2.png'),
                ),
                title: const Text("Fruits",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),


                subtitle: const Text("20 , jun 2022",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,

                    )),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("\$56.32",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("4 items"),
                  ],
                ),
              ),
            ),

            ///////////Meat//////////

            Container(
              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor: Colors.orange[100],
                  maxRadius: null,
                  radius: 31,
                  backgroundImage: AssetImage('images/meat.png'),
                ),
                title: const Text("Meat",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),

                subtitle: const Text("20 , jun 2022",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("\$32.42",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("1 items"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response> getData() async {
    var response = await http.get(
        Uri.parse("https://63f2faa7de3a0b242b382724.mockapi.io/Vegetables"));
    print(response.body.toString());
    return response;
  }

  Future<void> deleteitem(id) async {
    http.Response res = await http.delete(
        Uri.parse('https://63f2faa7de3a0b242b382724.mockapi.io/Vegetables$id'));
  }
}