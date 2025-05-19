import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<int> checkLogin() async {
  final currentUser = await ParseUser.currentUser() as ParseUser?;

  if (currentUser == null) {
    return 0;
  } else {
    final sessionToken = currentUser.sessionToken;
    final ParseResponse? validate =
        await ParseUser.getCurrentUserFromServer(sessionToken!);

        if (validate!.success && validate.result != null){
          return 1;
        } else {
          await currentUser.logout();
          return 0;
        }
  }
}
