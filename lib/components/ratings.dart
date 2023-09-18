import 'package:flutter/material.dart';

abstract class Ratings {
  static List<Icon> criarEstrelas(int mediaAvaliacoes, {double size = 16}) {
    return List<Icon>.generate(
      5,
      (int index) => Icon(
        mediaAvaliacoes > index ? Icons.star : Icons.star_border,
        size: size,
        shadows: const [Shadow(color: Colors.black, offset: Offset(3, 3))],
      ),
    );
  }
}
