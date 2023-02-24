//all constant string which are used in app are define here.
class StringConst {
  //Image Path String
  static const String kLogo = 'assets/logo.png';

  //Sign Up Screen
  static const String kSignUp = 'Sign Up';
  static const String kSignIn = ' Sign In';
  static const String kSignUpSubtitle = 'Please enter your details below to\nsign up now!';
  static const String kFamilies = 'Families';
  static const String kProviders = 'Providers';
  static const String kPleaseEnter = 'Please enter';

  static const String kFirstName = 'First Name';
  static const String kLastName = 'Last Name';
  static const String kEmailAddress = 'Email Address';
  static const String kValidEmailAddress = 'a valid email address';
  static const String kMobileNumber = 'Mobile Number';
  static const String kValidMobileNumber = '10 Digit phone number';
  static const String kPassword = 'Password';
  static const String kValidPassword = 'Password contains at least 8 characters,\n1 lowercase(a-z) & 1 Upper case(A-Z)'
      ', \n1 number (0-9) or a symbol (!,@,#,\$,%,&)';
  static const String kConfirmPassword = 'Confirm Password';
  static const String kValidConfirmPassword = 'The password entered doesn\'t match';

  static const String kIndicatesMandatoryField = '* Indicates Mandatory Field';
  static const String kHaveAnAccount = 'Have an account?';

  static const String kSuccess = 'Success';

  //home screen
  static const String kPleaseDefine = 'Please define your available dates\nand times.';
  static const String kManageAvailability = 'Manage Availability';
  static const String kMonday = 'Monday';

  static const List<String> timeslots = [
    "9:00-9:30 AM",
    "9:30-10:00 AM",
    "10:00-10:30 AM",
    "10:30-11:00 AM",
    "11:00-11:30 AM",
    "11:30-12:00 AM",
    "12:00-12:30 AM",
    "12:30-1:00 AM",
    "1:00-1:30 AM",
    "1:30-2:00 AM",
    "2:00-2:30 AM",
    "2:30-3:00 AM"
  ];

  static const daysName = [
    ['Monday'],
    ['Tuesday'],
    ['Wednesday'],
    ['Thursday'],
    ['Friday'],
    ['Saturday'],
    ['Sunday']
  ];
}
