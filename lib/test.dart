
import 'package:conan/stock.dart';
import 'package:conan/stock_list.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'stock_list.dart';
import 'stock.dart';

class test extends StatefulWidget {
  test({Key key, this.title}) : super(key: key);
   final String title;
  @override
  State<StatefulWidget> createState(){
    return new _testState();
  }
}

class _testState extends State<test>{
  //final String titleString = "";
  var _stockList = new List<Stock>();
  String _model = "";

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ห้องแชท'),
      ),
      body: new Container(
        child: new Center(
          child: new StockList(stocks: _stockList),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _newTaskModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
        
      ),
    );
  }
  void _newTaskModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
          new ListTile(
            title: new Text('สร้างใหม่'),
          ),
          new ListTile(
            leading: new Icon(Icons.message),
            title: new Text('ข้อความ'),
            onTap: () => _inputStock(),  
          ),
          new ListTile(
            leading: new Icon(Icons.file_upload),
            title: new Text('อัปโหลด'),
            onTap: () => {},          
          ),
          new ListTile(
            leading: new Icon(Icons.camera_alt),
            title: new Text('สแกน'),
            onTap: () => {},          
          ),
          ],
          ),
          );
      }
    );
  }
  Future<Null> _inputStock() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: const Text('ข้อความใหม่'),
            contentPadding: EdgeInsets.all(5.0),
            content: new TextField(
              decoration: new InputDecoration(hintText: " พิมพ์ข้อความ"),
              onChanged: (String value) {
                _model = value;
              },
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("ส่ง"),
                onPressed: () {
                  setState(() {
                    if (_model.isNotEmpty) {
                      _stockList.add(new Stock(_model, 0.00));
                    }
                    _model = "";
                  });
                  Navigator.pop(context);
                },
              ),
              new FlatButton(
                child: new Text("ยกเลิก"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }


}


 