
import 'dart:convert';

ModelsBola modelsBolaFromJson(String str) => ModelsBola.fromJson(json.decode(str));

String modelsBolaToJson(ModelsBola data) => json.encode(data.toJson());

class ModelsBola {
    final List<Map<String, String?>> teams;

    ModelsBola({
        required this.teams,
    });

    factory ModelsBola.fromJson(Map<String, dynamic> json) => ModelsBola(
        teams: List<Map<String, String?>>.from(json["teams"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
