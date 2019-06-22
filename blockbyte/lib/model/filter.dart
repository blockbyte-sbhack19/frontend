final String _keyMinPrice = 'minPrice';
final String _keyMaxPrice = 'maxPrice';
final String _keyFeeForStandard = 'feeForStandard';
final String _keyFeeForCrop = 'feeForCrop';
final String _keyBeforeDate = 'beforeDate';
final String _keyAfterDate = 'afterDate';

class Filter {
  final int minPrice;
  final int maxPrice;
  final Map feeForStandard;
  final Map feeForCrop;
  final DateTime beforeDate;
  final DateTime afterDate;

  Filter(
      {this.minPrice,
      this.maxPrice,
      this.feeForStandard,
      this.feeForCrop,
      this.beforeDate,
      this.afterDate});

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      minPrice: json[_keyMinPrice],
      maxPrice: json[_keyMaxPrice],
      feeForStandard: Map.from(json[_keyFeeForStandard]),
      feeForCrop: Map.from(json[_keyFeeForCrop]),
      beforeDate: DateTime.fromMillisecondsSinceEpoch(json[_keyBeforeDate]),
      afterDate: DateTime.fromMillisecondsSinceEpoch(json[_keyAfterDate]),
    );
  }

  Map toJson() => {
        _keyMinPrice: minPrice,
        _keyMaxPrice: maxPrice,
        _keyFeeForStandard: feeForStandard,
        _keyFeeForCrop: feeForCrop,
        _keyBeforeDate: beforeDate.millisecondsSinceEpoch,
        _keyAfterDate: afterDate.millisecondsSinceEpoch
      };
}
