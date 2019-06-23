final String _keyLandPrice = 'landPrice';
final String _keyFeeForStandard = 'feeForStandard';
final String _keyFeeForCrop = 'feeForCrop';


class ResultLease {
  final int landPrice;
  final Map feeForStandard;
  final Map feeForCrop;


  ResultLease(
      {
      this.landPrice,
      this.feeForStandard,
      this.feeForCrop,
      });

  factory ResultLease.fromJson(Map<String, dynamic> json) {
    return ResultLease(
      landPrice: json[_keyLandPrice],
      feeForStandard: Map.from(json[_keyFeeForStandard]),
      feeForCrop: Map.from(json[_keyFeeForCrop]),
    );
  }

  Map toJson() => {
        _keyLandPrice: landPrice,
        _keyFeeForStandard: feeForStandard,
        _keyFeeForCrop: feeForCrop,
      };
}
