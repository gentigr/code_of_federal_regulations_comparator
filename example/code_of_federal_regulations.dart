import 'package:code_of_federal_regulations/src/code_of_federal_regulations.dart';
import 'package:xml/xml.dart';

import 'dart:io';
import 'dart:async';

void main() async {
  Future<CodeOfFederalRegulations> ecfr20220916 = File('/tmp/title-14-at-2022-09-16.xml').readAsString().then((String contents) {
    return parse(contents);
  });
  Future<CodeOfFederalRegulations> ecfr20221017 = File('/tmp/title-14-at-2022-10-17.xml').readAsString().then((String contents) {
    return parse(contents);
  });
  (await ecfr20220916).compareTo(await ecfr20221017);
}

String getRequiredAttr(XmlElement element, String name) {
  String? attribute = element.getAttribute(name);
  if (attribute == null) {
    throw XmlParserException("${element.name} must have '$name' attribute");
  }
  return attribute;
}


CodeOfFederalRegulations parse(String content) {
  var ecfr = CodeOfFederalRegulations.fromXmlString(content);
  print(ecfr.content.units[0].toString().substring(0, 50));
  return ecfr;
}