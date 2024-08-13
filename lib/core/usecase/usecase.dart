import 'package:movie_app/core/util/typedef.dart';



abstract class UsecaseWithParams<Type, Params>{
  const UsecaseWithParams();
  ResultFuture<Type> call(Params Params);

}

abstract class UsecaseWithoutParams<Type>{
  const UsecaseWithoutParams();

  ResultFuture<Type> call();


}


