class ConfigModel {
  List<Language>? language;
  String? liveStreamingEngine;
  String? liveStreamingAppID;
  String? liveStreamingAppSign;

  ConfigModel({
    this.language,
    this.liveStreamingEngine,
    this.liveStreamingAppID,
    this.liveStreamingAppSign,
  });

  ConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(Language.fromJson(v));
      });
    }
    liveStreamingEngine = json['live_streaming_engine'];
    liveStreamingAppID = json['live_streaming_app_id'];
    liveStreamingAppSign = json['live_streaming_app_sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (language != null) {
      data['language'] = language!.map((v) => v.toJson()).toList();
    }
    data['live_streaming_engine'] = liveStreamingEngine;
    data['live_streaming_app_id'] = liveStreamingAppID;
    data['live_streaming_app_sign'] = liveStreamingAppSign;
    return data;
  }
}

class Language {
  String? key;
  String? value;

  Language({this.key, this.value});

  Language.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
