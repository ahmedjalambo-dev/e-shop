// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState<$T>()';
}


}

/// @nodoc
class $VerifyEmailStateCopyWith<T,$Res>  {
$VerifyEmailStateCopyWith(VerifyEmailState<T> _, $Res Function(VerifyEmailState<T>) __);
}


/// Adds pattern-matching-related methods to [VerifyEmailState].
extension VerifyEmailStatePatterns<T> on VerifyEmailState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( Loading<T> value)?  loading,TResult Function( Success<T> value)?  success,TResult Function( Failure<T> value)?  failure,TResult Function( ResendOtpSuccess<T> value)?  resendOtpSuccess,TResult Function( ResendOtpFailure<T> value)?  resendOtpFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case ResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess(_that);case ResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( Loading<T> value)  loading,required TResult Function( Success<T> value)  success,required TResult Function( Failure<T> value)  failure,required TResult Function( ResendOtpSuccess<T> value)  resendOtpSuccess,required TResult Function( ResendOtpFailure<T> value)  resendOtpFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Failure():
return failure(_that);case ResendOtpSuccess():
return resendOtpSuccess(_that);case ResendOtpFailure():
return resendOtpFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( Loading<T> value)?  loading,TResult? Function( Success<T> value)?  success,TResult? Function( Failure<T> value)?  failure,TResult? Function( ResendOtpSuccess<T> value)?  resendOtpSuccess,TResult? Function( ResendOtpFailure<T> value)?  resendOtpFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case ResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess(_that);case ResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( String message)?  failure,TResult Function( String message)?  resendOtpSuccess,TResult Function( String message)?  resendOtpFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.data);case Failure() when failure != null:
return failure(_that.message);case ResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess(_that.message);case ResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( String message)  failure,required TResult Function( String message)  resendOtpSuccess,required TResult Function( String message)  resendOtpFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.data);case Failure():
return failure(_that.message);case ResendOtpSuccess():
return resendOtpSuccess(_that.message);case ResendOtpFailure():
return resendOtpFailure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( String message)?  failure,TResult? Function( String message)?  resendOtpSuccess,TResult? Function( String message)?  resendOtpFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.data);case Failure() when failure != null:
return failure(_that.message);case ResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess(_that.message);case ResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements VerifyEmailState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState<$T>.initial()';
}


}




/// @nodoc


class Loading<T> implements VerifyEmailState<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState<$T>.loading()';
}


}




/// @nodoc


class Success<T> implements VerifyEmailState<T> {
  const Success(this.data);
  

 final  T data;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'VerifyEmailState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T,$Res> implements $VerifyEmailStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Success<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Failure<T> implements VerifyEmailState<T> {
  const Failure(this.message);
  

 final  String message;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<T, Failure<T>> get copyWith => _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerifyEmailState<$T>.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<T,$Res> implements $VerifyEmailStateCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<T,$Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResendOtpSuccess<T> implements VerifyEmailState<T> {
  const ResendOtpSuccess(this.message);
  

 final  String message;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendOtpSuccessCopyWith<T, ResendOtpSuccess<T>> get copyWith => _$ResendOtpSuccessCopyWithImpl<T, ResendOtpSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendOtpSuccess<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerifyEmailState<$T>.resendOtpSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResendOtpSuccessCopyWith<T,$Res> implements $VerifyEmailStateCopyWith<T, $Res> {
  factory $ResendOtpSuccessCopyWith(ResendOtpSuccess<T> value, $Res Function(ResendOtpSuccess<T>) _then) = _$ResendOtpSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResendOtpSuccessCopyWithImpl<T,$Res>
    implements $ResendOtpSuccessCopyWith<T, $Res> {
  _$ResendOtpSuccessCopyWithImpl(this._self, this._then);

  final ResendOtpSuccess<T> _self;
  final $Res Function(ResendOtpSuccess<T>) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResendOtpSuccess<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResendOtpFailure<T> implements VerifyEmailState<T> {
  const ResendOtpFailure(this.message);
  

 final  String message;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendOtpFailureCopyWith<T, ResendOtpFailure<T>> get copyWith => _$ResendOtpFailureCopyWithImpl<T, ResendOtpFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendOtpFailure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerifyEmailState<$T>.resendOtpFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResendOtpFailureCopyWith<T,$Res> implements $VerifyEmailStateCopyWith<T, $Res> {
  factory $ResendOtpFailureCopyWith(ResendOtpFailure<T> value, $Res Function(ResendOtpFailure<T>) _then) = _$ResendOtpFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResendOtpFailureCopyWithImpl<T,$Res>
    implements $ResendOtpFailureCopyWith<T, $Res> {
  _$ResendOtpFailureCopyWithImpl(this._self, this._then);

  final ResendOtpFailure<T> _self;
  final $Res Function(ResendOtpFailure<T>) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResendOtpFailure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
