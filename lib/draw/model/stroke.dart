import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:drawingui/draw/model/offset.dart';

part 'stroke.g.dart';

@HiveType(typeId: 1)
class Stroke extends HiveObject{
  
  @HiveField(0)

  final List<Offsetcustom> points;
  @HiveField(1)
  
  final int color;
  @HiveField(2)
  final double brushsize ;
  
  Stroke({required List<Offset>points, required Color color, required this.brushsize})
  : points = points.map((e) => Offsetcustom.fromOffset(e)).toList(),
  color =color.value;
  List<Offset> get offsetPoints => points.map((e) => e.toOffset()).toList();

  Color get strokeColor => Color(color);
}
