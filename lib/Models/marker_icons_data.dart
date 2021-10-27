class MarkerIconsData {
  MarkerIconsData({
    required this.mapPointA,
    required this.mapPointB,
    this.customer,
    this.activeCustomer,
  });

  final String mapPointA;
  final String mapPointB;
  final String? customer;
  final String? activeCustomer;
}
