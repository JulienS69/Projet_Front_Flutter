import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme/color_theme.dart';

//Permet la récupération de la couleur en fonction de son icon
Color getTypeOperationColor(String name) {
  //ToDO voir avec Laura pour chosir les bonnes couleurs pour les types de tâches
  switch (name) {
    case "Transaction":
      return purple;
    case "Virement":
      return blueStyle;
    case "Crédit Immobilier":
      return blue;
    case "Crédit Conso":
      return primary;
    case "Rachat de crédit":
      return blueStyle;
    case "Assurance prêt immobilier":
      return yellow;
    case "Banque en ligne":
      return green;
    case "Épargne":
      return grey6;
    default:
      return blueStyle;
  }
}

Icon getTypeOperationIcon(String name) {
  switch (name) {
    case "Transaction":
      return Icon(Icons.payment);
    case "Virement":
      return Icon(Icons.transfer_within_a_station);
    case "Crédit Immobilier":
      return Icon(Icons.sell);
    case "Crédit Conso":
      return Icon(Icons.receipt_long);
    case "Rachat de crédit":
      return Icon(Icons.local_atm);
    case "Assurance prêt immobilier":
      return Icon(Icons.add_card);
    case "Banque en ligne":
      return Icon(Icons.savings);
    case "Épargne":
      return Icon(Icons.account_balance_wallet);
    default:
      return Icon(Icons.payment);
  }
}
