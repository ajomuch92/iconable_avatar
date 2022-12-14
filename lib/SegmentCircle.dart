library iconable_avatar;

import 'dart:math';
import 'package:flutter/material.dart';

/// Class to generate the segment for the bottom container
class SegmentCircle extends CustomClipper<Path> {
  /// double value for circle avatar radius
  final double radius;

  /// List with points on axie X
  List<double> _xCoordinates = [];

  /// List with the value of the coordinate x,y to draw the custom clipper
  final List<List<double>> _coordinates = [];

  /// int value to define the number of deltas
  final int _deltas = 5000;

  SegmentCircle({this.radius = 0});

  @override
  Path getClip(Size size) {
    calculateCoordinates(size);
    Path path = Path();
    for (List<double> coordinate in _coordinates) {
      path.lineTo(coordinate[0], coordinate[1]);
    }
    path.close();
    return path;
  }

  /// method to calculate all the coordinates for path
  /// size is the size for the path
  void calculateCoordinates(Size size) {
    double width = size.width;
    double height = size.height;
    double delta = width / _deltas;
    if (_xCoordinates.isEmpty) {
      _xCoordinates = List.generate(5000, (index) => delta * (index + 1));
    }
    if (_coordinates.isEmpty) {
      List<double> hk = _findCircle(0, 0, width, 0, width / 2, height);
      for (double x in _xCoordinates) {
        double y = _evaluateCircleFunction(height, width, x, hk[0], hk[1]);
        _coordinates.add([x, y]);
      }
    }
  }

  /// Method to evaluate a X coordinate and generate the Y coordinate
  double _evaluateCircleFunction(
      double height, double width, double x, double h, double k) {
    double y = sqrt(pow(radius, 2) - pow(x - h, 2)) + k;
    return y;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  /// Method to calculate the values used as h and k to generate the function to draw the circle
  List<double> _findCircle(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    double x12 = x1 - x2;
    double x13 = x1 - x3;

    double y12 = y1 - y2;
    double y13 = y1 - y3;

    double y31 = y3 - y1;
    double y21 = y2 - y1;

    double x31 = x3 - x1;
    double x21 = x2 - x1;

    double sx13 = (pow(x1, 2) - pow(x3, 2)) as double;

    double sy13 = (pow(y1, 2) - pow(y3, 2)) as double;

    double sx21 = (pow(x2, 2) - pow(x1, 2)) as double;

    double sy21 = (pow(y2, 2) - pow(y1, 2)) as double;

    double f =
        ((sx13) * (x12) + (sy13) * (x12) + (sx21) * (x13) + (sy21) * (x13)) /
            (2 * ((y31) * (x12) - (y21) * (x13)));
    double g =
        ((sx13) * (y12) + (sy13) * (y12) + (sx21) * (y13) + (sy21) * (y13)) /
            (2 * ((x31) * (y12) - (x21) * (y13)));

    double h = -g;
    double k = -f;
    return [h, k];
  }
}
