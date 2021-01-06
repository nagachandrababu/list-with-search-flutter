import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/wikipages.dart';
import '../screens/wikipageslist.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;
  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print(didChangeDependencies);
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      //  final Map userName = ModalRoute.of(context).settings.arguments;
      //  societyId= userName['societyId'];

      Provider.of<WikiPages>(context).fetchAndSetWikiPage().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 27, 49, 1.0),
          title: Text("Wiki List",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      body:  _isLoading
    ? Center(
    child: CircularProgressIndicator(),
    )
        : Container(
       // color: Color.fromRGBO(13, 17, 29, 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
               Padding(
                padding: new EdgeInsets.all(8.0),
                child: new TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search names',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
          Expanded(

            child: WikiPageList(filter),
          ),
          ],
      ),
        ),
    );

}
}