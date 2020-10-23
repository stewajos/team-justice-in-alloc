import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:provider/provider.dart';

var allocProviders = [
  ChangeNotifierProvider<AllocationProvider>(
    create: (_) => AllocationProvider(),
  ),
];