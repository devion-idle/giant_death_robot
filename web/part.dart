library Part;

import 'dart:html';

import 'scrap.dart';

var PartType = {"head": 0, "torso": 1, "left_arm": 2, "right_arm": 3, "base": 4};

class Part {
  String name;
  int hull;
  int armor;
  int destruction;
  int carnage;
  int level;

  // Constructor
  Part(this.name, this.hull, this.armor, this.destruction, this.carnage) {
    level = 1;
  }

  // Function to display part details
  void display(Element parent) {
    // Display name and level
    Element part_name = new DivElement();
    part_name.text = "$name (LVL $level)";

    // Display attributes
    Element part_hull = new SpanElement();
    Element part_armor = new SpanElement();
    Element part_destruction = new SpanElement();
    Element part_carnage = new SpanElement();
    part_hull.text = "H:$hull ";
    part_armor.text = "A:$armor ";
    part_destruction.text = "D:$destruction ";
    part_carnage.text = "C:$carnage";


    // Display upgrade button
    Element part_upgrade = new DivElement();
    part_upgrade.text = "Upgrade";
    part_upgrade.onClick.listen((MouseEvent e) => upgrade(e, part_name));

    // Add elements to provided parent
    parent.children.addAll([part_name, part_hull, part_armor, part_destruction, part_carnage, part_upgrade]);
  }

  // Part upgrade
  void upgrade(MouseEvent e, DivElement part_name) {
    if (scrap_val >= 100*level) {
      scrap_val -= 100*level;
      updateScrap();
      level++;
      part_name.text = "$name (LVL $level)";
    }
  }
}