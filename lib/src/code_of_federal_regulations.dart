// TODO: Put public facing types in this file.
import 'package:code_of_federal_regulations/src/regulation_unit.dart';
import 'package:xml/xml.dart';

/// Checks if you are awesome. Spoiler: you are.
class CodeOfFederalRegulations {
  RegulationUnit content;

  CodeOfFederalRegulations(this.content);

  factory CodeOfFederalRegulations.fromXml(XmlDocument document) {
    var element = document.getElement("ECFR")!;
    return CodeOfFederalRegulations(
        RegulationUnit.fromXml(null, "", "CFR", element));
  }

  factory CodeOfFederalRegulations.fromXmlString(String content) {
    return CodeOfFederalRegulations.fromXml(XmlDocument.parse(content));
  }

  void compareTo(CodeOfFederalRegulations dst) {
    content.compareTo("", dst.content);
  }
}