class UserModel {
  final String uid;
  final String email;
  final String username;
  final String profilePic;
  final String nickname;
  final String spirituallyEnergies;
  final String speciality;
  final String favoriteCompany;
  final String mostUpsetMe;
  final String remarks;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.profilePic,
    required this.nickname,
    required this.spirituallyEnergies,
    required this.speciality,
    required this.favoriteCompany,
    required this.mostUpsetMe,
    required this.remarks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'profilePic': profilePic,
      'nickname': nickname,
      'spirituallyEnergies': spirituallyEnergies,
      'speciality': speciality,
      'favoriteCompany': favoriteCompany,
      'mostUpsetMe': mostUpsetMe,
      'remarks': remarks,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['\$id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      profilePic: map['profilePic'] as String,
      nickname: map['nickname'] as String,
      spirituallyEnergies: map['spirituallyEnergies'] as String,
      speciality: map['speciality'] as String,
      favoriteCompany: map['favoriteCompany'] as String,
      mostUpsetMe: map['mostUpsetMe'] as String,
      remarks: map['remarks'] as String,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, username: $username, profilePic: $profilePic, nickname: $nickname, spirituallyEnergies: $spirituallyEnergies, speciality: $speciality, favoriteCompany: $favoriteCompany, mostUpsetMe: $mostUpsetMe, remarks: $remarks)';
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? username,
    String? profilePic,
    String? nickname,
    String? spirituallyEnergies,
    String? speciality,
    String? favoriteCompany,
    String? mostUpsetMe,
    String? remarks,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      nickname: nickname ?? this.nickname,
      spirituallyEnergies: spirituallyEnergies ?? this.spirituallyEnergies,
      speciality: speciality ?? this.speciality,
      favoriteCompany: favoriteCompany ?? this.favoriteCompany,
      mostUpsetMe: mostUpsetMe ?? this.mostUpsetMe,
      remarks: remarks ?? this.remarks,
    );
  }
}
