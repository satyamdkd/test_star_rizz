class ItemsModel {
  List<Items>? items;
  int? total;
  int? page;
  int? pages;

  ItemsModel({this.items, this.total, this.page, this.pages});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['pages'] = this.pages;
    return data;
  }
}

class Items {
  int? iD;
  String? createdAt;
  String? title;
  String? description;
  List<String>? pictures;
  int? authorId;
  Author? author;
  String? listingType;
  int? price;
  bool? isActive;
  String? endedAt;
  bool? isSold;
  int? viewCount;
  int? bidCount;
  String? status;
  String? lastUpdated;
  int? startingBid;
  int? highestBid;
  String? expirationDate;

  Items(
      {this.iD,
        this.createdAt,
        this.title,
        this.description,
        this.pictures,
        this.authorId,
        this.author,
        this.listingType,
        this.price,
        this.isActive,
        this.endedAt,
        this.isSold,
        this.viewCount,
        this.bidCount,
        this.status,
        this.lastUpdated,
        this.startingBid,
        this.highestBid,
        this.expirationDate});

  Items.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['createdAt'];
    title = json['title'];
    description = json['description'];
    pictures = json['pictures'].cast<String>();
    authorId = json['authorId'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    listingType = json['listingType'];
    price = json['price'];
    isActive = json['isActive'];
    endedAt = json['endedAt'];
    isSold = json['isSold'];
    viewCount = json['viewCount'];
    bidCount = json['bidCount'];
    status = json['status'];
    lastUpdated = json['lastUpdated'];
    startingBid = json['startingBid'];
    highestBid = json['highestBid'];
    expirationDate = json['expirationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['pictures'] = this.pictures;
    data['authorId'] = this.authorId;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['listingType'] = this.listingType;
    data['price'] = this.price;
    data['isActive'] = this.isActive;
    data['endedAt'] = this.endedAt;
    data['isSold'] = this.isSold;
    data['viewCount'] = this.viewCount;
    data['bidCount'] = this.bidCount;
    data['status'] = this.status;
    data['lastUpdated'] = this.lastUpdated;
    data['startingBid'] = this.startingBid;
    data['highestBid'] = this.highestBid;
    data['expirationDate'] = this.expirationDate;
    return data;
  }
}

class Author {
  int? iD;
  String? username;
  String? avatar;
  bool? isActive;
  String? provider;

  Author({this.iD, this.username, this.avatar, this.isActive, this.provider});

  Author.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    username = json['username'];
    avatar = json['avatar'];
    isActive = json['isActive'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['isActive'] = this.isActive;
    data['provider'] = this.provider;
    return data;
  }
}
