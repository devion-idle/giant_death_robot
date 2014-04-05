library Part;

import 'dart:html';

var PartType = {"head": 0, "torso": 1, "left_arm": 2, "right_arm": 3, "base": 4};

class Part {
  String name;
  int hull;
  int armor;
  int destruction;
  int carnage;

  Part(this.name, this.hull, this.armor, this.destruction, this.carnage);

  void display(Element parent) {
    Element part_name = new DivElement();
    Element part_hull = new SpanElement();
    Element part_armor = new SpanElement();
    Element part_destruction = new SpanElement();
    Element part_carnage = new SpanElement();

    part_name.text = name;
    part_hull.text = "H:$hull ";
    part_armor.text = "A:$armor ";
    part_destruction.text = "D:$destruction ";
    part_carnage.text = "C:$carnage";

    parent.children.addAll([part_name, part_hull, part_armor, part_destruction, part_carnage]);
  }
}