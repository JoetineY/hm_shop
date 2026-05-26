// 特惠推荐数据结构
class SpecialRecommendResult {
  String id;
  String title;
  List<SubType> subTypes;

  SpecialRecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommendResult.fromJSON(Map<String, dynamic> json) {
    return SpecialRecommendResult(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      subTypes: (json["subTypes"] as List? ?? [])
          .map((item) => SubType.fromJSON(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJSON(Map<String, dynamic> json) {
    return SubType(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      goodsItems: GoodsItems.fromJSON(
        json["goodsItems"] as Map<String, dynamic>,
      ),
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items
  });

  factory GoodsItems.fromJSON(Map<String, dynamic> json) {
    return GoodsItems(
      counts: int.tryParse(json["counts"]?.toString() ?? "0") ?? 0,
      pageSize: int.tryParse(json["pageSize"]?.toString() ?? "0") ?? 0,
      pages: int.tryParse(json["pages"]?.toString() ?? "0") ?? 0,
      page: int.tryParse(json["page"]?.toString() ?? "0") ?? 0,
      items: (json["items"] as List? ?? [])
          .map((item) => GoodsItem.fromJSON(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String desc;
  String price;
  String picture;
  int orderNum;
  
  GoodsItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      desc: json["desc"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
    );
  }
}
