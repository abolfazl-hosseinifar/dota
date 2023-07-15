import 'package:dota/models/heros.dart';
import 'package:dota/repo/api_services.dart';
import 'package:dota/repo/api_status.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as devtools;

class HerosViewModel extends ChangeNotifier {
  bool _loading = false;
  Heros _herosList = Heros();
  String _userError = "";

  bool get loading => _loading;
  Heros get herosList => _herosList;
  String get userError => _userError;

  HerosViewModel() {
    getHeros();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setHerosList(Heros herosList) {
    _herosList = herosList;
  }

  setUserError(String userError) {
    _userError = userError;
  }

  getHeros() async {
    setLoading(true);
    var response = await ApiServices.getHeros();
    if (response is Success) {
      setHerosList(response.response as Heros);
      devtools.log("response is success!");
    }
    if (response is Failure) {
      setUserError("userError");
      devtools.log("response is failure! " + response.code.toString());
    }
    setLoading(false);
  }
}
