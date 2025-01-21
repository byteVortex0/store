// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_for_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchForProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title) searchForProductsbyTitle,
    required TResult Function(SearchRequestBody body) searchForProductsbyPrice,
    required TResult Function() resetSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title)? searchForProductsbyTitle,
    TResult? Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult? Function()? resetSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title)? searchForProductsbyTitle,
    TResult Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult Function()? resetSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FilterProductsByTitleEvent value)
        searchForProductsbyTitle,
    required TResult Function(FilterProductsByPriceEvent value)
        searchForProductsbyPrice,
    required TResult Function(ResetSearchEvent value) resetSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult? Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult? Function(ResetSearchEvent value)? resetSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult Function(ResetSearchEvent value)? resetSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchForProductsEventCopyWith<$Res> {
  factory $SearchForProductsEventCopyWith(SearchForProductsEvent value,
          $Res Function(SearchForProductsEvent) then) =
      _$SearchForProductsEventCopyWithImpl<$Res, SearchForProductsEvent>;
}

/// @nodoc
class _$SearchForProductsEventCopyWithImpl<$Res,
        $Val extends SearchForProductsEvent>
    implements $SearchForProductsEventCopyWith<$Res> {
  _$SearchForProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SearchForProductsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SearchForProductsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title) searchForProductsbyTitle,
    required TResult Function(SearchRequestBody body) searchForProductsbyPrice,
    required TResult Function() resetSearch,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title)? searchForProductsbyTitle,
    TResult? Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult? Function()? resetSearch,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title)? searchForProductsbyTitle,
    TResult Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult Function()? resetSearch,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FilterProductsByTitleEvent value)
        searchForProductsbyTitle,
    required TResult Function(FilterProductsByPriceEvent value)
        searchForProductsbyPrice,
    required TResult Function(ResetSearchEvent value) resetSearch,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult? Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult? Function(ResetSearchEvent value)? resetSearch,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult Function(ResetSearchEvent value)? resetSearch,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchForProductsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FilterProductsByTitleEventImplCopyWith<$Res> {
  factory _$$FilterProductsByTitleEventImplCopyWith(
          _$FilterProductsByTitleEventImpl value,
          $Res Function(_$FilterProductsByTitleEventImpl) then) =
      __$$FilterProductsByTitleEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$FilterProductsByTitleEventImplCopyWithImpl<$Res>
    extends _$SearchForProductsEventCopyWithImpl<$Res,
        _$FilterProductsByTitleEventImpl>
    implements _$$FilterProductsByTitleEventImplCopyWith<$Res> {
  __$$FilterProductsByTitleEventImplCopyWithImpl(
      _$FilterProductsByTitleEventImpl _value,
      $Res Function(_$FilterProductsByTitleEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$FilterProductsByTitleEventImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterProductsByTitleEventImpl implements FilterProductsByTitleEvent {
  const _$FilterProductsByTitleEventImpl({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'SearchForProductsEvent.searchForProductsbyTitle(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterProductsByTitleEventImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterProductsByTitleEventImplCopyWith<_$FilterProductsByTitleEventImpl>
      get copyWith => __$$FilterProductsByTitleEventImplCopyWithImpl<
          _$FilterProductsByTitleEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title) searchForProductsbyTitle,
    required TResult Function(SearchRequestBody body) searchForProductsbyPrice,
    required TResult Function() resetSearch,
  }) {
    return searchForProductsbyTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title)? searchForProductsbyTitle,
    TResult? Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult? Function()? resetSearch,
  }) {
    return searchForProductsbyTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title)? searchForProductsbyTitle,
    TResult Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult Function()? resetSearch,
    required TResult orElse(),
  }) {
    if (searchForProductsbyTitle != null) {
      return searchForProductsbyTitle(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FilterProductsByTitleEvent value)
        searchForProductsbyTitle,
    required TResult Function(FilterProductsByPriceEvent value)
        searchForProductsbyPrice,
    required TResult Function(ResetSearchEvent value) resetSearch,
  }) {
    return searchForProductsbyTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult? Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult? Function(ResetSearchEvent value)? resetSearch,
  }) {
    return searchForProductsbyTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult Function(ResetSearchEvent value)? resetSearch,
    required TResult orElse(),
  }) {
    if (searchForProductsbyTitle != null) {
      return searchForProductsbyTitle(this);
    }
    return orElse();
  }
}

abstract class FilterProductsByTitleEvent implements SearchForProductsEvent {
  const factory FilterProductsByTitleEvent({required final String title}) =
      _$FilterProductsByTitleEventImpl;

  String get title;

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterProductsByTitleEventImplCopyWith<_$FilterProductsByTitleEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterProductsByPriceEventImplCopyWith<$Res> {
  factory _$$FilterProductsByPriceEventImplCopyWith(
          _$FilterProductsByPriceEventImpl value,
          $Res Function(_$FilterProductsByPriceEventImpl) then) =
      __$$FilterProductsByPriceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchRequestBody body});
}

/// @nodoc
class __$$FilterProductsByPriceEventImplCopyWithImpl<$Res>
    extends _$SearchForProductsEventCopyWithImpl<$Res,
        _$FilterProductsByPriceEventImpl>
    implements _$$FilterProductsByPriceEventImplCopyWith<$Res> {
  __$$FilterProductsByPriceEventImplCopyWithImpl(
      _$FilterProductsByPriceEventImpl _value,
      $Res Function(_$FilterProductsByPriceEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$FilterProductsByPriceEventImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as SearchRequestBody,
    ));
  }
}

/// @nodoc

class _$FilterProductsByPriceEventImpl implements FilterProductsByPriceEvent {
  const _$FilterProductsByPriceEventImpl({required this.body});

  @override
  final SearchRequestBody body;

  @override
  String toString() {
    return 'SearchForProductsEvent.searchForProductsbyPrice(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterProductsByPriceEventImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterProductsByPriceEventImplCopyWith<_$FilterProductsByPriceEventImpl>
      get copyWith => __$$FilterProductsByPriceEventImplCopyWithImpl<
          _$FilterProductsByPriceEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title) searchForProductsbyTitle,
    required TResult Function(SearchRequestBody body) searchForProductsbyPrice,
    required TResult Function() resetSearch,
  }) {
    return searchForProductsbyPrice(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title)? searchForProductsbyTitle,
    TResult? Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult? Function()? resetSearch,
  }) {
    return searchForProductsbyPrice?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title)? searchForProductsbyTitle,
    TResult Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult Function()? resetSearch,
    required TResult orElse(),
  }) {
    if (searchForProductsbyPrice != null) {
      return searchForProductsbyPrice(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FilterProductsByTitleEvent value)
        searchForProductsbyTitle,
    required TResult Function(FilterProductsByPriceEvent value)
        searchForProductsbyPrice,
    required TResult Function(ResetSearchEvent value) resetSearch,
  }) {
    return searchForProductsbyPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult? Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult? Function(ResetSearchEvent value)? resetSearch,
  }) {
    return searchForProductsbyPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult Function(ResetSearchEvent value)? resetSearch,
    required TResult orElse(),
  }) {
    if (searchForProductsbyPrice != null) {
      return searchForProductsbyPrice(this);
    }
    return orElse();
  }
}

abstract class FilterProductsByPriceEvent implements SearchForProductsEvent {
  const factory FilterProductsByPriceEvent(
          {required final SearchRequestBody body}) =
      _$FilterProductsByPriceEventImpl;

  SearchRequestBody get body;

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterProductsByPriceEventImplCopyWith<_$FilterProductsByPriceEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetSearchEventImplCopyWith<$Res> {
  factory _$$ResetSearchEventImplCopyWith(_$ResetSearchEventImpl value,
          $Res Function(_$ResetSearchEventImpl) then) =
      __$$ResetSearchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetSearchEventImplCopyWithImpl<$Res>
    extends _$SearchForProductsEventCopyWithImpl<$Res, _$ResetSearchEventImpl>
    implements _$$ResetSearchEventImplCopyWith<$Res> {
  __$$ResetSearchEventImplCopyWithImpl(_$ResetSearchEventImpl _value,
      $Res Function(_$ResetSearchEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetSearchEventImpl implements ResetSearchEvent {
  const _$ResetSearchEventImpl();

  @override
  String toString() {
    return 'SearchForProductsEvent.resetSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetSearchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title) searchForProductsbyTitle,
    required TResult Function(SearchRequestBody body) searchForProductsbyPrice,
    required TResult Function() resetSearch,
  }) {
    return resetSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title)? searchForProductsbyTitle,
    TResult? Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult? Function()? resetSearch,
  }) {
    return resetSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title)? searchForProductsbyTitle,
    TResult Function(SearchRequestBody body)? searchForProductsbyPrice,
    TResult Function()? resetSearch,
    required TResult orElse(),
  }) {
    if (resetSearch != null) {
      return resetSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FilterProductsByTitleEvent value)
        searchForProductsbyTitle,
    required TResult Function(FilterProductsByPriceEvent value)
        searchForProductsbyPrice,
    required TResult Function(ResetSearchEvent value) resetSearch,
  }) {
    return resetSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult? Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult? Function(ResetSearchEvent value)? resetSearch,
  }) {
    return resetSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FilterProductsByTitleEvent value)?
        searchForProductsbyTitle,
    TResult Function(FilterProductsByPriceEvent value)?
        searchForProductsbyPrice,
    TResult Function(ResetSearchEvent value)? resetSearch,
    required TResult orElse(),
  }) {
    if (resetSearch != null) {
      return resetSearch(this);
    }
    return orElse();
  }
}

abstract class ResetSearchEvent implements SearchForProductsEvent {
  const factory ResetSearchEvent() = _$ResetSearchEventImpl;
}

/// @nodoc
mixin _$SearchForProductsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GetAllProducts> data) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GetAllProducts> data)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GetAllProducts> data)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchForProductsStateCopyWith<$Res> {
  factory $SearchForProductsStateCopyWith(SearchForProductsState value,
          $Res Function(SearchForProductsState) then) =
      _$SearchForProductsStateCopyWithImpl<$Res, SearchForProductsState>;
}

/// @nodoc
class _$SearchForProductsStateCopyWithImpl<$Res,
        $Val extends SearchForProductsState>
    implements $SearchForProductsStateCopyWith<$Res> {
  _$SearchForProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$SearchForProductsStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialStateImpl implements InitialState {
  const _$InitialStateImpl();

  @override
  String toString() {
    return 'SearchForProductsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GetAllProducts> data) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GetAllProducts> data)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GetAllProducts> data)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements SearchForProductsState {
  const factory InitialState() = _$InitialStateImpl;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$SearchForProductsStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'SearchForProductsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GetAllProducts> data) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GetAllProducts> data)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GetAllProducts> data)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements SearchForProductsState {
  const factory LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
          _$SuccessStateImpl value, $Res Function(_$SuccessStateImpl) then) =
      __$$SuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetAllProducts> data});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$SearchForProductsStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetAllProducts>,
    ));
  }
}

/// @nodoc

class _$SuccessStateImpl implements SuccessState {
  const _$SuccessStateImpl({required final List<GetAllProducts> data})
      : _data = data;

  final List<GetAllProducts> _data;
  @override
  List<GetAllProducts> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchForProductsState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<_$SuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GetAllProducts> data) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GetAllProducts> data)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GetAllProducts> data)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements SearchForProductsState {
  const factory SuccessState({required final List<GetAllProducts> data}) =
      _$SuccessStateImpl;

  List<GetAllProducts> get data;

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyStateImplCopyWith<$Res> {
  factory _$$EmptyStateImplCopyWith(
          _$EmptyStateImpl value, $Res Function(_$EmptyStateImpl) then) =
      __$$EmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyStateImplCopyWithImpl<$Res>
    extends _$SearchForProductsStateCopyWithImpl<$Res, _$EmptyStateImpl>
    implements _$$EmptyStateImplCopyWith<$Res> {
  __$$EmptyStateImplCopyWithImpl(
      _$EmptyStateImpl _value, $Res Function(_$EmptyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyStateImpl implements EmptyState {
  const _$EmptyStateImpl();

  @override
  String toString() {
    return 'SearchForProductsState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GetAllProducts> data) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GetAllProducts> data)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GetAllProducts> data)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyState implements SearchForProductsState {
  const factory EmptyState() = _$EmptyStateImpl;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$SearchForProductsStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements ErrorState {
  const _$ErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchForProductsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GetAllProducts> data) success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GetAllProducts> data)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GetAllProducts> data)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(EmptyState value) empty,
    required TResult Function(ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(EmptyState value)? empty,
    TResult? Function(ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(EmptyState value)? empty,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements SearchForProductsState {
  const factory ErrorState({required final String error}) = _$ErrorStateImpl;

  String get error;

  /// Create a copy of SearchForProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
