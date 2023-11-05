import 'package:flutter/foundation.dart';

class CharacterModel extends ChangeNotifier {
  String _name = '';
  String get name => _name;
  String _status = '';
  String get status => _status;
  String _species = '';
  String get species => _species;
  String _origin = '';
  String get origin => _origin;
  String _imagen = '';
  String get imagen => _imagen;
  String _location = '';
  String get location => _location;


  CharacterModel({
    String name = '',
    String status = '',
    String species = '',
    String origin = '',
    String imagen = '',
    String location = '',
  }) {
    _name = name;
    _status = status;
    _species = species;
    _origin = origin;
    _imagen = imagen;
    _location = location;
  }


  void updateCharacter(
    String newName,
    String newStatus,
    String newSpecies,
    String newOrigin,
    String newImage,
    String newLocation,
  ) {
    _name = newName;
    _status = newStatus;
    _species = newSpecies;
    _origin = newOrigin;
    _imagen = newImage;
    _location = newLocation;
    notifyListeners();
  }
}
