part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counterValue;
  bool? wasIncremented;

  CounterState({required this.counterValue, this.wasIncremented});

  @override
  List<Object?> get props => [this.counterValue, this.wasIncremented];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue']?.toInt() ?? 0,
      wasIncremented: map['wasIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  String toString() =>
      'CounterState(counterValue: $counterValue, wasIncremented: $wasIncremented)';
}
