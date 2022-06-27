import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation.freezed.dart';
part 'operation.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Operation with _$Operation {
  const factory Operation({
    @JsonKey(name: 'Id_Op') required String idOperation,
    @JsonKey(name: 'Tyoe') String? typeOperation,
    @JsonKey(name: 'Date_Op') String? dateOperation,
    @JsonKey(name: 'Montant') String? montantOperation,
    @JsonKey(name: 'Id_Compte') String? idCompte,
  }) = _Operation;

  factory Operation.empty() {
    return Operation(
      idOperation: "",
    );
  }

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);
}

extension OnOperation on Operation {}

extension OnOperationJson on Map<String, dynamic> {
  Operation get toOperation {
    return Operation.fromJson(this);
  }
}

extension OnListOperationJson on List<Map<String, dynamic>> {
  List<Operation> get toOperation {
    return map<Operation>((Map<String, dynamic> e) => e.toOperation).toList();
  }
}
