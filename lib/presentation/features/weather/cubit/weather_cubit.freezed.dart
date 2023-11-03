// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetching,
    required TResult Function(FetchForecastResult forecastResult) fetched,
    required TResult Function(AppException appException) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetching,
    TResult? Function(FetchForecastResult forecastResult)? fetched,
    TResult? Function(AppException appException)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetching,
    TResult Function(FetchForecastResult forecastResult)? fetched,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitial value) init,
    required TResult Function(LoadingState value) fetching,
    required TResult Function(WeatherLoadedState value) fetched,
    required TResult Function(WeatherExceptionState value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherInitial value)? init,
    TResult? Function(LoadingState value)? fetching,
    TResult? Function(WeatherLoadedState value)? fetched,
    TResult? Function(WeatherExceptionState value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitial value)? init,
    TResult Function(LoadingState value)? fetching,
    TResult Function(WeatherLoadedState value)? fetched,
    TResult Function(WeatherExceptionState value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WeatherInitialImplCopyWith<$Res> {
  factory _$$WeatherInitialImplCopyWith(_$WeatherInitialImpl value,
          $Res Function(_$WeatherInitialImpl) then) =
      __$$WeatherInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeatherInitialImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherInitialImpl>
    implements _$$WeatherInitialImplCopyWith<$Res> {
  __$$WeatherInitialImplCopyWithImpl(
      _$WeatherInitialImpl _value, $Res Function(_$WeatherInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WeatherInitialImpl implements WeatherInitial {
  const _$WeatherInitialImpl();

  @override
  String toString() {
    return 'WeatherState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeatherInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetching,
    required TResult Function(FetchForecastResult forecastResult) fetched,
    required TResult Function(AppException appException) exception,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetching,
    TResult? Function(FetchForecastResult forecastResult)? fetched,
    TResult? Function(AppException appException)? exception,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetching,
    TResult Function(FetchForecastResult forecastResult)? fetched,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitial value) init,
    required TResult Function(LoadingState value) fetching,
    required TResult Function(WeatherLoadedState value) fetched,
    required TResult Function(WeatherExceptionState value) exception,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherInitial value)? init,
    TResult? Function(LoadingState value)? fetching,
    TResult? Function(WeatherLoadedState value)? fetched,
    TResult? Function(WeatherExceptionState value)? exception,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitial value)? init,
    TResult Function(LoadingState value)? fetching,
    TResult Function(WeatherLoadedState value)? fetched,
    TResult Function(WeatherExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class WeatherInitial implements WeatherState {
  const factory WeatherInitial() = _$WeatherInitialImpl;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'WeatherState.fetching()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetching,
    required TResult Function(FetchForecastResult forecastResult) fetched,
    required TResult Function(AppException appException) exception,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetching,
    TResult? Function(FetchForecastResult forecastResult)? fetched,
    TResult? Function(AppException appException)? exception,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetching,
    TResult Function(FetchForecastResult forecastResult)? fetched,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitial value) init,
    required TResult Function(LoadingState value) fetching,
    required TResult Function(WeatherLoadedState value) fetched,
    required TResult Function(WeatherExceptionState value) exception,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherInitial value)? init,
    TResult? Function(LoadingState value)? fetching,
    TResult? Function(WeatherLoadedState value)? fetched,
    TResult? Function(WeatherExceptionState value)? exception,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitial value)? init,
    TResult Function(LoadingState value)? fetching,
    TResult Function(WeatherLoadedState value)? fetched,
    TResult Function(WeatherExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements WeatherState {
  const factory LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$WeatherLoadedStateImplCopyWith<$Res> {
  factory _$$WeatherLoadedStateImplCopyWith(_$WeatherLoadedStateImpl value,
          $Res Function(_$WeatherLoadedStateImpl) then) =
      __$$WeatherLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FetchForecastResult forecastResult});
}

/// @nodoc
class __$$WeatherLoadedStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherLoadedStateImpl>
    implements _$$WeatherLoadedStateImplCopyWith<$Res> {
  __$$WeatherLoadedStateImplCopyWithImpl(_$WeatherLoadedStateImpl _value,
      $Res Function(_$WeatherLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forecastResult = null,
  }) {
    return _then(_$WeatherLoadedStateImpl(
      null == forecastResult
          ? _value.forecastResult
          : forecastResult // ignore: cast_nullable_to_non_nullable
              as FetchForecastResult,
    ));
  }
}

/// @nodoc

class _$WeatherLoadedStateImpl implements WeatherLoadedState {
  const _$WeatherLoadedStateImpl(this.forecastResult);

  @override
  final FetchForecastResult forecastResult;

  @override
  String toString() {
    return 'WeatherState.fetched(forecastResult: $forecastResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherLoadedStateImpl &&
            (identical(other.forecastResult, forecastResult) ||
                other.forecastResult == forecastResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forecastResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherLoadedStateImplCopyWith<_$WeatherLoadedStateImpl> get copyWith =>
      __$$WeatherLoadedStateImplCopyWithImpl<_$WeatherLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetching,
    required TResult Function(FetchForecastResult forecastResult) fetched,
    required TResult Function(AppException appException) exception,
  }) {
    return fetched(forecastResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetching,
    TResult? Function(FetchForecastResult forecastResult)? fetched,
    TResult? Function(AppException appException)? exception,
  }) {
    return fetched?.call(forecastResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetching,
    TResult Function(FetchForecastResult forecastResult)? fetched,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(forecastResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitial value) init,
    required TResult Function(LoadingState value) fetching,
    required TResult Function(WeatherLoadedState value) fetched,
    required TResult Function(WeatherExceptionState value) exception,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherInitial value)? init,
    TResult? Function(LoadingState value)? fetching,
    TResult? Function(WeatherLoadedState value)? fetched,
    TResult? Function(WeatherExceptionState value)? exception,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitial value)? init,
    TResult Function(LoadingState value)? fetching,
    TResult Function(WeatherLoadedState value)? fetched,
    TResult Function(WeatherExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class WeatherLoadedState implements WeatherState {
  const factory WeatherLoadedState(final FetchForecastResult forecastResult) =
      _$WeatherLoadedStateImpl;

  FetchForecastResult get forecastResult;
  @JsonKey(ignore: true)
  _$$WeatherLoadedStateImplCopyWith<_$WeatherLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeatherExceptionStateImplCopyWith<$Res> {
  factory _$$WeatherExceptionStateImplCopyWith(
          _$WeatherExceptionStateImpl value,
          $Res Function(_$WeatherExceptionStateImpl) then) =
      __$$WeatherExceptionStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException appException});
}

/// @nodoc
class __$$WeatherExceptionStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherExceptionStateImpl>
    implements _$$WeatherExceptionStateImplCopyWith<$Res> {
  __$$WeatherExceptionStateImplCopyWithImpl(_$WeatherExceptionStateImpl _value,
      $Res Function(_$WeatherExceptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appException = null,
  }) {
    return _then(_$WeatherExceptionStateImpl(
      null == appException
          ? _value.appException
          : appException // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$WeatherExceptionStateImpl implements WeatherExceptionState {
  const _$WeatherExceptionStateImpl(this.appException);

  @override
  final AppException appException;

  @override
  String toString() {
    return 'WeatherState.exception(appException: $appException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherExceptionStateImpl &&
            (identical(other.appException, appException) ||
                other.appException == appException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherExceptionStateImplCopyWith<_$WeatherExceptionStateImpl>
      get copyWith => __$$WeatherExceptionStateImplCopyWithImpl<
          _$WeatherExceptionStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() fetching,
    required TResult Function(FetchForecastResult forecastResult) fetched,
    required TResult Function(AppException appException) exception,
  }) {
    return exception(appException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? fetching,
    TResult? Function(FetchForecastResult forecastResult)? fetched,
    TResult? Function(AppException appException)? exception,
  }) {
    return exception?.call(appException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? fetching,
    TResult Function(FetchForecastResult forecastResult)? fetched,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(appException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitial value) init,
    required TResult Function(LoadingState value) fetching,
    required TResult Function(WeatherLoadedState value) fetched,
    required TResult Function(WeatherExceptionState value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherInitial value)? init,
    TResult? Function(LoadingState value)? fetching,
    TResult? Function(WeatherLoadedState value)? fetched,
    TResult? Function(WeatherExceptionState value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitial value)? init,
    TResult Function(LoadingState value)? fetching,
    TResult Function(WeatherLoadedState value)? fetched,
    TResult Function(WeatherExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class WeatherExceptionState implements WeatherState {
  const factory WeatherExceptionState(final AppException appException) =
      _$WeatherExceptionStateImpl;

  AppException get appException;
  @JsonKey(ignore: true)
  _$$WeatherExceptionStateImplCopyWith<_$WeatherExceptionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
