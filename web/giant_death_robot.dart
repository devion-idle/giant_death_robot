import 'dart:html';
import 'dart:async';

Element robot_hull;
Element robot_armor;
Element robot_destruction;
Element robot_carnage;

void main() {
  globalQueries();
  updateRobotStats();
  Duration update_time = new Duration(seconds:5);
  Timer timer = new Timer.periodic(update_time, updatePhase);
}

void updatePhase(Timer t) {
  Element phase = querySelector('#phase');
  if (phase.text == "Repair Phase")
    phase.text = "Combat Phase";
  else
    phase.text = "Repair Phase";
}

void updateRobotStats() {
  int hull = 3;
  int armor = 5;
  int destruction = 7;
  int carnage = 9;
  
  robot_hull.text = "Hull: $hull";
  robot_armor.text = "Armor: $armor";
  robot_destruction.text = "Destruction: $destruction";
  robot_carnage.text = "Carnage: $carnage";
}

void globalQueries() {
  robot_hull = querySelector('#robot_hull');
  robot_armor = querySelector('#robot_armor');
  robot_destruction = querySelector('#robot_destruction');
  robot_carnage = querySelector('#robot_carnage');
}