import 'package:blockbyte/model/result/result_land_all.dart';

final String _keyLands = "lands";

// Example result
//
// {
//   "lands": [
//     {
//       "land": {
//         "id": "4ece190e-2c1e-4f10-9cc1-65934a549619",
//         "owner": "O=Lender, L=London, C=GB"
//       },
//       "lease": {
//         "landPrice": 100,
//         "feeForStandard": {
//           "UNKNOWN": 1000
//         },
//         "feeForCrop": {
//           "UNKNOWN": 1000
//         }
//       },
//       "details": {
//         "latitude": 1000,
//         "altitude": 1000,
//         "size": 1000,
//         "beforeDate": 123445565,
//         "afterDate": 123456789
//       }
//     },
//     {
//       "land": {
//         "id": "90dccff8-89ac-4bc4-a61d-3497709713c4",
//         "owner": "O=Lender, L=London, C=GB"
//       },
//       "lease": {
//         "landPrice": 2000,
//         "feeForStandard": {
//           "UNKNOWN": 1000
//         },
//         "feeForCrop": {
//           "UNKNOWN": 1000
//         }
//       },
//       "details": {
//         "latitude": 40,
//         "altitude": 40,
//         "size": 1000,
//         "beforeDate": 123445565,
//         "afterDate": 123456789
//       }
//     }
// }

class Result {
  final List<ResultLandAll> lands;

  Result({this.lands});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      lands: json[_keyLands]
          .map<ResultLandAll>((land) => ResultLandAll.fromJson(land))
          .toList(),
    );
  }

  Map toJson() => {
        _keyLands: lands,
      };
}
