

import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class NumericKeyboardPage extends StatefulWidget {
  const NumericKeyboardPage({super.key});

  @override
  State<NumericKeyboardPage> createState() => _NumericKeyboardPageState();
}


class _NumericKeyboardPageState extends State<NumericKeyboardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp ();
void main() {
  var input = '0';

    runApp(
    MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
    Expanded(
      child: Column(
        children: [
          Text(input),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ),
      ],
      ),
    child: Container (
    color: AppColors.grayLight
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround, 
children: <widget>[   
Row(
  children: <widget>[
Expanded (
  child: MaterialButton(
child: Text('1'),
onPressed: () {
input += '1';
print(input);
},
),),
Expanded(child: MaterialButton(
child: Text('2'),
onPressed: () {
input += '2';
print (input);
},
),),
Expanded(child: MaterialButton(
child: Text('3'),
onPressed: () {
input += '3';
print (input);
},
),),

Row(
children: <widget>[
Expanded(child: MaterialButton(
child: Text('4'),
onPressed: () {
input += '4';
print (input);
},
),),
Expanded(child: MaterialButton(
child: Text('5'),
onPressed: () {
input += '5';
print (input);
},
),),
Expanded(child: MaterialButton(
child: Text('6'),
onPressed: () {
input += '6';
print (input);
},
),),

Row(
children: <widget>[
Expanded(child: MaterialButton(
child: Text('7'),
onPressed: () async {

},
),),
Expanded(child: MaterialButton(
child: Text('8'),
onPressed: () {
},
),
),

Expanded(child: MaterialButton(
child: Text('9'),
onPressed: () {},
),
),

Row(
children: <widget>[
Expanded(
child: Container(),
),

Expanded(child: MaterialButton(
child: Text('0'),
onPressed: () {

},
),
),
Expanded(child: MaterialButton(
child: Icon(Icons.backspace),
onPressed: () {

},