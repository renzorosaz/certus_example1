import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  //implements -> interfaces
  // withe ->
  //extends ->  class
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    this._themeData = theme;
    //método que notifica al WidgetPadre, el o los cambios realizados.
    notifyListeners();
  }
  //aumentar productos

  //disminuir productos

}

class Producto {
  int? sku;
  String? nombre;

  Producto(this.sku, this.nombre);
}

//final product = Producto();
