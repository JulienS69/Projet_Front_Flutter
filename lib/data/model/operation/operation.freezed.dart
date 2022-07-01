// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return _Operation.fromJson(json);
}

/// @nodoc
mixin _$Operation {
  @JsonKey(name: 'Id_op')
  int? get idOperation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  String? get typeOperation => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateOp')
  String? get dateOperation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Montant')
  String? get montantOperation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Id_Cpt')
  int? get idCompte => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationCopyWith<Operation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationCopyWith<$Res> {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) then) =
      _$OperationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Id_op') int? idOperation,
      @JsonKey(name: 'Type') String? typeOperation,
      @JsonKey(name: 'DateOp') String? dateOperation,
      @JsonKey(name: 'Montant') String? montantOperation,
      @JsonKey(name: 'Id_Cpt') int? idCompte});
}

/// @nodoc
class _$OperationCopyWithImpl<$Res> implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._value, this._then);

  final Operation _value;
  // ignore: unused_field
  final $Res Function(Operation) _then;

  @override
  $Res call({
    Object? idOperation = freezed,
    Object? typeOperation = freezed,
    Object? dateOperation = freezed,
    Object? montantOperation = freezed,
    Object? idCompte = freezed,
  }) {
    return _then(_value.copyWith(
      idOperation: idOperation == freezed
          ? _value.idOperation
          : idOperation // ignore: cast_nullable_to_non_nullable
              as int?,
      typeOperation: typeOperation == freezed
          ? _value.typeOperation
          : typeOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOperation: dateOperation == freezed
          ? _value.dateOperation
          : dateOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      montantOperation: montantOperation == freezed
          ? _value.montantOperation
          : montantOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      idCompte: idCompte == freezed
          ? _value.idCompte
          : idCompte // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_OperationCopyWith<$Res> implements $OperationCopyWith<$Res> {
  factory _$$_OperationCopyWith(
          _$_Operation value, $Res Function(_$_Operation) then) =
      __$$_OperationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Id_op') int? idOperation,
      @JsonKey(name: 'Type') String? typeOperation,
      @JsonKey(name: 'DateOp') String? dateOperation,
      @JsonKey(name: 'Montant') String? montantOperation,
      @JsonKey(name: 'Id_Cpt') int? idCompte});
}

/// @nodoc
class __$$_OperationCopyWithImpl<$Res> extends _$OperationCopyWithImpl<$Res>
    implements _$$_OperationCopyWith<$Res> {
  __$$_OperationCopyWithImpl(
      _$_Operation _value, $Res Function(_$_Operation) _then)
      : super(_value, (v) => _then(v as _$_Operation));

  @override
  _$_Operation get _value => super._value as _$_Operation;

  @override
  $Res call({
    Object? idOperation = freezed,
    Object? typeOperation = freezed,
    Object? dateOperation = freezed,
    Object? montantOperation = freezed,
    Object? idCompte = freezed,
  }) {
    return _then(_$_Operation(
      idOperation: idOperation == freezed
          ? _value.idOperation
          : idOperation // ignore: cast_nullable_to_non_nullable
              as int?,
      typeOperation: typeOperation == freezed
          ? _value.typeOperation
          : typeOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOperation: dateOperation == freezed
          ? _value.dateOperation
          : dateOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      montantOperation: montantOperation == freezed
          ? _value.montantOperation
          : montantOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      idCompte: idCompte == freezed
          ? _value.idCompte
          : idCompte // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Operation implements _Operation {
  const _$_Operation(
      {@JsonKey(name: 'Id_op') this.idOperation,
      @JsonKey(name: 'Type') this.typeOperation,
      @JsonKey(name: 'DateOp') this.dateOperation,
      @JsonKey(name: 'Montant') this.montantOperation,
      @JsonKey(name: 'Id_Cpt') this.idCompte});

  factory _$_Operation.fromJson(Map<String, dynamic> json) =>
      _$$_OperationFromJson(json);

  @override
  @JsonKey(name: 'Id_op')
  final int? idOperation;
  @override
  @JsonKey(name: 'Type')
  final String? typeOperation;
  @override
  @JsonKey(name: 'DateOp')
  final String? dateOperation;
  @override
  @JsonKey(name: 'Montant')
  final String? montantOperation;
  @override
  @JsonKey(name: 'Id_Cpt')
  final int? idCompte;

  @override
  String toString() {
    return 'Operation(idOperation: $idOperation, typeOperation: $typeOperation, dateOperation: $dateOperation, montantOperation: $montantOperation, idCompte: $idCompte)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Operation &&
            const DeepCollectionEquality()
                .equals(other.idOperation, idOperation) &&
            const DeepCollectionEquality()
                .equals(other.typeOperation, typeOperation) &&
            const DeepCollectionEquality()
                .equals(other.dateOperation, dateOperation) &&
            const DeepCollectionEquality()
                .equals(other.montantOperation, montantOperation) &&
            const DeepCollectionEquality().equals(other.idCompte, idCompte));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idOperation),
      const DeepCollectionEquality().hash(typeOperation),
      const DeepCollectionEquality().hash(dateOperation),
      const DeepCollectionEquality().hash(montantOperation),
      const DeepCollectionEquality().hash(idCompte));

  @JsonKey(ignore: true)
  @override
  _$$_OperationCopyWith<_$_Operation> get copyWith =>
      __$$_OperationCopyWithImpl<_$_Operation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OperationToJson(this);
  }
}

abstract class _Operation implements Operation {
  const factory _Operation(
      {@JsonKey(name: 'Id_op') final int? idOperation,
      @JsonKey(name: 'Type') final String? typeOperation,
      @JsonKey(name: 'DateOp') final String? dateOperation,
      @JsonKey(name: 'Montant') final String? montantOperation,
      @JsonKey(name: 'Id_Cpt') final int? idCompte}) = _$_Operation;

  factory _Operation.fromJson(Map<String, dynamic> json) =
      _$_Operation.fromJson;

  @override
  @JsonKey(name: 'Id_op')
  int? get idOperation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Type')
  String? get typeOperation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'DateOp')
  String? get dateOperation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Montant')
  String? get montantOperation => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Id_Cpt')
  int? get idCompte => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OperationCopyWith<_$_Operation> get copyWith =>
      throw _privateConstructorUsedError;
}
