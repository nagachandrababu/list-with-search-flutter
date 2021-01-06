import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class WikiPage {
  final String id;
  final String title;
  final String thumbnail;
  final String description;
  final String index;

  WikiPage({
     this.id,
     this.title,
     this.thumbnail,
     this.description,
     this.index,
  });
}
