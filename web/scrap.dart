library Scrap;

import 'dart:html';

import 'helper.dart';

Element scrap;
int scrap_val = 500000;

// Fetch query for scrap
void queryScrap() {
  scrap = querySelector('#scrap');
}

// update amount of scrap and display
void updateScrap() {
  scrap.text = "Scrap: ${shortPrint(scrap_val)}";
}

