import 'dart:convert';
import 'dart:ffi';

class User {
  final String uid;
  final String username;
  final String email;
  Array groups;

  User({
    this.uid,
    this.username,
    this.email,
    // this.groups,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'groups': [],
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      // groups: map['groups'] ?? '',
    );
  }
}
