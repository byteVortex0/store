// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllUsersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAllUsers,
    required TResult Function() searchForUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAllUsers,
    TResult? Function()? searchForUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAllUsers,
    TResult Function()? searchForUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsersEvent value) getAllUsers,
    required TResult Function(SearchForUsersEvent value) searchForUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsersEvent value)? getAllUsers,
    TResult? Function(SearchForUsersEvent value)? searchForUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsersEvent value)? getAllUsers,
    TResult Function(SearchForUsersEvent value)? searchForUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllUsersEventCopyWith<$Res> {
  factory $GetAllUsersEventCopyWith(
          GetAllUsersEvent value, $Res Function(GetAllUsersEvent) then) =
      _$GetAllUsersEventCopyWithImpl<$Res, GetAllUsersEvent>;
}

/// @nodoc
class _$GetAllUsersEventCopyWithImpl<$Res, $Val extends GetAllUsersEvent>
    implements $GetAllUsersEventCopyWith<$Res> {
  _$GetAllUsersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllUsersEvent
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
    extends _$GetAllUsersEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetAllUsersEvent.started()';
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
    required TResult Function(bool isNotLoading) getAllUsers,
    required TResult Function() searchForUsers,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAllUsers,
    TResult? Function()? searchForUsers,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAllUsers,
    TResult Function()? searchForUsers,
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
    required TResult Function(FetchAllUsersEvent value) getAllUsers,
    required TResult Function(SearchForUsersEvent value) searchForUsers,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsersEvent value)? getAllUsers,
    TResult? Function(SearchForUsersEvent value)? searchForUsers,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsersEvent value)? getAllUsers,
    TResult Function(SearchForUsersEvent value)? searchForUsers,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetAllUsersEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchAllUsersEventImplCopyWith<$Res> {
  factory _$$FetchAllUsersEventImplCopyWith(_$FetchAllUsersEventImpl value,
          $Res Function(_$FetchAllUsersEventImpl) then) =
      __$$FetchAllUsersEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isNotLoading});
}

/// @nodoc
class __$$FetchAllUsersEventImplCopyWithImpl<$Res>
    extends _$GetAllUsersEventCopyWithImpl<$Res, _$FetchAllUsersEventImpl>
    implements _$$FetchAllUsersEventImplCopyWith<$Res> {
  __$$FetchAllUsersEventImplCopyWithImpl(_$FetchAllUsersEventImpl _value,
      $Res Function(_$FetchAllUsersEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNotLoading = null,
  }) {
    return _then(_$FetchAllUsersEventImpl(
      isNotLoading: null == isNotLoading
          ? _value.isNotLoading
          : isNotLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchAllUsersEventImpl implements FetchAllUsersEvent {
  const _$FetchAllUsersEventImpl({required this.isNotLoading});

  @override
  final bool isNotLoading;

  @override
  String toString() {
    return 'GetAllUsersEvent.getAllUsers(isNotLoading: $isNotLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllUsersEventImpl &&
            (identical(other.isNotLoading, isNotLoading) ||
                other.isNotLoading == isNotLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNotLoading);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllUsersEventImplCopyWith<_$FetchAllUsersEventImpl> get copyWith =>
      __$$FetchAllUsersEventImplCopyWithImpl<_$FetchAllUsersEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAllUsers,
    required TResult Function() searchForUsers,
  }) {
    return getAllUsers(isNotLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAllUsers,
    TResult? Function()? searchForUsers,
  }) {
    return getAllUsers?.call(isNotLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAllUsers,
    TResult Function()? searchForUsers,
    required TResult orElse(),
  }) {
    if (getAllUsers != null) {
      return getAllUsers(isNotLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsersEvent value) getAllUsers,
    required TResult Function(SearchForUsersEvent value) searchForUsers,
  }) {
    return getAllUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsersEvent value)? getAllUsers,
    TResult? Function(SearchForUsersEvent value)? searchForUsers,
  }) {
    return getAllUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsersEvent value)? getAllUsers,
    TResult Function(SearchForUsersEvent value)? searchForUsers,
    required TResult orElse(),
  }) {
    if (getAllUsers != null) {
      return getAllUsers(this);
    }
    return orElse();
  }
}

abstract class FetchAllUsersEvent implements GetAllUsersEvent {
  const factory FetchAllUsersEvent({required final bool isNotLoading}) =
      _$FetchAllUsersEventImpl;

  bool get isNotLoading;

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllUsersEventImplCopyWith<_$FetchAllUsersEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchForUsersEventImplCopyWith<$Res> {
  factory _$$SearchForUsersEventImplCopyWith(_$SearchForUsersEventImpl value,
          $Res Function(_$SearchForUsersEventImpl) then) =
      __$$SearchForUsersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchForUsersEventImplCopyWithImpl<$Res>
    extends _$GetAllUsersEventCopyWithImpl<$Res, _$SearchForUsersEventImpl>
    implements _$$SearchForUsersEventImplCopyWith<$Res> {
  __$$SearchForUsersEventImplCopyWithImpl(_$SearchForUsersEventImpl _value,
      $Res Function(_$SearchForUsersEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchForUsersEventImpl implements SearchForUsersEvent {
  const _$SearchForUsersEventImpl();

  @override
  String toString() {
    return 'GetAllUsersEvent.searchForUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchForUsersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isNotLoading) getAllUsers,
    required TResult Function() searchForUsers,
  }) {
    return searchForUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isNotLoading)? getAllUsers,
    TResult? Function()? searchForUsers,
  }) {
    return searchForUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isNotLoading)? getAllUsers,
    TResult Function()? searchForUsers,
    required TResult orElse(),
  }) {
    if (searchForUsers != null) {
      return searchForUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchAllUsersEvent value) getAllUsers,
    required TResult Function(SearchForUsersEvent value) searchForUsers,
  }) {
    return searchForUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchAllUsersEvent value)? getAllUsers,
    TResult? Function(SearchForUsersEvent value)? searchForUsers,
  }) {
    return searchForUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchAllUsersEvent value)? getAllUsers,
    TResult Function(SearchForUsersEvent value)? searchForUsers,
    required TResult orElse(),
  }) {
    if (searchForUsers != null) {
      return searchForUsers(this);
    }
    return orElse();
  }
}

abstract class SearchForUsersEvent implements GetAllUsersEvent {
  const factory SearchForUsersEvent() = _$SearchForUsersEventImpl;
}

/// @nodoc
mixin _$GetAllUsersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetUsers> usersList) success,
    required TResult Function() empty,
    required TResult Function(List<GetUsers> searchList) search,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetUsers> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(List<GetUsers> searchList)? search,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetUsers> usersList)? success,
    TResult Function()? empty,
    TResult Function(List<GetUsers> searchList)? search,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_EmptyState value) empty,
    required TResult Function(_SearchState value) search,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_EmptyState value)? empty,
    TResult? Function(_SearchState value)? search,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_EmptyState value)? empty,
    TResult Function(_SearchState value)? search,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllUsersStateCopyWith<$Res> {
  factory $GetAllUsersStateCopyWith(
          GetAllUsersState value, $Res Function(GetAllUsersState) then) =
      _$GetAllUsersStateCopyWithImpl<$Res, GetAllUsersState>;
}

/// @nodoc
class _$GetAllUsersStateCopyWithImpl<$Res, $Val extends GetAllUsersState>
    implements $GetAllUsersStateCopyWith<$Res> {
  _$GetAllUsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'GetAllUsersState.loading()';
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
    required TResult Function() loading,
    required TResult Function(List<GetUsers> usersList) success,
    required TResult Function() empty,
    required TResult Function(List<GetUsers> searchList) search,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetUsers> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(List<GetUsers> searchList)? search,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetUsers> usersList)? success,
    TResult Function()? empty,
    TResult Function(List<GetUsers> searchList)? search,
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
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_EmptyState value) empty,
    required TResult Function(_SearchState value) search,
    required TResult Function(_ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_EmptyState value)? empty,
    TResult? Function(_SearchState value)? search,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_EmptyState value)? empty,
    TResult Function(_SearchState value)? search,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements GetAllUsersState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
          _$SuccessStateImpl value, $Res Function(_$SuccessStateImpl) then) =
      __$$SuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetUsers> usersList});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersList = null,
  }) {
    return _then(_$SuccessStateImpl(
      usersList: null == usersList
          ? _value._usersList
          : usersList // ignore: cast_nullable_to_non_nullable
              as List<GetUsers>,
    ));
  }
}

/// @nodoc

class _$SuccessStateImpl implements _SuccessState {
  const _$SuccessStateImpl({required final List<GetUsers> usersList})
      : _usersList = usersList;

  final List<GetUsers> _usersList;
  @override
  List<GetUsers> get usersList {
    if (_usersList is EqualUnmodifiableListView) return _usersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersList);
  }

  @override
  String toString() {
    return 'GetAllUsersState.success(usersList: $usersList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl &&
            const DeepCollectionEquality()
                .equals(other._usersList, _usersList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_usersList));

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<_$SuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetUsers> usersList) success,
    required TResult Function() empty,
    required TResult Function(List<GetUsers> searchList) search,
    required TResult Function(String error) error,
  }) {
    return success(usersList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetUsers> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(List<GetUsers> searchList)? search,
    TResult? Function(String error)? error,
  }) {
    return success?.call(usersList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetUsers> usersList)? success,
    TResult Function()? empty,
    TResult Function(List<GetUsers> searchList)? search,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(usersList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_EmptyState value) empty,
    required TResult Function(_SearchState value) search,
    required TResult Function(_ErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_EmptyState value)? empty,
    TResult? Function(_SearchState value)? search,
    TResult? Function(_ErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_EmptyState value)? empty,
    TResult Function(_SearchState value)? search,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessState implements GetAllUsersState {
  const factory _SuccessState({required final List<GetUsers> usersList}) =
      _$SuccessStateImpl;

  List<GetUsers> get usersList;

  /// Create a copy of GetAllUsersState
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
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$EmptyStateImpl>
    implements _$$EmptyStateImplCopyWith<$Res> {
  __$$EmptyStateImplCopyWithImpl(
      _$EmptyStateImpl _value, $Res Function(_$EmptyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyStateImpl implements _EmptyState {
  const _$EmptyStateImpl();

  @override
  String toString() {
    return 'GetAllUsersState.empty()';
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
    required TResult Function() loading,
    required TResult Function(List<GetUsers> usersList) success,
    required TResult Function() empty,
    required TResult Function(List<GetUsers> searchList) search,
    required TResult Function(String error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetUsers> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(List<GetUsers> searchList)? search,
    TResult? Function(String error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetUsers> usersList)? success,
    TResult Function()? empty,
    TResult Function(List<GetUsers> searchList)? search,
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
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_EmptyState value) empty,
    required TResult Function(_SearchState value) search,
    required TResult Function(_ErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_EmptyState value)? empty,
    TResult? Function(_SearchState value)? search,
    TResult? Function(_ErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_EmptyState value)? empty,
    TResult Function(_SearchState value)? search,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptyState implements GetAllUsersState {
  const factory _EmptyState() = _$EmptyStateImpl;
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetUsers> searchList});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchList = null,
  }) {
    return _then(_$SearchStateImpl(
      searchList: null == searchList
          ? _value._searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<GetUsers>,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl({required final List<GetUsers> searchList})
      : _searchList = searchList;

  final List<GetUsers> _searchList;
  @override
  List<GetUsers> get searchList {
    if (_searchList is EqualUnmodifiableListView) return _searchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchList);
  }

  @override
  String toString() {
    return 'GetAllUsersState.search(searchList: $searchList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchList, _searchList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchList));

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetUsers> usersList) success,
    required TResult Function() empty,
    required TResult Function(List<GetUsers> searchList) search,
    required TResult Function(String error) error,
  }) {
    return search(searchList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetUsers> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(List<GetUsers> searchList)? search,
    TResult? Function(String error)? error,
  }) {
    return search?.call(searchList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetUsers> usersList)? success,
    TResult Function()? empty,
    TResult Function(List<GetUsers> searchList)? search,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_EmptyState value) empty,
    required TResult Function(_SearchState value) search,
    required TResult Function(_ErrorState value) error,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_EmptyState value)? empty,
    TResult? Function(_SearchState value)? search,
    TResult? Function(_ErrorState value)? error,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_EmptyState value)? empty,
    TResult Function(_SearchState value)? search,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _SearchState implements GetAllUsersState {
  const factory _SearchState({required final List<GetUsers> searchList}) =
      _$SearchStateImpl;

  List<GetUsers> get searchList;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$GetAllUsersStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllUsersState
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

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetAllUsersState.error(error: $error)';
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

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetUsers> usersList) success,
    required TResult Function() empty,
    required TResult Function(List<GetUsers> searchList) search,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetUsers> usersList)? success,
    TResult? Function()? empty,
    TResult? Function(List<GetUsers> searchList)? search,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetUsers> usersList)? success,
    TResult Function()? empty,
    TResult Function(List<GetUsers> searchList)? search,
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
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_EmptyState value) empty,
    required TResult Function(_SearchState value) search,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_EmptyState value)? empty,
    TResult? Function(_SearchState value)? search,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_EmptyState value)? empty,
    TResult Function(_SearchState value)? search,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements GetAllUsersState {
  const factory _ErrorState({required final String error}) = _$ErrorStateImpl;

  String get error;

  /// Create a copy of GetAllUsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
