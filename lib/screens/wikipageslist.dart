import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/wikipages.dart';
import '../widgets/wikiitem.dart';

class WikiPageList extends StatefulWidget {

  static const routeName = '/wikipage-screen';
   String filter;
   WikiPageList(this.filter);

  @override
  _WikiPageListState createState() => _WikiPageListState();
}

class _WikiPageListState extends State<WikiPageList> {

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];
  @override
  Widget build(BuildContext context) {

    final pagesData = Provider.of<WikiPages>(context);
    final pages = pagesData.items;
    return pages.length == 0
        ? Center(
      child: CircularProgressIndicator(),
    )
    // ? Center(
    //     child: Text(
    //       'No expenses till now!',
    //       style: Theme.of(context).textTheme.headline6,
    //     ),
    //   )
        : ListView.builder(

      itemCount: pages.length,
      itemBuilder: (ctx, i) {
       return  widget.filter == null || widget.filter == "" ? WikiItem(
          pages[i].id,
          pages[i].title,
          pages[i].description,
          pages[i].thumbnail,
          pages[i].index,
       ): pages[i].title.toLowerCase().contains(widget.filter.toLowerCase())?WikiItem(
         pages[i].id,
         pages[i].title,
         pages[i].description,
         pages[i].thumbnail,
         pages[i].index,
       ) : new Container();
      }
    );
  }
}
