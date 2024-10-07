import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webui/helper/services/json_decoder.dart';
import 'package:webui/helper/widgets/my_text_utils.dart';
import 'package:webui/images.dart';
import 'package:webui/models/identifier_model.dart';

class Review extends IdentifierModel {
  final String name, comment, totalSpend, totalReview, image;
  final DateTime date;

  Review(
    super.id,
    this.name,
    this.comment,
    this.totalSpend,
    this.totalReview,
    this.image,
    this.date,
  );

  static Review fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);
    String name = decoder.getString('name');
    String comment = MyTextUtils.getDummyText(60);
    String totalSpend = decoder.getString('total_spend');
    String totalReview = decoder.getString('total_review');
    String image = Images.randomImage(Images.avatars);
    DateTime date = decoder.getDateTime('date');

    return Review(
      decoder.getId,
      name,
      comment,
      totalSpend,
      totalReview,
      image,
      date,
    );
  }

  static List<Review> listFromJSON(List<dynamic> list) {
    return list.map((e) => Review.fromJSON(e)).toList();
  }

  static List<Review>? _dummyList;

  static Future<List<Review>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 5);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/review.json');
  }
}
