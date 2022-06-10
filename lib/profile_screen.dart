import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  TabController ? _controller;
  @override
  void initState() {
    super.initState();
    _controller =  TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: true,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
            child: Stack(
          children:  [
            Container(
              height: MediaQuery.of(context).size.height/2 + 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('') /* add child content here */,
            ),
            Positioned(
                top: MediaQuery.of(context).size.height/2 + 10,
                right: 20,
                child: MaterialButton(
                  height: 60.0,

                  shape: const CircleBorder(),
                  color: Colors.redAccent,
                  onPressed: (){},
                  child: Icon(Icons.download_rounded, color: Colors.white, size: 45.0),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height/2 + 50,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text("Jada", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, decorationThickness: 3.0),),
                        SizedBox(width: 10.0,),
                        Text("31", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, decorationThickness: 3.0),),
                        //SizedBox(width: 3.0,),
                        Icon(Icons.star, color: Colors.blueAccent, size: 35.0),
                      ],
                    ),
                    Row(
                     children: const [
                       Icon(Icons.ac_unit, size: 14.0,),
                       SizedBox(width: 8.0),
                       Text('Straight '),
                     ],
                   ),
                    Row(
                      children: const [
                        Icon(Icons.add_alert, size: 14.0,),
                        SizedBox(width: 8.0),
                        Text('19 miles Away'),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text('About Me', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),),
                     Container(
                       width: MediaQuery.of(context).size.width,
                      height: 40,
                      child:  TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,


                        // indicator: const BoxDecoration(
                        //     color: Colors.teal,
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(15.0),
                        //       topRight: Radius.circular(15.0),
                        //       bottomLeft: Radius.circular(15.0),
                        //       bottomRight: Radius.circular(15.0)
                        //     )
                        // ),
                        // unselectedLabelColor: Colors.white,
                        // labelStyle: TextStyle(color: Colors.redAccent),


                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 3.0,
                            style: BorderStyle.solid,
                            color: Colors.teal,
                          ),
                          insets: EdgeInsets.zero
                        ),
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.redAccent,
                        padding: EdgeInsets.zero,
                        controller: _controller,
                        tabs: [
                          new Tab(
                            text: 'Tab one',
                          ),
                          new Tab(
                            text: 'Tab two',
                          ),
                          new Tab(
                            text: 'Tab Three',
                          ),
                          new Tab(
                            text: 'Tab Four',
                          ),
                        ],
                      ),
                    ),

                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 100,
                     child:  TabBarView(
                       controller: _controller,
                       children:  [
                         Wrap(
                           children: const [
                             Chip(label: Text('This is final data')),
                             SizedBox(width: 6.0),
                             Chip(label: Text('This is ')),
                             SizedBox(width: 6.0),
                             Chip(label: Text('This is  data')),
                             SizedBox(width: 6.0),
                             Chip(label: Text('This is final ')),
                             SizedBox(width: 6.0),
                             Chip(label: Text('This is final data data')),
                           ],
                         ),
                         Center(
                           child: Text('B'),
                         ),
                         Center(
                           child: Text('C'),
                         ),
                         Center(
                           child: Text('D'),
                         ),
                       ],
                     ),
                   ),

                  ],
                )
            ),
          ],)
      ),
    );
  }
}