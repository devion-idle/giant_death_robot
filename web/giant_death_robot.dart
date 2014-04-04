import 'dart:html';
import 'dart:async';

void main() {
  Duration updateTime = new Duration(seconds:5);
  Timer timer = new Timer.periodic(updateTime, updatePhase);
}

void updatePhase(Timer t) {
  Element phase = querySelector('#phase');
  if (phase.text == "Repair Phase")
    phase.text = "Combat Phase";
  else
    phase.text = "Repair Phase";
}