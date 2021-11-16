import 'package:flutter/material.dart';

class MassageEntity {
  final String name;
  final String massage;
  final String phone;
  final String id;

  MassageEntity(
      {@required this.id,
      @required this.massage,
      @required this.name,
      @required this.phone});
}
