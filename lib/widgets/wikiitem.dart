import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wikisearchapp/screens/wikipage_details.dart';



class WikiItem extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String index;
  WikiItem(this.id, this.title, this.description, this.thumbnail,this.index);

  @override
  _WikiItemState createState() => _WikiItemState();
}

class _WikiItemState extends State<WikiItem> {

  @override
  Widget build(BuildContext context) {
    return new Card(
      // color: Color.fromRGBO(13, 17, 29, 0.5),
        child: Container(
          child: new Column(

            children: <Widget>[
              new ListTile(
                dense: true,
                leading: _getLeadingWidget(widget.thumbnail),

                title: new Text(
                  widget.title,
                  style: new TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(widget.index,
                          style: new TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87)),

                      new Text(widget.description,
                          style: new TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87)),
                    ]),
                //trailing: ,
                onTap: () {
                  //_showSnackBar(context, _allCities[index]);
                  Navigator.of(context).pushNamed(
                    WikiPageDetailScreen.routeName,
                    arguments: widget.id,
                  );
                },
              )
            ],
          ),
        ));
  }

   _getLeadingWidget(String avatarURL) {
    if( avatarURL== "" || avatarURL== null ){
      return new CircleAvatar(
        backgroundColor: Colors.blue,
      );
    }else{
        return Image.network(avatarURL);

    }

  }
}