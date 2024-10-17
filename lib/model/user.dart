class UserModel {
  String uid;
  String name;
  String email;
  String role;
  bool checkedIn;
  bool checkedOut;
  double curGoal;
  String cropType;
  double incentive;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.checkedIn,
    required this.checkedOut,
    required this.curGoal,
    required this.cropType,
    required this.incentive,
  });
}
