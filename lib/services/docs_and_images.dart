import 'package:flutter/material.dart';

class DocsStateService extends ChangeNotifier {
  final List<String> _docs = [];

  void addDocs(String docs) {
    _docs.add(docs);
    notifyListeners();
  }

  void removeDocs(String docs) {
    _docs.remove(docs);
    notifyListeners();
  }

  void resetProvider(){
    _docs.clear();
    notifyListeners();
  }

  List<String> get docs => _docs;
}

class ProjectImageStateService extends ChangeNotifier {
  final List<String> _images = [];

  void addImage(String docs) {
    _images.add(docs);
    notifyListeners();
  }

  void removeDocs(String docs) {
    _images.remove(docs);
    notifyListeners();
  }

  void resetProvider(){
    _images.clear();
    notifyListeners();
  }

  List<String> get images => _images;
}
