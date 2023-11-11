// To parse this JSON data, do
//
//     final crypto = cryptoFromJson(jsonString);

import 'dart:convert';

Crypto cryptoFromJson(String str) => Crypto.fromJson(json.decode(str));

String cryptoToJson(Crypto data) => json.encode(data.toJson());

class Crypto {
  final Status status;
  final List<Datum> data;

  Crypto({
    required this.status,
    required this.data,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        status: Status.fromJson(json["status"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int numMarketPairs;
  final DateTime dateAdded;
  final List<String> tags;
  final int? maxSupply;
  final double circulatingSupply;
  final double totalSupply;
  final bool infiniteSupply;
  final Platform? platform;
  final int cmcRank;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final dynamic tvlRatio;
  final DateTime lastUpdated;
  final Quote quote;

  Datum({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.infiniteSupply,
    required this.platform,
    required this.cmcRank,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedMarketCap,
    required this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        infiniteSupply: json["infinite_supply"],
        platform: json["platform"] == null
            ? null
            : Platform.fromJson(json["platform"]),
        cmcRank: json["cmc_rank"],
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        tvlRatio: json["tvl_ratio"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "infinite_supply": infiniteSupply,
        "platform": platform?.toJson(),
        "cmc_rank": cmcRank,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "tvl_ratio": tvlRatio,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
      };
}

class Platform {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final String tokenAddress;

  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        tokenAddress: json["token_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "token_address": tokenAddress,
      };
}

class Quote {
  final Usd usd;

  Quote({
    required this.usd,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class Usd {
  final double price;
  final double volume24H;
  final double volumeChange24H;
  final double percentChange1H;
  final double percentChange24H;
  final double percentChange7D;
  final double percentChange30D;
  final double percentChange60D;
  final double percentChange90D;
  final double marketCap;
  final double marketCapDominance;
  final double fullyDilutedMarketCap;
  final dynamic tvl;
  final DateTime lastUpdated;

  Usd({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    required this.percentChange30D,
    required this.percentChange60D,
    required this.percentChange90D,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.tvl,
    required this.lastUpdated,
  });

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"]?.toDouble(),
        volume24H: json["volume_24h"]?.toDouble(),
        volumeChange24H: json["volume_change_24h"]?.toDouble(),
        percentChange1H: json["percent_change_1h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
        percentChange7D: json["percent_change_7d"]?.toDouble(),
        percentChange30D: json["percent_change_30d"]?.toDouble(),
        percentChange60D: json["percent_change_60d"]?.toDouble(),
        percentChange90D: json["percent_change_90d"]?.toDouble(),
        marketCap: json["market_cap"]?.toDouble(),
        marketCapDominance: json["market_cap_dominance"]?.toDouble(),
        fullyDilutedMarketCap: json["fully_diluted_market_cap"]?.toDouble(),
        tvl: json["tvl"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "percent_change_30d": percentChange30D,
        "percent_change_60d": percentChange60D,
        "percent_change_90d": percentChange90D,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "fully_diluted_market_cap": fullyDilutedMarketCap,
        "tvl": tvl,
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Status {
  final DateTime timestamp;
  final int errorCode;
  final dynamic errorMessage;
  final int elapsed;
  final int creditCount;
  final dynamic notice;
  final int totalCount;

  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
    required this.totalCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
        "total_count": totalCount,
      };
}
