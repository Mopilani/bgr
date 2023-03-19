import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  var file = File('data.json');
  var jsnStr = file.readAsStringSync();
  var map = json.decode(jsnStr);
  print(map);
}
