final String _keyId = "id";
final String _keyOwner = "owner";

class ResultLand {
  final String id;
  final String owner;

  ResultLand(
      {this.id,
      this.owner});

  factory ResultLand.fromJson(Map<String, dynamic> json) {
    return ResultLand(
      id: json[_keyId],
      owner: json[_keyOwner]
    );
  }

  Map toJson() => {
        _keyId: id,
        _keyOwner: owner,
      };
}
