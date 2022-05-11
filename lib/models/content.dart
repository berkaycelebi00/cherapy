class ContentList {
  List<ContentModel>? contents;

  ContentList({this.contents});

  ContentList.fromJson(Map<String, dynamic> json) {
    if (json['contents'] != null) {
      contents = <ContentModel>[];
      json['contents'].forEach((v) {
        contents!.add(new ContentModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentModel {
  int? id;
  int? author;
  String? title;
  String? content;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  ContentModel(
      {this.id,
      this.author,
      this.title,
      this.content,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  ContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    title = json['title'];
    content = json['content'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author'] = this.author;
    data['title'] = this.title;
    data['content'] = this.content;
    data['imageUrl'] = this.imageUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
