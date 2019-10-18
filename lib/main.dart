import 'dart:math';

import 'package:flutter/material.dart';
import './src/SearchBar.dart';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './src/Events.dart';
import './src/friends.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:new DashboardScreen(title: 'Bottom Navigation'), /*Scaffold(
        appBar: SearchBar(
       defaultBar: AppBar(
         actions: <Widget>[
           IconButton(
             color: Colors.white,
          icon: Icon(Icons.notifications_active),
          tooltip: 'notifications',
          onPressed: () {
            // Implement navigaftion to notifications here...
          },
           ),
         ],
         leading: IconButton(
           color: Colors.white,
           icon: Icon(Icons.menu),
           onPressed: (){
             // implement menue slide
           },
         ),
         title: Text('Default app bar title'),
       ),
       iconified:false,
      ),
      bottomNavigationBar:BottomAppBar(
        // notchedShape:CircularNotchedRectangle(),
        //hasNotch:true,
         child:Row(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu,color: Colors.white,
              
            ),)
          ],
        ),
        color: Colors.blue,
       
      ),
      body: Container(
          color: Colors.blue,
          child: Stack
          (
              children:[
               
                 SingleChildScrollView(   //padding: new EdgeInsets.fromLTRB(10.0,0.0, 10.0, 0.0),
                 child:Column(
                //padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                      Container(
                        height: 100,
                        child: Text('Home',style: TextStyle(fontSize: 35.0, color: Colors.white),),
                        padding: new EdgeInsets.fromLTRB(0.0, 43.0, 150.0, 10.0)
                        
                        ),
                      Container(
                        height: 750, 
                         margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        decoration: new BoxDecoration
                        (
                            boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 20.0, // has the effect of softening the shadow
                                  spreadRadius: 5.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    10.0, // horizontal, move right 10
                                    10.0, // vertical, move down 10
                                  ),
                                )
                              ],
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(
                            width: 5.2,color: Colors.white,
                            ),
                        ),
                      ),
                   
                    ],
                  ),
                 ),
                
               Positioned
                  (
                        bottom: 0.5,
                        right: 8.0,
                        child:RadialMenu() ,
                  )
                    
                    ], 
             ),          
            ),
      ),*/
    );
  }
}



class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: SearchBar(
       defaultBar: AppBar(
         actions: <Widget>[
           IconButton(
             color: Colors.white,
          icon: Icon(Icons.notifications_active),
          tooltip: 'notifications',
          onPressed: () {
            // Implement navigaftion to notifications here...
          },
           ),
         ],
         leading: IconButton(
           color: Colors.white,
           icon: Icon(Icons.menu),
           onPressed: (){
             // implement menue slide
           },
         ),
         title: Text('Default app bar title'),
       ),
       iconified:false,
      ),
      body:  new PageView(
        children: [
         
          new Events(""),
          //new Location("Location screen"),
          new Friends(""),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.blue,
            ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              
                icon: new Icon(
                FontAwesomeIcons.pen,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Text",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )), cd
            new BottomNavigationBarItem(
              
                icon: new Icon(
                  Icons.event,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Events",textAlign:TextAlign.right,
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                    
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                 FontAwesomeIcons.road,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Text1",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.people,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Meeting",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                ))
          ],
          onTap: navigationTapped,
          currentIndex: _page,
          showUnselectedLabels:false,
           iconSize: 20.0
        ),
      ),
    );
  }
}