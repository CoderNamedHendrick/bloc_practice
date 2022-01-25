part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState({required this.count});

  @override
  List<Object> get props => [count];

  Map<String, dynamic> toMap() {
    return {
      'count': count,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      count: map['count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
