import 'package:flutter/material.dart';

class MQuery {
  double mHieght(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  double mWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  bool compareHieght(BuildContext context, double value) {
    return MediaQuery.of(context).size.height > value;
  }

  bool compareWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width > value;
  }
}

MQuery mQuery = MQuery();
