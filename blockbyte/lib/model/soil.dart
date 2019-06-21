class Soil {
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

  Soil(
      {this.location,
      this.animal,
      this.pesticide,
      this.heavyMachine,
      this.size,
      this.price,
      this.beforeDate,
      this.afterDate});

  factory Soil.fromJson(Map<String, dynamic> json) {
    return Soil(
      location: json['location'],
      animal: json['animal'],
      pesticide: json['pesticide'],
      heavyMachine: json['heavyMachine'],
      size: json['size'],
      price: json['price'],
      // beforeDate: DateTime.parse(json['before_date']),
      // afterDate: DateTime.parse(json['after_date']),
      beforeDate: json['before_date'],
      afterDate: json['after_date'],
    );
  }
}
