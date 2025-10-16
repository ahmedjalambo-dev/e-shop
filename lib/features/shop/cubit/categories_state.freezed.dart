// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CategoriesLoading value)?  categoriesLoading,TResult Function( CategoriesSuccess value)?  categoriesSuccess,TResult Function( CategoriesFailure value)?  categoriesFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading(_that);case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that);case CategoriesFailure() when categoriesFailure != null:
return categoriesFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CategoriesLoading value)  categoriesLoading,required TResult Function( CategoriesSuccess value)  categoriesSuccess,required TResult Function( CategoriesFailure value)  categoriesFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CategoriesLoading():
return categoriesLoading(_that);case CategoriesSuccess():
return categoriesSuccess(_that);case CategoriesFailure():
return categoriesFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CategoriesLoading value)?  categoriesLoading,TResult? Function( CategoriesSuccess value)?  categoriesSuccess,TResult? Function( CategoriesFailure value)?  categoriesFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading(_that);case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that);case CategoriesFailure() when categoriesFailure != null:
return categoriesFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  categoriesLoading,TResult Function( CategoriesResponse categoriesResponse)?  categoriesSuccess,TResult Function( ErrorHandler errorHandler)?  categoriesFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading();case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that.categoriesResponse);case CategoriesFailure() when categoriesFailure != null:
return categoriesFailure(_that.errorHandler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  categoriesLoading,required TResult Function( CategoriesResponse categoriesResponse)  categoriesSuccess,required TResult Function( ErrorHandler errorHandler)  categoriesFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CategoriesLoading():
return categoriesLoading();case CategoriesSuccess():
return categoriesSuccess(_that.categoriesResponse);case CategoriesFailure():
return categoriesFailure(_that.errorHandler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  categoriesLoading,TResult? Function( CategoriesResponse categoriesResponse)?  categoriesSuccess,TResult? Function( ErrorHandler errorHandler)?  categoriesFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CategoriesLoading() when categoriesLoading != null:
return categoriesLoading();case CategoriesSuccess() when categoriesSuccess != null:
return categoriesSuccess(_that.categoriesResponse);case CategoriesFailure() when categoriesFailure != null:
return categoriesFailure(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoriesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.initial()';
}


}




/// @nodoc


class CategoriesLoading implements CategoriesState {
  const CategoriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.categoriesLoading()';
}


}




/// @nodoc


class CategoriesSuccess implements CategoriesState {
  const CategoriesSuccess(this.categoriesResponse);
  

 final  CategoriesResponse categoriesResponse;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesSuccessCopyWith<CategoriesSuccess> get copyWith => _$CategoriesSuccessCopyWithImpl<CategoriesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesSuccess&&(identical(other.categoriesResponse, categoriesResponse) || other.categoriesResponse == categoriesResponse));
}


@override
int get hashCode => Object.hash(runtimeType,categoriesResponse);

@override
String toString() {
  return 'CategoriesState.categoriesSuccess(categoriesResponse: $categoriesResponse)';
}


}

/// @nodoc
abstract mixin class $CategoriesSuccessCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesSuccessCopyWith(CategoriesSuccess value, $Res Function(CategoriesSuccess) _then) = _$CategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 CategoriesResponse categoriesResponse
});




}
/// @nodoc
class _$CategoriesSuccessCopyWithImpl<$Res>
    implements $CategoriesSuccessCopyWith<$Res> {
  _$CategoriesSuccessCopyWithImpl(this._self, this._then);

  final CategoriesSuccess _self;
  final $Res Function(CategoriesSuccess) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoriesResponse = null,}) {
  return _then(CategoriesSuccess(
null == categoriesResponse ? _self.categoriesResponse : categoriesResponse // ignore: cast_nullable_to_non_nullable
as CategoriesResponse,
  ));
}


}

/// @nodoc


class CategoriesFailure implements CategoriesState {
  const CategoriesFailure(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesFailureCopyWith<CategoriesFailure> get copyWith => _$CategoriesFailureCopyWithImpl<CategoriesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesFailure&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'CategoriesState.categoriesFailure(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $CategoriesFailureCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesFailureCopyWith(CategoriesFailure value, $Res Function(CategoriesFailure) _then) = _$CategoriesFailureCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$CategoriesFailureCopyWithImpl<$Res>
    implements $CategoriesFailureCopyWith<$Res> {
  _$CategoriesFailureCopyWithImpl(this._self, this._then);

  final CategoriesFailure _self;
  final $Res Function(CategoriesFailure) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(CategoriesFailure(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
