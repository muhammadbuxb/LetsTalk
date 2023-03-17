class UserModel {
  dynamic name, email, password, isActive, friend,photo;
 
  UserModel(
      {this.name,
      this.email,
      this.friend,
      this.isActive,
      this.photo
      
      });

  factory UserModel.fromJson(data) => UserModel(
      email: data['email'],
      name: data['name'],
      photo:data['photo'],
      isActive: data['isActive'],
      friend: data['friend'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email.toString().toLowerCase(),
        'photo':photo,
        'isActive': isActive,
        'friend': friend ?? [],
       
      };

}
