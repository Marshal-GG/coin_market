// To parse this JSON data, do
//
//     final metadata = metadataFromJson(jsonString);

import 'dart:convert';

Metadata metadataFromJson(String str) => Metadata.fromJson(json.decode(str));

String metadataToJson(Metadata data) => json.encode(data.toJson());

class Metadata {
  final Data data;

  Metadata({
    required this.data,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final The1 the1;

  Data({
    required this.the1,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        the1: The1.fromJson(json["1"]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
      };
}

class The1 {
  final int id;
  final String name;
  final String symbol;
  final String category;
  final String description;
  final String slug;
  final String logo;
  final String subreddit;
  final String notice;
  final List<String> tags;
  final List<String> tagNames;
  final List<TagGroup> tagGroups;
  final Urls urls;
  final dynamic platform;
  final DateTime dateAdded;
  final String twitterUsername;
  final int isHidden;
  final DateTime dateLaunched;
  final List<dynamic> contractAddress;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedTags;
  final dynamic selfReportedMarketCap;
  final bool infiniteSupply;

  The1({
    required this.id,
    required this.name,
    required this.symbol,
    required this.category,
    required this.description,
    required this.slug,
    required this.logo,
    required this.subreddit,
    required this.notice,
    required this.tags,
    required this.tagNames,
    required this.tagGroups,
    required this.urls,
    required this.platform,
    required this.dateAdded,
    required this.twitterUsername,
    required this.isHidden,
    required this.dateLaunched,
    required this.contractAddress,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedTags,
    required this.selfReportedMarketCap,
    required this.infiniteSupply,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        category: json["category"],
        description: json["description"],
        slug: json["slug"],
        logo: json["logo"],
        subreddit: json["subreddit"],
        notice: json["notice"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        tagNames: List<String>.from(json["tag-names"].map((x) => x)),
        tagGroups: List<TagGroup>.from(
            json["tag-groups"].map((x) => tagGroupValues.map[x]!)),
        urls: Urls.fromJson(json["urls"]),
        platform: json["platform"],
        dateAdded: DateTime.parse(json["date_added"]),
        twitterUsername: json["twitter_username"],
        isHidden: json["is_hidden"],
        dateLaunched: DateTime.parse(json["date_launched"]),
        contractAddress:
            List<dynamic>.from(json["contract_address"].map((x) => x)),
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedTags: json["self_reported_tags"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        infiniteSupply: json["infinite_supply"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "category": category,
        "description": description,
        "slug": slug,
        "logo": logo,
        "subreddit": subreddit,
        "notice": notice,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "tag-names": List<dynamic>.from(tagNames.map((x) => x)),
        "tag-groups":
            List<dynamic>.from(tagGroups.map((x) => tagGroupValues.reverse[x])),
        "urls": urls.toJson(),
        "platform": platform,
        "date_added": dateAdded.toIso8601String(),
        "twitter_username": twitterUsername,
        "is_hidden": isHidden,
        "date_launched": dateLaunched.toIso8601String(),
        "contract_address": List<dynamic>.from(contractAddress.map((x) => x)),
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_tags": selfReportedTags,
        "self_reported_market_cap": selfReportedMarketCap,
        "infinite_supply": infiniteSupply,
      };
}

enum TagGroup { ALGORITHM, CATEGORY, OTHERS, PLATFORM }

final tagGroupValues = EnumValues({
  "ALGORITHM": TagGroup.ALGORITHM,
  "CATEGORY": TagGroup.CATEGORY,
  "OTHERS": TagGroup.OTHERS,
  "PLATFORM": TagGroup.PLATFORM
});

class Urls {
  final List<String> website;
  final List<dynamic> twitter;
  final List<String> messageBoard;
  final List<dynamic> chat;
  final List<dynamic> facebook;
  final List<String> explorer;
  final List<String> reddit;
  final List<String> technicalDoc;
  final List<String> sourceCode;
  final List<dynamic> announcement;

  Urls({
    required this.website,
    required this.twitter,
    required this.messageBoard,
    required this.chat,
    required this.facebook,
    required this.explorer,
    required this.reddit,
    required this.technicalDoc,
    required this.sourceCode,
    required this.announcement,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        website: List<String>.from(json["website"].map((x) => x)),
        twitter: List<dynamic>.from(json["twitter"].map((x) => x)),
        messageBoard: List<String>.from(json["message_board"].map((x) => x)),
        chat: List<dynamic>.from(json["chat"].map((x) => x)),
        facebook: List<dynamic>.from(json["facebook"].map((x) => x)),
        explorer: List<String>.from(json["explorer"].map((x) => x)),
        reddit: List<String>.from(json["reddit"].map((x) => x)),
        technicalDoc: List<String>.from(json["technical_doc"].map((x) => x)),
        sourceCode: List<String>.from(json["source_code"].map((x) => x)),
        announcement: List<dynamic>.from(json["announcement"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "website": List<dynamic>.from(website.map((x) => x)),
        "twitter": List<dynamic>.from(twitter.map((x) => x)),
        "message_board": List<dynamic>.from(messageBoard.map((x) => x)),
        "chat": List<dynamic>.from(chat.map((x) => x)),
        "facebook": List<dynamic>.from(facebook.map((x) => x)),
        "explorer": List<dynamic>.from(explorer.map((x) => x)),
        "reddit": List<dynamic>.from(reddit.map((x) => x)),
        "technical_doc": List<dynamic>.from(technicalDoc.map((x) => x)),
        "source_code": List<dynamic>.from(sourceCode.map((x) => x)),
        "announcement": List<dynamic>.from(announcement.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
