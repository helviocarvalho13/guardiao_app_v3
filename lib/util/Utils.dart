import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {

  static Color hexToColor(String code) {
    if(code != ""){
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }else{
      return Colors.black;
    }
  }

  static Color corPadraoGuardiao() {
    return new Color(int.parse('#3586b5'.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color corPadraoIdentidadeFuncional() {
    return new Color(int.parse('#605ca8'.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color corPadraoClubeParceria() {
    return new Color(int.parse('#E37224'.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color corPadraoPortalServidor() {
    return new Color(int.parse('#2c3e50'.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color corPadraoError() {
    return new Color(int.parse('#A35151'.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color corPadraoWarning() {
    return new Color(int.parse('#f39c12'.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color corPadraoSuccess() {
    return new Color(int.parse('#51A351'.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
