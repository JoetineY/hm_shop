// 每一个轮播图的具体地址
class BannerItem {
  String id;
  String imgUrl;

  BannerItem({required this.id, required this.imgUrl});

  // 扩展一个工厂函数，一般用factory来声明
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    // 必须返回一个BannerItem对象
    return BannerItem(
      id: json["id"] ?? "",
      imgUrl: json["imgUrl"] ?? ""
    );
  }
}