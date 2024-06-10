class NotFoundException implements Exception {
  late final String message;

  NotFoundException({required this.message});
}