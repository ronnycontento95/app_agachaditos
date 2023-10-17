
import 'package:app_agachaditos/data/repositories/api_rest.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/provider_principal.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider(create: (_)=> ProviderPrincipal(ApiRest()))
  ];

}