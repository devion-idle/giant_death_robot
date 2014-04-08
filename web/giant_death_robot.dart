import 'dart:html';
import 'dart:async';

import 'robot.dart';
import 'scrap.dart';

// launch function
void main() {
  // initialization
  globalQueries();
  robotInit();
  updateRobotStats();
  updatePartsDisplay();
  updateScrap();

  // start
  Duration update_time = new Duration(seconds:5);
  Timer timer = new Timer.periodic(update_time, updatePhase);
}

// phase switch
void updatePhase(Timer t) {
  Element phase = querySelector('#phase');
  if (phase.text == "Repair Phase")
    phase.text = "Combat Phase";
  else
    phase.text = "Repair Phase";
}