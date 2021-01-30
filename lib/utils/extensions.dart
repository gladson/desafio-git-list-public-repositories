extension StringValidatorExtension on String {
  bool get isNullOrEmpty => this == null || isEmpty;
  bool get isNotNullOrNoEmpty => this != null && isNotEmpty;
}
