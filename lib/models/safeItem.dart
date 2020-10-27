class SafeItem {
  final String password;
  final String description;

  SafeItem(this.password, this.description);

  SafeItem.fromJson(Map<String, dynamic> json)
      : password = json['password'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'description': description,
    };
  }
}

class EncryptedSafeItem {
  final password;
  final String description;

  EncryptedSafeItem(this.password, this.description);

  EncryptedSafeItem.fromJson(Map<String, dynamic> json)
      : password = json['password'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'description': description,
    };
  }
}
