import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/wikipages.dart';

class WikiPageDetailScreen extends StatelessWidget {
  static const routeName = '/page-detail';
  @override
  Widget build(BuildContext context) {
    final noticeId =
    ModalRoute.of(context).settings.arguments as String; // is the id!
    final loaderWikiPage = Provider.of<WikiPages>(
      context,
      listen: false,
    ).findById(noticeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page Details',
          //   loaderComplaint.title,
        ),
        leading: BackButton(color: Colors.white),
      ),
      body: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(loaderWikiPage.thumbnail),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text(
                        'WikiPage Title :',
                        style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                      SizedBox(width: 8),
                      Text(
                        loaderWikiPage.title,
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Divider(thickness: 0.5, indent: 15, endIndent: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Index :',
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  SizedBox(width: 8),
                  Text(
                      loaderWikiPage.index,
                      style: TextStyle(fontWeight: FontWeight.bold,)
                  ),
                ],
              ),
            ),
            Divider(thickness: 0.5, indent: 15, endIndent: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ' Description :',
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    loaderWikiPage.description,
                    style: TextStyle(fontWeight: FontWeight.bold,)
                  ),
                ],
              ),
            ),
            Divider(thickness: 0.5, indent: 15, endIndent: 10),
          ],
        ),
      ),
    );
  }
}
