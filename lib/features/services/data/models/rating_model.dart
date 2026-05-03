class RatingSummary {
  final double average;
  final int totalReviews;
  final Map<int, double> distribution;

  RatingSummary({
    required this.average,
    required this.totalReviews,
    required this.distribution,
  });
}