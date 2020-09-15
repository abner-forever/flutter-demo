import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('滑动条'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('值：$_sliderValue'),
            Slider(
              value: _sliderValue,
              label: '$_sliderValue',
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (v) {
                setState(() {
                  _sliderValue = v;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
