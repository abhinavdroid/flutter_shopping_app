// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return _ShopItem.fromJson(json);
}

/// @nodoc
mixin _$ShopItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isGridView => throw _privateConstructorUsedError;
  bool get isAdded => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopItemCopyWith<ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemCopyWith<$Res> {
  factory $ShopItemCopyWith(ShopItem value, $Res Function(ShopItem) then) =
      _$ShopItemCopyWithImpl<$Res, ShopItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      num price,
      String imageUrl,
      bool isGridView,
      bool isAdded,
      int itemCount});
}

/// @nodoc
class _$ShopItemCopyWithImpl<$Res, $Val extends ShopItem>
    implements $ShopItemCopyWith<$Res> {
  _$ShopItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? isGridView = null,
    Object? isAdded = null,
    Object? itemCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isGridView: null == isGridView
          ? _value.isGridView
          : isGridView // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdded: null == isAdded
          ? _value.isAdded
          : isAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopItemImplCopyWith<$Res>
    implements $ShopItemCopyWith<$Res> {
  factory _$$ShopItemImplCopyWith(
          _$ShopItemImpl value, $Res Function(_$ShopItemImpl) then) =
      __$$ShopItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      num price,
      String imageUrl,
      bool isGridView,
      bool isAdded,
      int itemCount});
}

/// @nodoc
class __$$ShopItemImplCopyWithImpl<$Res>
    extends _$ShopItemCopyWithImpl<$Res, _$ShopItemImpl>
    implements _$$ShopItemImplCopyWith<$Res> {
  __$$ShopItemImplCopyWithImpl(
      _$ShopItemImpl _value, $Res Function(_$ShopItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? isGridView = null,
    Object? isAdded = null,
    Object? itemCount = null,
  }) {
    return _then(_$ShopItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isGridView: null == isGridView
          ? _value.isGridView
          : isGridView // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdded: null == isAdded
          ? _value.isAdded
          : isAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopItemImpl implements _ShopItem {
  _$ShopItemImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.isGridView,
      required this.isAdded,
      required this.itemCount});

  factory _$ShopItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopItemImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final num price;
  @override
  final String imageUrl;
  @override
  final bool isGridView;
  @override
  final bool isAdded;
  @override
  final int itemCount;

  @override
  String toString() {
    return 'ShopItem(id: $id, title: $title, description: $description, price: $price, imageUrl: $imageUrl, isGridView: $isGridView, isAdded: $isAdded, itemCount: $itemCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isGridView, isGridView) ||
                other.isGridView == isGridView) &&
            (identical(other.isAdded, isAdded) || other.isAdded == isAdded) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, price,
      imageUrl, isGridView, isAdded, itemCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      __$$ShopItemImplCopyWithImpl<_$ShopItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopItemImplToJson(
      this,
    );
  }
}

abstract class _ShopItem implements ShopItem {
  factory _ShopItem(
      {required final int id,
      required final String title,
      required final String description,
      required final num price,
      required final String imageUrl,
      required final bool isGridView,
      required final bool isAdded,
      required final int itemCount}) = _$ShopItemImpl;

  factory _ShopItem.fromJson(Map<String, dynamic> json) =
      _$ShopItemImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  num get price;
  @override
  String get imageUrl;
  @override
  bool get isGridView;
  @override
  bool get isAdded;
  @override
  int get itemCount;
  @override
  @JsonKey(ignore: true)
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
