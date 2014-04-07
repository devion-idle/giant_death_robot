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
List<List<Part>> parts = [];
List<Part> head = [];
List<Part> torso = [];
List<Part> l_arm = [];
List<Part> r_arm = [];
List<Part> base = [];

// selected part ids
List<int> id;

// queries for global elements
void globalQueries() {
  robot_hull = querySelector('#robot_hull');
  robot_armor = querySelector('#robot_armor');
  robot_destruction = querySelector('#robot_destruction');
  robot_carnage = querySelector('#robot_carnage');

  robot_head = querySelector('#head_text');
  robot_torso = querySelector('#torso_text');
  robot_l_arm = querySelector('#left_arm_text');
  robot_r_arm = querySelector('#right_arm_text');
  robot_base = querySelector('#base_text');

  // add callbacks
  querySelectorAll('.robot').onClick.listen(expandPart);
}

void expandPart(MouseEvent event) {
  // Build new element
  Element parent = (event.target as Element).parent;
  int type = PartType[parent.id];

  // Test if valid parent
  if (type != null)
  {
    // Remove old details div
    Element old = querySelector('#part');
    if (old != null) old.remove();

    // Create div containing all parts, and a span for each part
    Element part_details = new DivElement();
    int num = parts[type].length;
    List<Element> part_display = new List(num);

    // Populate each span with the appropriate part
    for (int i = 0; i < num; i++) {
      Part p = parts[type][i];
      part_display[i] = new SpanElement();
      p.display(part_display[i]);

      // Part ID selector on click
      part_display[i].onClick.listen((Event e){e;id[type] = i;});
    }

    // Add new details div to parent
    part_details.id = 'part';
    part_details.children.addAll(part_display);
    parent.children.add(part_details);
  }
  updateRobotStats();
  updatePartsDisplay();
}

// robot parts initialization
void robotInit() {
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
       ..add(new Part('Hammer',3,1,6,0));

  base ..add(new Part('Legs',6,2,0,2))
       ..add(new Part('Wheels',4,0,3,3))
       ..add(new Part('Tracks',1,7,2,0));

  parts.addAll([head, torso, l_arm, r_arm, base]);
  id = [0,0,0,0,0];
}

// update the robot stats to match new parts
void updateRobotStats() {
  int hull = 0;
  int armor = 0;
  int destruction = 0;
  int carnage = 0;

  for (int i = 0; i < id.length; i++){
    Part p = r_part(i);
    hull += p.hull;
    armor += p.armor;
    destruction += p.destruction;
    carnage += p.carnage;
  }

  robot_hull.text = "Hull: $hull";
  robot_armor.text = "Armor: $armor";
  robot_destruction.text = "Destruction: $destruction";
  robot_carnage.text = "Carnage: $carnage";
}

// Helper function to fetch the robot's current part
Part r_part (int location) {
  return parts[location][id[location]];
}

// Display updates
void updatePartsDisplay() {
  updateHead();
  updateTorso();
  updateLArm();
  updateRArm();
  updateBase();
}

void updateHead() {
  robot_head.text = 'Head: ${r_part(0).name}';
}

void updateTorso() {
  robot_torso.text = 'Torso: ${r_part(1).name}';
}

void updateLArm() {
  robot_l_arm.text = 'Left Arm: ${r_part(2).name}';
}

void updateRArm() {
  robot_r_arm.text = 'Right Arm: ${r_part(3).name}';
}

void updateBase() {
  robot_base.text = 'Base: ${r_part(4).name}';
}