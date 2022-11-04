import 'package:code_of_federal_regulations/src/regulation_unit.dart';
import 'package:code_of_federal_regulations/src/unit_change_operation.dart';
import 'package:diff_match_patch/diff_match_patch.dart';

class UnitChange {
  RegulationUnit? src;
  RegulationUnit? dst;
  List<Diff> changes;

  UnitChangeOperation get operation {
    if (src != null && dst != null) {
      return UnitChangeOperation.modification;
    } else if (src != null) {
      return UnitChangeOperation.deletion;
    } else if (dst != null) {
      return UnitChangeOperation.addition;
    }
    throw FormatException("Unrecognized operation by UnitChange object state");
  }

  UnitChange(this.src, this.dst, this.changes);

  UnitChange.fromAddition(this.dst): src = null, changes = List.empty();

  UnitChange.fromDeletion(this.src): dst = null, changes = List.empty();
}