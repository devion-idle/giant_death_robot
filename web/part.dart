library Part;

import 'dart:html';

import 'robot.dart';
import 'scrap.dart';

var PartType = {"head": 0, "torso": 1, "left_arm": 2, "right_arm": 3, "base": 4};

class Part {
  String name;
  double hull;
  double armor;
  double destruction;
  double carnage;
  int level;
  double upgrade_cost;

  Element part_name;
  Element part_hull;
  Element part_armor;
  Element part_destruction;
  Element part_carnage;
  Element part_upgrade;

  // Constructor
  Part(this.name, this.hull, this.armor, this.destruction, this.carnage) {
    level = 1;
    upgrade_cost = 100.0;
  }

  // Function to display part details
  void display(Element parent) {
    // Create elements
    part_name = new DivElement();
    part_hull = new SpanElement();
    part_armor = new SpanElement();
    part_destruction = new SpanElement();
    part_carnage = new SpanElement();
    part_upgrade = new DivElement();

    // Add upgrade callback
    part_upgrade.onClick.listen(upgrade);

    // Set element text
    updateText();

    // Add elements to provided parent
    parent.children.addAll([part_name, part_hull, part_armor, part_destruction, part_carnage, part_upgrade]);
  }

  void updateText() {
    part_name.text = "$name (LVL $level)";
    part_hull.text = "H:${hull.toInt()} ";
    part_armor.text = "A:${armor.toInt()} ";
    part_destruction.text = "D:${destruction.toInt()} ";
    part_carnage.text = "C:${carnage.toInt()}";
    part_upgrade.text = "Upgrade (${upgrade_cost.toInt()} scrap)";
  }

  // Part upgrade
  void upgrade(MouseEvent e) {
    if (scrap_val >= upgrade_cost) {
      scrap_val -= upgrade_cost.toInt();
      upgrade_cost *= 1.5;
      updateScrap();
      level++;
      hull *= 1.4;
      armor *= 1.4;
      destruction *= 1.4;
      carnage *= 1.4;
      updateText();
      updateRobotStats();
    }
  }
}