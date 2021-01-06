 import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../models/wikipage.dart';
import 'package:path_provider/path_provider.dart';

class WikiPages with ChangeNotifier {
  List<WikiPage> _items = [];

  BuildContext context;
  List<WikiPage> get items {
    return [..._items];
  }

  WikiPage findById(String id) {
    return _items.firstWhere((exp) => exp.id == id);
  }

  Future<void> fetchAndSetWikiPage() async {
    String finalURL = "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=Sachin+T&gpslimit=10";

    String fileName = "wikipagesdata.json";
    var wikiData = null;
    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/" + fileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      wikiData = json.decode(jsonData);
     // Response response = Response.fromJson(json.decode(jsonData));

    } else{

      Map<String, String> headers = {
        "Content-type": "application/json",
      };
      final response = await http.get(finalURL, headers: headers);
      print(json.decode(response.body));
      wikiData = json.decode(response.body);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    }

    try {

      // dynamic extractedData = json.decode(response.body);

       final pagesData = wikiData ['query']['pages'];
     print(pagesData);
      if (pagesData != null) {

          final List<WikiPage> loadedMarkets = [];
          pagesData.forEach((resiData) {
            resiData['thumbnail'] ;
            loadedMarkets.add(WikiPage(
              id: resiData['pageid'].toString(),
              title: resiData['title'] == null ? "" : resiData['title'],

              thumbnail: resiData['thumbnail'] == null ? "" : resiData['thumbnail']['source'] ,
              description: resiData['terms'] == null ? "" : resiData['terms']['description'][0] ,
              index: resiData['index'] == null ? "" : resiData['index'].toString(),


            ));
          });
          _items = loadedMarkets;
          //  _items.add(loadedResidents);
          notifyListeners();
        } else {
          // showAlertDialog(context, "Error", extractedData['errorMsg']);
        }

    } catch (error) {
      throw (error);
    }
  }

}
