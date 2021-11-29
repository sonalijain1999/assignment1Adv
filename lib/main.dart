import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _painter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //All our work will be done

    const radius = 100.0;
    const Offset offset =  Offset(0.0, 75.0);
    final Paint paint = Paint()
      ..isAntiAlias = false
      ..strokeWidth = 2.0
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final Offset bodystart = const Offset(0.0, 50.0);
    final Offset bodyend = const Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodystart, bodyend, paint);

    final Rect rect = Rect.fromCircle(center: offset, radius: radius);
    final Paint rectpaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, rectpaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter-Advance Assignment1'),
        shadowColor: Colors.yellow,
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: <Widget>[

                CustomPaint(painter: _painter(),),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('Play With Painter', style: TextStyle(fontSize: 20.0, fontWeight:  FontWeight.bold),),
                ),
              ],
            ),
          )
      ),
    );
  }
}