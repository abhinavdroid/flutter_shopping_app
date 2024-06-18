import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_item.freezed.dart';
part 'shop_item.g.dart';

@freezed
class ShopItem with _$ShopItem {
  factory ShopItem({
    required int id,
    required String title,
    required String description,
    required num price,
    required String imageUrl,
    required bool isGridView,
    required bool isAdded,
    required int itemCount,
  }) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);
}
