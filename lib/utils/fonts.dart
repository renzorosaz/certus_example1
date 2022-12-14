import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//RECOMENDACION DE USO : CUANDO VAYAN A REUTILIZAR MUCHOS TEXTSTYLE
class APTextStyle {
  final BuildContext context;
  APTextStyle(this.context);

  TextStyle get titleInputText {
    return GoogleFonts.nunito(
        fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  }

  TextStyle get titleHaveAcount {
    return GoogleFonts.nunito(
        fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  }

  TextStyle get titleInputTextLight {
    return GoogleFonts.nunito(
        fontSize: 15, color: Colors.black, fontWeight: FontWeight.w100);
  }
}
