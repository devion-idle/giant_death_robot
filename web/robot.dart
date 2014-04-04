library Robot;

import 'dart:html';

import 'part.dart';

// global elements
Element robot_hull;
Element robot_armor;
Element robot_destruction;
Element robot_carnage;

Element robot_head;
Element robot_torso;
Element robot_l_arm;
Element robot_r_arm;
Element robot_base;

// robot parts
List<Part> robot = [];
List<Part> head = [];
List<Part> torso = [];
List<Part> l_arm = [];
List<Part> r_arm = [];
List<Part> base = [];

// queries for global elements
void globalQueries() {
  robot_hull = querySelector('#robot_hull');
  robot_armor = querySelector('#robot_armor');
  robot_destruction = querySelector('#robot_destruction');
  robot_carnage = querySelector('#robot_carnage');

  robot_head = querySelector('#head');
  robot_torso = querySelector('#torso');
  robot_l_arm = querySelector('#left_arm');
  robot_r_arm = querySelector('#right_arm');
  robot_base = querySelector('#base');
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

void updatePartsDisplay() {
  updateHead();
  updateTorso();
  updateLArm();
  updateRArm();
  updateBase();
}

void updateHead() {
  robot_head.text = 'Head: ${robot[0].name}';
}

void updateTorso() {
  robot_torso.text = 'Torso: ${robot[1].name}';
}

void updateLArm() {
  robot_l_arm.text = 'Left Arm: ${robot[2].name}';
}

void updateRArm() {
  robot_r_arm.text = 'Right Arm: ${robot[3].name}';
}

void updateBase() {
  robot_base.text = 'Base: ${robot[4].name}';
}