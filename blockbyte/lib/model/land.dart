final String _keyLocation = 'location';
final String _keyAnimal = 'animal';
final String _keyPesticide = 'pesticide';
final String _keyHeavyMachine = 'heavyMachine';
final String _keySize = 'size';
final String _keyPrice = 'price';
final String _keyBeforeDate = 'before_date';
final String _keyAfterDate = 'after_date';

class Land {
  final String location;
  final bool animal;
  final bool pesticide;
  final bool heavyMachine;
  final double size;
  final double price;
  // final DateTime beforeDate;
  // final DateTime afterDate;
  final String beforeDate;
  final String afterDate;

  Land(
      {this.location,
      this.animal,
      this.pesticide,
      this.heavyMachine,
      this.size,
      this.price,
      this.beforeDate,
      this.afterDate});

  factory Land.fromJson(Map<String, dynamic> json) {
    return Land(
      location: json[_keyLocation],
      animal: json[_keyAnimal],
      pesticide: json[_keyPesticide],
      heavyMachine: json[_keyHeavyMachine],
      size: json[_keySize],
      price: json[_keyPrice],
      // beforeDate: DateTime.parse(json['before_date']),
      // afterDate: DateTime.parse(json['after_date']),
      beforeDate: json[_keyBeforeDate],
      afterDate: json[_keyAfterDate],
    );
  }

  Map toJson() => {
        _keyLocation: location,
        _keyAnimal: animal,
        _keyPesticide: pesticide,
        _keyHeavyMachine: heavyMachine,
        _keySize: size,
        _keyPrice: price,
        _keyBeforeDate: beforeDate,
        _keyAfterDate: afterDate
      };
}
