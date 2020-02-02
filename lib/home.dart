import 'package:conan/character.dart';
import 'package:conan/conanitem.dart';
import 'package:conan/conanstory.dart';
import 'package:conan/test.dart';
import 'package:flutter/material.dart';

 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.icon}) : super(key: key);
  final String title;
  final Widget icon;

  @override
  _MyHomePageState createState() => _MyHomePageState(); 
}

class _MyHomePageState extends State<MyHomePage> {
  
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Conan");

  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {
                if(this.cusIcon.icon == Icons.search){
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                  }else{
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("Conan");
                  }
              });
            },
            icon: cusIcon,
          ),
        IconButton(
                icon: Icon(
                  Icons.person_pin,
                  semanticLabel: 'person',
                ),
                onPressed: () {
                  print('Filter button');
                },
              ),
        ],
        title: cusSearchBar,
      ),
      body:ListView(
         children: <Widget>[
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => character())
                );
              },
              child: ListTile(
                title: Text('ตัวละครหลัก'),
              ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => conanitem()),
                );
              },
              child: ListTile(
                title: Text('อุปกรณ์ไฮเทคของโคนัน'),
              ),
            ),
          ),Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => conanstory()),
                );
              },
              child: ListTile(
                title: Text('ผู้แต่ง'),
              ),
            ),
          ),Container(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new test()),
                );
              },
              child: ListTile(
                title: Text('ห้องแชท'),
              ),
            ),
          ),
      ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Conan '),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('ตัวละครหลัก'),
                ),
                ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text('อุปกรณ์ไฮเทคของโคนัน'),
                ),
                ListTile(
                  leading: Icon(Icons.perm_contact_calendar),
                  title: Text('ผู้แต่ง'),
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('ห้องแชท'),
                ),
              ],
        ),
      ),
    );
  }
}
      
