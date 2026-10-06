enum PlaceType {
  shoppingMall('Shopping Mall', 'Stores, food courts, parking'),
  hospital('Hospital', 'Wards, clinics, emergency'),
  university('University', 'Lecture halls, labs, library'),
  airport('Airport', 'Terminals, gates, lounges'),
  office('Office Building', 'Rooms, meeting areas, desks'),
  museum('Museum', 'Galleries, exhibits, facilities'),
  other('Other', 'Any other indoor space');

  const PlaceType(this.label, this.description);

  final String label;
  final String description;
}

class SetupConfig {
  const SetupConfig({
    this.place,
    this.minArea = 500,
    this.averageArea = 2500,
    this.maxArea = 5000,
    this.floors = 1,
  });

  final PlaceType? place;

  /// Coverage area per floor, in square metres.
  final double minArea;
  final double averageArea;
  final double maxArea;

  final int floors;

  SetupConfig copyWith({
    PlaceType? place,
    double? minArea,
    double? averageArea,
    double? maxArea,
    int? floors,
  }) {
    return SetupConfig(
      place: place ?? this.place,
      minArea: minArea ?? this.minArea,
      averageArea: averageArea ?? this.averageArea,
      maxArea: maxArea ?? this.maxArea,
      floors: floors ?? this.floors,
    );
  }
}
