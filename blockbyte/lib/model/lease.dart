final String _keyFinalPrice = 'finalPrice';
final String _keybioStandard = 'bioStandard';
final String _keyTypeOfCrop = 'typeOfCrop';
final String _keyBeforeDate = 'beforeDate';
final String _keyAfterDate = 'afterDate';
final String _keyId = "landId";
final String _keyOwner = "landOwner";

class Lease {
  final String id;
  final String owner;
  final String bioStandard;
  final String typeOfCrop;
  final DateTime beforeDate;
  final DateTime afterDate;
  final int finalPrice;

  Lease(
      {this.id,
      this.owner,
      this.bioStandard,
      this.typeOfCrop,
      this.beforeDate,
      this.afterDate,
      this.finalPrice
      });

  factory Lease.fromJson(Map<String, dynamic> json) {
    return Lease(
      id: json[_keyId],
      owner: json[_keyOwner],
      bioStandard: json[_keybioStandard],
      typeOfCrop: json[_keyTypeOfCrop],
      beforeDate: DateTime.fromMillisecondsSinceEpoch(json[_keyBeforeDate]),
      afterDate: DateTime.fromMillisecondsSinceEpoch(json[_keyAfterDate]),
      finalPrice: json[_keyFinalPrice],
    );
  }

  Map toJson() => {
        _keyId: id,
        _keyOwner: owner,
        _keybioStandard: bioStandard,
        _keyTypeOfCrop: typeOfCrop,
        _keyBeforeDate: beforeDate.millisecondsSinceEpoch,
        _keyAfterDate: afterDate.millisecondsSinceEpoch,
        _keyFinalPrice: finalPrice,
      };
}
