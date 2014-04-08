library Scrap;

import 'dart:html';

Element scrap;
int scrap_val = 5000000000;

// Fetch query for scrap
void queryScrap() {
  scrap = querySelector('#scrap');
}

// update amount of scrap and display
void updateScrap() {
  scrap.text = "Scrap: $scrap_val";
}

