import 'package:wikisearchapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './viewmodel/wikipages.dart';
import './screens/wikipage_details.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider.value(value: WikiPages()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {

          WikiPageDetailScreen.routeName: (ctx) => WikiPageDetailScreen(),


        },
      ),
    );
  }
}
