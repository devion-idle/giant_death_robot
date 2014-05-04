library City;

import 'dart:math';

// Craig, CO #917

int max_pop  = 13200;
int max_infr;
int pop;
int infr;

void cityInit() {
  Random rng = new Random();
  max_infr = ((rng.nextDouble() + 0.5) * max_pop).toInt();
  pop = max_pop;
  infr = max_infr;
}