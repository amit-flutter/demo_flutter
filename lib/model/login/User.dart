class User {
  User({
      this.userId, 
      this.cmpLogo, 
      this.profileImage, 
      this.fullName, 
      this.cmpName, 
      this.cmpId, 
      this.contactNo, 
      this.userName, 
      this.password, 
      this.roleId, 
      this.status, 
      this.deviceId, 
      this.deviceType, 
      this.fcmToken, 
      this.createdBy, 
      this.createdTimeDate, 
      this.updatedBy, 
      this.updatedTimeDate, 
      this.deleteData, 
      this.isTrial, 
      this.trialDate,});

  User.fromJson(dynamic json) {
    userId = json['user_id'];
    cmpLogo = json['cmp_logo'];
    profileImage = json['profile_image'];
    fullName = json['full_name'];
    cmpName = json['cmpName'];
    cmpId = json['cmp_id'];
    contactNo = json['contactNo'];
    userName = json['user_name'];
    password = json['password'];
    roleId = json['role_id'];
    status = json['status'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    fcmToken = json['fcm_token'];
    createdBy = json['created_by'];
    createdTimeDate = json['created_time_date'];
    updatedBy = json['updated_by'];
    updatedTimeDate = json['updated_time_date'];
    deleteData = json['delete_data'];
    isTrial = json['is_trial'];
    trialDate = json['trial_date'];
  }
  int? userId;
  String? cmpLogo;
  dynamic? profileImage;
  String? fullName;
  String? cmpName;
  int? cmpId;
  int? contactNo;
  String? userName;
  String? password;
  int? roleId;
  int? status;
  String? deviceId;
  String? deviceType;
  String? fcmToken;
  String? createdBy;
  String? createdTimeDate;
  dynamic updatedBy;
  dynamic updatedTimeDate;
  int? deleteData;
  int? isTrial;
  String? trialDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['cmp_logo'] = cmpLogo;
    map['profile_image'] = profileImage;
    map['full_name'] = fullName;
    map['cmpName'] = cmpName;
    map['cmp_id'] = cmpId;
    map['contactNo'] = contactNo;
    map['user_name'] = userName;
    map['password'] = password;
    map['role_id'] = roleId;
    map['status'] = status;
    map['device_id'] = deviceId;
    map['device_type'] = deviceType;
    map['fcm_token'] = fcmToken;
    map['created_by'] = createdBy;
    map['created_time_date'] = createdTimeDate;
    map['updated_by'] = updatedBy;
    map['updated_time_date'] = updatedTimeDate;
    map['delete_data'] = deleteData;
    map['is_trial'] = isTrial;
    map['trial_date'] = trialDate;
    return map;
  }

}