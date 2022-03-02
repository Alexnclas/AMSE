import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tp2/changeNotifier.dart';
import 'package:tp2/tile.dart';
import 'package:provider/provider.dart';

import 'package:tp2/exercices/exo1.dart';
import 'package:tp2/exercices/exo2.dart';
import 'package:tp2/exercices/exo4.dart';
import 'package:tp2/exercices/exo5.dart';
import 'package:tp2/exercices/exo6.dart';



void main() {
  runApp(
    MaterialApp(
      title: 'TP2',
      home: ListeExos(),
    ),
  );
}

class ListeExos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des exercices'),
      ),
      body:ListView(
        children: [
          Exo1(),
          Exo2(),
          Exo4(),
          Exo5a(),
          Exo5b(),
          Exo5c(),
          Exo6(),
        ],
      )
    );
  }
}










// METTRE LE TAQUIN DANS UNE ZONE (PLUS DE SCROLLABLE)
// COMPTEUR DE DEPLACEMENT
// SCRAMBLE  (CALL PLUSIEURS FOIS LE SWAP)
// DIFFICULTEE SCRAMBLE
// ANNULER LE DERNIER COUP JOUEE (COPIE DU TABLEAU A CHAQUE UPDATE)

// INDIQUER LORSQUE LE JOUEUR A GAGNE

// (CHOIX IMAGE)

// CLEAN UP CODE
//GITHUB + README