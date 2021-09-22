/// Equivalent of [BloodType]
/// from [HealthKitReporter] https://cocoapods.org/pods/HealthKitReporter
///
/// Supports [String] description extension [Description]
/// for available cases
///
/// Has a factory method [from]
/// Creating from [String]
///
enum BloodType {
  notSet,
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  oPositive,
  oNegative,
}

extension Description on BloodType {
  String get description {
    switch (this) {
      case BloodType.notSet:
        return 'na';
      case BloodType.aPositive:
        return 'A+';
      case BloodType.aNegative:
        return 'A-';
      case BloodType.bPositive:
        return 'B+';
      case BloodType.bNegative:
        return 'B-';
      case BloodType.abPositive:
        return 'AB+';
      case BloodType.abNegative:
        return 'AB-';
      case BloodType.oPositive:
        return 'O+';
      case BloodType.oNegative:
        return 'O-';
    }
  }
}

extension BloodTypeFactory on BloodType {
  static BloodType? from(String? description) {
    switch (description) {
      case 'na':
        return BloodType.notSet;
      case 'A+':
        return BloodType.abPositive;
      case 'A-':
        return BloodType.aNegative;
      case 'B+':
        return BloodType.bPositive;
      case 'B-':
        return BloodType.bNegative;
      case 'AB+':
        return BloodType.abPositive;
      case 'AB-':
        return BloodType.abNegative;
      case 'O+':
        return BloodType.oPositive;
      case 'O-':
        return BloodType.oNegative;
      default:
        return null;
    }
  }
}
