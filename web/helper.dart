library Helper;

// print shortened versions of numbers
String shortPrint(var val) {
  if (val >= 100000000000000.0) {
    return '${val~/1000000000000} T';
  }
  else if (val >= 100000000000.0) {
    return '${val~/1000000000} B';
  }
  else if (val >= 100000000.0) {
    return '${val~/1000000} M';
  }
  else if (val >= 100000.0) {
    return '${val~/1000} K';
  }
  else return '${val.toInt()}';
}