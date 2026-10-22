class UtcDateRange {
  final DateTime start;
  final DateTime end;
  UtcDateRange(DateTime start, DateTime end, {DateTime? now})
    : start = DateTime.utc(start.year, start.month, start.day),
      end = DateTime.utc(end.year, end.month, end.day) {
    final today = (now ?? DateTime.now()).toUtc();
    if (this.end.isBefore(this.start) ||
        this.end.difference(this.start).inDays >= 90 ||
        this.end.isAfter(DateTime.utc(today.year, today.month, today.day))) {
      throw ArgumentError(
        'Choose an inclusive UTC range of 1–90 days, without future dates',
      );
    }
  }
  factory UtcDateRange.recent({DateTime? now}) {
    final t = (now ?? DateTime.now()).toUtc();
    final end = DateTime.utc(t.year, t.month, t.day);
    return UtcDateRange(end.subtract(const Duration(days: 29)), end, now: t);
  }
  Map<String, dynamic> get query => {
    'start_date': day(start),
    'end_date': day(end),
  };
  static String day(DateTime d) => d.toIso8601String().substring(0, 10);
  @override
  String toString() => '${day(start)} – ${day(end)} UTC';
}
