import 'dart:ui';

import 'package:flutter/material.dart';

const kMainThemeColor = Color(0xff990012);

const kMainBackgroundColor = Color(0xffFCF0F4);

const kTextFieldDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.all(20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainThemeColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainThemeColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
  ),
);
