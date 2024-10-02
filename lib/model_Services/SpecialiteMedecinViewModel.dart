import 'package:flutter/foundation.dart';
import 'package:handihelp/models/specialite_medecin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpecialiteMedecinViewModel extends ChangeNotifier {
  List<SpecialiteMedecin> _specialiteMedecins = [];
  bool _isLoading = false;
  String _error = '';

  List<SpecialiteMedecin> get specialiteMedecins => _specialiteMedecins;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchSpecialiteMedecins() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _specialiteMedecins = data.map((json) => SpecialiteMedecin.fromJson(json)).toList();
      } else {
        _error = 'Failed to load data';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addSpecialiteMedecin(SpecialiteMedecin specialiteMedecin) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('YOUR_API_ENDPOINT'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(specialiteMedecin.toJson()),
      );

      if (response.statusCode == 201) {
        _specialiteMedecins.add(specialiteMedecin);
      } else {
        _error = 'Failed to add specialite medecin';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateSpecialiteMedecin(SpecialiteMedecin specialiteMedecin) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.put(
        Uri.parse('YOUR_API_ENDPOINT/${specialiteMedecin.id_medecin}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(specialiteMedecin.toJson()),
      );

      if (response.statusCode == 200) {
        final index = _specialiteMedecins.indexWhere((sm) =>
          sm.id_medecin == specialiteMedecin.id_medecin &&
          sm.id_specialite == specialiteMedecin.id_specialite
        );
        if (index != -1) {
          _specialiteMedecins[index] = specialiteMedecin;
        }
      } else {
        _error = 'Failed to update specialite medecin';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteSpecialiteMedecin(int idMedecin, int idSpecialite) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.delete(
        Uri.parse('YOUR_API_ENDPOINT/$idMedecin/$idSpecialite'),
      );

      if (response.statusCode == 204) {
        _specialiteMedecins.removeWhere((sm) =>
          sm.id_medecin == idMedecin && sm.id_specialite == idSpecialite
        );
      } else {
        _error = 'Failed to delete specialite medecin';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
