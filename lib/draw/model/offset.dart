import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'offset.g.dart';

@HiveType(typeId: 0)
class Offsetcustom extends HiveObject {
  @HiveField(0)
  final double dx;

  @HiveField(1)
  final double dy;

  Offsetcustom(this.dx,this.dy);


  Offset toOffset() => Offset(dx, dy);
  factory Offsetcustom.fromOffset(Offset offset){
    return Offsetcustom(offset.dx, offset.dy);
  }
}