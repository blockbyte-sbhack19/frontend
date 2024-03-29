final String _keyLatitude = 'latitude';
final String _keyLongitude = 'altitude';
final String _keyLandSize = 'landSize';
final String _keyLandPrice = 'landPrice';
final String _keyFeeForStandard = 'feeForStandard';
final String _keyFeeForCrop = 'feeForCrop';
final String _keyBeforeDate = 'beforeDate';
final String _keyAfterDate = 'afterDate';
final String _keyInsurance = 'insurance';

class Land {
  final int latitude;
  final int longitude;
  final double landSize;
  final int landPrice;
  final Map feeForStandard;
  final Map feeForCrop;
  final DateTime beforeDate;
  final DateTime afterDate;
  final bool insurance;

  Land(
      {this.latitude,
      this.longitude,
      this.landSize,
      this.landPrice,
      this.feeForStandard,
      this.feeForCrop,
      this.beforeDate,
      this.afterDate,
      this.insurance});

  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
      latitude: json[_keyLatitude],
      longitude: json[_keyLongitude],
      landSize: json[_keyLandSize],
      landPrice: json[_keyLandPrice],
      feeForStandard: Map.from(json[_keyFeeForStandard]),
      feeForCrop: Map.from(json[_keyFeeForCrop]),
      beforeDate: DateTime.fromMillisecondsSinceEpoch(json[_keyBeforeDate]),
      afterDate: DateTime.fromMillisecondsSinceEpoch(json[_keyAfterDate]),
      insurance: json[_keyInsurance]
    );
  }

  Map toJson() => {
        _keyLatitude: latitude,
        _keyLongitude: longitude,
        _keyLandSize: landSize,
        _keyLandPrice: landPrice,
        _keyFeeForStandard: feeForStandard,
        _keyFeeForCrop: feeForCrop,
        _keyBeforeDate: beforeDate.millisecondsSinceEpoch,
        _keyAfterDate: afterDate.millisecondsSinceEpoch,
        _keyInsurance: insurance
      };
}
