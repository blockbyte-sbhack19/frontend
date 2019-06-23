final String _keyLatitude = 'latitude';
final String _keyLongitude = 'altitude';
final String _keyLandSize = 'size';
final String _keyBeforeDate = 'beforeDate';
final String _keyAfterDate = 'afterDate';

class ResultDetails {
  final int latitude;
  final int longitude;
  final int landSize;
  final DateTime beforeDate;
  final DateTime afterDate;

  ResultDetails(
      {this.latitude,
      this.longitude,
      this.landSize,
      this.beforeDate,
      this.afterDate});

  factory ResultDetails.fromJson(Map<String, dynamic> json) {
    return ResultDetails(
      latitude: json[_keyLatitude],
      longitude: json[_keyLongitude],
      landSize: json[_keyLandSize],
      beforeDate: DateTime.fromMillisecondsSinceEpoch(json[_keyBeforeDate]),
      afterDate: DateTime.fromMillisecondsSinceEpoch(json[_keyAfterDate]),
    );
  }

  Map toJson() => {
        _keyLatitude: latitude,
        _keyLongitude: longitude,
        _keyLandSize: landSize,
        _keyBeforeDate: beforeDate.millisecondsSinceEpoch,
        _keyAfterDate: afterDate.millisecondsSinceEpoch,
      };
}
