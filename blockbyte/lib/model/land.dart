final String _keyCoordinate = 'coordinate';
final String _keyLandSize = 'landSize';
final String _keyLandPrice = 'landPrice';
final String _keyBeforeDate = 'before_date';
final String _keyAfterDate = 'after_date';

class Land {
  final List coordinate;
  final double landSize;
  final double landPrice;
  final DateTime beforeDate;
  final DateTime afterDate;

  Land(
      {this.coordinate,
      this.landSize,
      this.landPrice,
      this.beforeDate,
      this.afterDate});

  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
      coordinate: json[_keyCoordinate].split(','),
      landSize: json[_keyLandSize],
      landPrice: json[_keyLandPrice],
      beforeDate: DateTime.fromMillisecondsSinceEpoch(json[_keyBeforeDate]),
      afterDate: DateTime.fromMillisecondsSinceEpoch(json[_keyAfterDate]),
    );
  }

  Map toJson() => {
        _keyCoordinate: "$coordinate[0], $coordinate[1]",
        _keyLandSize: landSize,
        _keyLandPrice: landPrice,
        _keyBeforeDate: beforeDate.millisecondsSinceEpoch,
        _keyAfterDate: afterDate.millisecondsSinceEpoch
      };
}
