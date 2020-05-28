// import 'package:flutter/material.dart';
// import 'dart:async';


// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:provider/provider.dart';
// import 'package:time_slot_picker/players.dart';

// void main() => runApp(MyHomePage());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int val;

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<MyModel>( //      <--- ChangeNotifierProvider
//       create: (context) => MyModel(),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(title: Text('My App')),
//           body: Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 child: Column(children: [
//                   TextFormField(
//                    onChanged: (v){
//                      setState(() {
//                        val = int.parse(v);
//                      });
//                    },
//                   )
//                 ],)
//               ),
//               Container(
//                 child: Consumer<MyModel>(
//                   builder: (context, myModel, child){
//                     return RaisedButton(
//                       child: Text('Add'),
//                       onPressed: () {
//                         myModel.add(val);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 child: Consumer<MyModel>(
//                   builder: (context, myModel, child){
//                     return Text(
//                       myModel.value.toString()
                      
//                     );
//                   },
//                 ),
//               ),
             
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyModel with ChangeNotifier { //                          <--- MyModel
//   String someValue = 'Hello';
//   int c;
//   int sum  = 0;
//   int v1 = 0;
//   add(int v){
//     sum = sum + v;
//     c = sum;
//     print(sum);
//     notifyListeners();
//   }
//   int get value {
//     if (c == null){
//       c = 0;
//       return c;
//     }
//     else {
//       return c;
//     }
//   }

  
// }