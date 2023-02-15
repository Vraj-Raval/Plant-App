import 'package:app_ui/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    //List<Plant> _plantList = Plant.plantList;

    List<String> _plantTypes = [
      'Recomended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.notifications,
              color: Colors.black54,
              size: 30,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: size.width * 0.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search,
                            color: Colors.black54.withOpacity(.6)),
                        Expanded(
                            child: TextFormField(
                          showCursor: false,
                          decoration: InputDecoration(
                              hintText: 'Search Plant',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        )),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.5),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff296e48).withOpacity(.1),
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 50,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _plantTypes[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: selectedIndex == index
                                  ? Color(0xff296e48)
                                  : Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 350,
                      width: 270,
                      decoration: BoxDecoration(
                          color: Color(0xff296e48),
                          borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Container(
                                margin: EdgeInsets.only(top: 10, right: 10),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Color(0xff296e48),
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            child: Image.asset(width: 140, 'assets/plant1.png'),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            'Outdoor',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          margin: EdgeInsets.only(right: 70),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Text(
                                            'Sanseviera',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 70,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      ' \$32',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 30),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 350,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Color(0xff296e48),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Color(0xff296e48),
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                  height: 210, width: 240, 'assets/plant2.png'),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              'Inddor',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            margin: EdgeInsets.only(right: 80),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 80),
                                            child: Text(
                                              'Tulsi',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        ' \$15',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 30),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 350,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Color(0xff296e48),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Color(0xff296e48),
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                  height: 210, width: 240, 'assets/plant3.png'),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              'Inddor',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            margin: EdgeInsets.only(
                                                left: 10, right: 80),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 30),
                                            child: Text(
                                              'Aloevera',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        ' \$25',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 30),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 350,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Color(0xff296e48),
                            borderRadius: BorderRadius.circular(35)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Color(0xff296e48),
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                  height: 210, width: 240, 'assets/plant4.png'),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              'Inddor',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            margin: EdgeInsets.only(
                                                left: 10, right: 80),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 30),
                                            child: Text(
                                              'Aloevera',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Text(
                                        ' \$20',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 30),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15),
              child: Container(
                child: Text(
                  'New Plants',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff296e48).withOpacity(.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 100),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                              Positioned(
                                  bottom: 10,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80,
                                    child: Image.asset(
                                      'assets/newplant1.png',
                                    ),
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 85,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Indoor',style: TextStyle(fontSize: 15),),
                                      Text(
                                        ('Caladium'),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 300,
                                  child: Text('\$7',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.black54
                                  ),))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff296e48).withOpacity(.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 100),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                              Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80,
                                    child: Image.asset(
                                      'assets/newplant2.png',
                                    ),
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 85,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Outdoor',style: TextStyle(fontSize: 15),),
                                      Text(
                                        ('Zebra Plant'),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 300,
                                  child: Text('\$34',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.black54
                                  ),))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff296e48).withOpacity(.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 100),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                              Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80,
                                    child: Image.asset(
                                      'assets/newplant3.png',
                                    ),
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 85,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Garden',style: TextStyle(fontSize: 15),),
                                      Text(
                                        ('Janet Craig'),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 300,
                                  child: Text('\$11',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.black54
                                  ),))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff296e48).withOpacity(.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 100),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                              Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80,
                                    child: Image.asset(
                                      'assets/newplant4.png',
                                    ),
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 85,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Garden',style: TextStyle(fontSize: 15),),
                                      Text(
                                        ('Schefflera '),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                              ),
                              Positioned(
                                bottom: 25,
                                left: 300,
                                  child: Text('\$21',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black54
                              ),))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff296e48).withOpacity(.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 100),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                              Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80,
                                    child: Image.asset(
                                      'assets/newplant5.png',
                                    ),
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 85,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Indoor',style: TextStyle(fontSize: 15),),
                                      Text(
                                        ('Rose'),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                              ),
                              Positioned(
                                  bottom: 25,
                                  left: 300,
                                  child: Text('\$15',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.black54
                                  ),))
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff296e48),
        child: Image.asset('assets/code-scan-two.png',width: 32,),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                      onPressed: (){},
                    child: Icon(Icons.home,color: Color(0xff296e48),),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    height: 0,
                    onPressed: (){},
                    child: Icon(Icons.favorite,color: Colors.grey,),
                  ),

                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 100,
                    onPressed: (){},
                    child: Icon(Icons.shopping_cart,color: Colors.grey,),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    },
                    child: Icon(Icons.person,color: Colors.grey,),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
