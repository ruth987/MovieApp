import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [message, statusCode];

}

class ServerFailure extends Failure{
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerFailure exception)
      : this(message: exception.message, statusCode: exception.statusCode);

}
