import 'dart:html';
import 'dart:async';

import 'part.dart';

// global elements
Element robot_hull;
Element robot_armor;
Element robot_destruction;
Element robot_carnage;

// robot parts
List<Part> robot = [];
List<Part> head = [];
List<Part> torso = [];
List<Part> l_arm = [];
List<Part> r_arm = [];
List<Part> base = [];

// launch function
void main() {
  // initialization
  globalQueries(); 
  robotInit();
  updateRobotStats();
  
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

// update the robot stats to match new parts
void updateRobotStats() {
  int hull = 0;
  int armor = 0;
  int destruction = 0;
  int carnage = 0;
  
  robot.forEach((Part p){
    hull += p.hull;
    armor += p.armor;
    destruction += p.destruction;
    carnage += p.carnage;
  });
  
  
  robot_hull.text = "Hull: $hull";
  robot_armor.text = "Armor: $armor";
  robot_destruction.text = "Destruction: $destruction";
  robot_carnage.text = "Carnage: $carnage";
}

// queries for global elements
void globalQueries() {
  robot_hull = querySelector('#robot_hull');
  robot_armor = querySelector('#robot_armor');
  robot_destruction = querySelector('#robot_destruction');
  robot_carnage = querySelector('#robot_carnage');
}

// robot parts initialization
robotInit() {
  head ..add(new Part('Lasers',0,0,5,5))
       ..add(new Part('Helmet',7,2,0,1))
       ..add(new Part('Crown',2,6,1,1));
  
  torso..add(new Part('Plated',10,9,0,1))
       ..add(new Part('Rockets',3,3,9,5))
       ..add(new Part('Gatling',2,4,4,10));
  
  l_arm..add(new Part('Missiles',1,1,2,6))
       ..add(new Part('Sword',4,1,2,3))
       ..add(new Part('Fist',1,2,7,0));
    
  r_arm..add(new Part('Blaster',1,6,1,2))
       ..add(new Part('Saw',0,1,3,6))
       ..add(new Part('Hammer',3,1,7,0));
  
  base ..add(new Part('Legs',6,2,0,2))
       ..add(new Part('Wheels',4,0,3,3))
       ..add(new Part('Tracks',1,7,2,0));
  
  robot.addAll([head[0], torso[0], l_arm[0], r_arm[0], base[0]]);
}