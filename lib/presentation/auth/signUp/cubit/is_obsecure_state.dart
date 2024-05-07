// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/presentation/utils/constants.dart';

class IsObsecureState {}

class HidingEye extends IsObsecureState {
  bool confirmPassIsObsecure = true;
  String passviewIcon = AppAssets.hidePass;
}

class ViewingEye extends IsObsecureState {
  String viewIcon = AppAssets.viewPass;
  bool passIsObsecure = false;
  bool confirmPassIsObsecure = false;
}
