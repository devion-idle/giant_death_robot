import 'dart:html';
import 'dart:async';

import 'robot.dart';
import 'scrap.dart';

Element phase;
bool active;

// launch function
void main() {
  // initialization
  robotInit();
  scrapInit();
  controlInit();

  // start
  Duration update_time = new Duration(seconds:1);
  Timer timer = new Timer.periodic(update_time, updatePhase);
}

// phase switch
void updatePhase(Timer t) {
  // select phase based on robot health
  if (current_health <= 0) active = false;
  else if (current_health >= max_health) active = true;

  if (active) {
    updateCombat();
    phase.text = "Combat Phase";
  }
  else {
    updateRepair();
    phase.text = "Repair Phase";
  }
}

void updateCombat() {
  current_health -= 5;
  updateHealth();
}

void updateRepair() {
  current_health += 5;
  updateHealth();
}
void controlInit() {
  phase = querySelector('#phase');
}