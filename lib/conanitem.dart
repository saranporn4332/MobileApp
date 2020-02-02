import 'package:flutter/material.dart';

 
class conanitem extends StatelessWidget {
  final List myImageData = [
    'conanitem/01.jpg',
    'conanitem/02.jpg',
    'conanitem/03.jpg',
    'conanitem/04.jpg',
    'conanitem/05.jpg',
    'conanitem/06.jpg',
    'conanitem/07.jpg',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("อุปกรณ์ไฮเทคของโคนัน"),
      ),
      body: Center(
        child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          itemCount: myImageData.length,
          
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  child: Hero(
                    tag: myImageData[index],
                    child: Image.asset(
                      'assets/image/' + myImageData[index],
                      height: 100,
                      width: 100,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return DetailScreen( 
                          myImageData[index]);
                      }),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final imageSrc;
  DetailScreen(this.imageSrc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('อุปกรณ์ไฮเทคของโคนัน'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Hero(
              tag: imageSrc,
              child: Image.asset(
                'assets/image/' + imageSrc,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
