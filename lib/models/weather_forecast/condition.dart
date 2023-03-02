import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition extends Equatable {
  final String? text;
  final String? icon;
  final int? code;

  const Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return _$ConditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  List<Object?> get props => [text, icon, code];
}
