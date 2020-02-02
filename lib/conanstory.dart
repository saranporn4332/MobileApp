import 'package:flutter/material.dart';

class conanstory extends StatelessWidget {
  final List myImageData = [
    'conanstory/s001.jpg',
   
  ];
  final List myname = [
    'ประวัติผู้แต่งยอดนักสืบจิ๋วโคนัน',
   
  ];
  final List mytext = [
  
    '     ผู้แต่งโคนัน มีชื่อว่า อ.โกโช อายาม่า มีชื่อจริงว่า โยชิมาสะ อาโอยาม่า เกิดวันที่ 21 มิถุนายน ค.ศ.1963 เมืองไดเออิ(ปัจจุบันคือเมืองโฮคุอิ) จังหวัดทตโตริ ประเทศญี่ปุ่น ฝีมือด้านการวาดรูปของอาจารย์อาโอยาม่า สุดยอดมาตั้งแต่เด็ก อาจารย์เคยชนะการประกวดสัมยเรียนอยู่ชั้น ป.1 ภาพที่อาจารย์ชนะชื่อว่า "Yukiai War" และภาพนี้ยังได้เอาไปโชว์ที่ห้างสรรพสินค้า Tottori Daimaru อาจารย์จบมัธยมปลายที่โรงเรียนมัธยมปลายในยูระ แล้วเรียนต่อมาที่มหาลัยนิปปอน คณะศิลปกรรมศาสตร์ พอจบมาก็ได้เป็นครูสอนศิลปะด้วยแล้วก็เขียนการ์ตูนด้วย เราก็เลยเรียกกันว่า "อาจารย์"จุดเริ่มต้นที่ทำให้อาจารย์เป็นนักเขียนการ์ตูน เพราะตอนที่อาจารย์เรียนอยู่มหาวิทยาลัยได้เข้าร่วมการประกวดนักเขียนการ์ตูนหน้าใหม่ของโชกักกุกัง ในปี ค.ศ. 1986 แล้วอาจารย์ก็เป็นผู้ชนะ จุดนี้จึงทำให้อาจารย์ได้เข้ามาเป็นนักเขียนการ์ตูนอย่างเต็มตัว',
   
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ประวัติผู้แต่งยอดนักสืบจิ๋วโคนัน"),
      ),
      body: Center(
        child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(8),
          itemCount: myImageData.length,
          gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
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
                          myImageData[index], myname[index], mytext[index]);
                      }),
                    );
                  },
                ),
                Text(myname[index]),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final imageSrc, myname, mytext;
  DetailScreen(this.imageSrc, this.myname, this.mytext);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติผู้แต่งยอดนักสืบจิ๋วโคนัน'),
      ),
      
      body: Column(
        children: <Widget> [
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
          Text(mytext),
        ],
      ),
    );
  }
}
