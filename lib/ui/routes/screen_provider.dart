
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/repositories/api_rest.dart';
import '../provider/provider_principal.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider(create: (_)=> ProviderPrincipal(ApiRest()))
  ];

}