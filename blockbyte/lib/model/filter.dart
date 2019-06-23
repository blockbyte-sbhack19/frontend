final String _keyMinPrice = 'minPrice';
final String _keyMaxPrice = 'maxPrice';
final String _keybioStandard = 'bioStandard';
final String _keyTypeOfCrop = 'typeOfCrop';
final String _keyBeforeDate = 'beforeDate';
final String _keyAfterDate = 'afterDate';

class Filter {
  final int minPrice;
  final int maxPrice;
  final List bioStandard;
  final List typeOfCrop;
  final DateTime beforeDate;
  final DateTime afterDate;

  Filter(
      {this.minPrice,
      this.maxPrice,
      this.bioStandard,
      this.typeOfCrop,
      this.beforeDate,
      this.afterDate});

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      minPrice: json[_keyMinPrice],
      maxPrice: json[_keyMaxPrice],
      bioStandard: json[_keybioStandard],
      typeOfCrop: json[_keyTypeOfCrop],
      beforeDate: DateTime.fromMillisecondsSinceEpoch(json[_keyBeforeDate]),
      afterDate: DateTime.fromMillisecondsSinceEpoch(json[_keyAfterDate]),
    );
  }

  Map toJson() => {
        _keyMinPrice: minPrice,
        _keyMaxPrice: maxPrice,
        _keybioStandard: bioStandard,
        _keyTypeOfCrop: typeOfCrop,
        _keyBeforeDate: beforeDate.millisecondsSinceEpoch,
        _keyAfterDate: afterDate.millisecondsSinceEpoch
      };
}
