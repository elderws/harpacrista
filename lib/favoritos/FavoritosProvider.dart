import 'package:flutter/material.dart';

class FavoritosProvider with ChangeNotifier {
  List<String> _favoritos = [];

  List<String> get favoritos => _favoritos;

  void addFavorito(String favorito) {
    if (!_favoritos.contains(favorito)) {
      _favoritos.add(favorito);
      notifyListeners();
    }
  }

  void removeFavorito(String favorito) {
    _favoritos.remove(favorito);
    notifyListeners();
  }

  void setFavoritos(List<String> favoritos) {
    _favoritos = favoritos;
    notifyListeners();
  }
}