import 'package:vexana/vexana.dart';

class VexanaManager {
  late INetworkManager _networkManager;
  INetworkManager get instance => _networkManager;

  VexanaManager({required INetworkManager networkManager}) {
    _networkManager = networkManager;
  }
}
