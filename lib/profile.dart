import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
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
          child: Container(
            padding: EdgeInsets.all(16),
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage('assets/profile.jpg'),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(0xff296e48).withOpacity(.4), width: 5)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .3,
                  child: Row(
                    children: [
                      Text(
                        'John Deo',
                        style: TextStyle(color: Colors.black54, fontSize: 20),
                      ),
                      SizedBox(
                        height: 25,
                        child: Image.asset('assets/verfied.png'),
                      )
                    ],
                  ),
                ),
                Text(
                  'johndeo@gmail.com',
                  style: TextStyle(color: Colors.black54.withOpacity(.3)),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: size.height * .7,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.black54.withOpacity(.5),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'My Profile',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.5),size: 16,),
                          ],
                        ),
                      margin: EdgeInsets.only(top: 30)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.black54.withOpacity(.5),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.5),size: 16,),

                          ],
                        ),
                        margin: EdgeInsets.only(top: 30),),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.black54.withOpacity(.5),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Notifications',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.5),size: 16,),

                          ],
                        ),
                        margin: EdgeInsets.only(top: 30),),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  color: Colors.black54.withOpacity(.5),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'FAQs',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.5),size: 16,),

                          ],
                        ),
                        margin: EdgeInsets.only(top: 30),),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.black54.withOpacity(.5),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.5),size: 16,),

                          ],
                        ),
                        margin: EdgeInsets.only(top: 30),),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.black54.withOpacity(.5),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.black54.withOpacity(.5),size: 16,),

                          ],
                        ),
                      margin: EdgeInsets.only(top: 30),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
