library Part;

var PartType = {"head": 0, "torso": 1, "left_arm": 2, "right_arm": 3, "base": 4};

class Part {
  String name;
  int hull;
  int armor;
  int destruction;
  int carnage;

  Part(this.name, this.hull, this.armor, this.destruction, this.carnage);


}