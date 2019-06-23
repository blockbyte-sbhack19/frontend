import 'package:blockbyte/model/result/result_land.dart';
import 'package:blockbyte/model/result/result_lease.dart';
import 'package:blockbyte/model/result/result_details.dart';

final String _keyLand = "land";
final String _keyLease = "lease";
final String _keyDetails = "details";

class ResultLandAll {
  final ResultLand land;
  final ResultLease lease;
  final ResultDetails details;

  ResultLandAll(
      {this.land,
      this.lease,
      this.details});

  factory ResultLandAll.fromJson(Map<String, dynamic> json) {
    return ResultLandAll(
      land: ResultLand.fromJson(json[_keyLand]),
      lease: ResultLease.fromJson(json[_keyLease]),
      details: ResultDetails.fromJson(json[_keyDetails])
    );
  }

  Map toJson() => {
        _keyLand: land.toJson(),
        _keyLease: lease.toJson(),
        _keyDetails: details.toJson(),
      };
}
