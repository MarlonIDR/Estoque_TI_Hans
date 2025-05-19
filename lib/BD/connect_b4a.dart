import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<bool> initB4A() async {
  const keyApplicationId = 'aZgiwifuSkBu03f3h0WIDqc08cR8yjnztxaWupdW';
  const keyClientKey = 'nXoVHdzNFsYNmjL35znm61GFRKpHOayPMbO2fJfy';
  const keyServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(
    keyApplicationId,
    keyServerUrl,
    clientKey: keyClientKey,
    debug: true,
  );
  ParseResponse healthCheck = (await Parse().healthCheck());
  if (healthCheck.success) {
    return true;
  } else {
    return false;
  }
}
