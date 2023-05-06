import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String title = 'Pokedex';

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getTypeChipTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
  }

  static getPokeInfoLabelStyle() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static getPokeInfoTextStyle() {
    return const TextStyle(fontSize: 16, color: Colors.black);
  }
}
