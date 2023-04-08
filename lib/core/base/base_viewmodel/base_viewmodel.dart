import 'package:vexana/vexana.dart';

import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel<T extends INetworkModel<T>> {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";
  VexanaManager manager = VexanaManager(
    networkManager: NetworkManager<T>(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: _baseUrl),
    ),
  );
}
