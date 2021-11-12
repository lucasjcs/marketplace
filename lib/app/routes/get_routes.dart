import 'package:get/get.dart';
import '../ui/pages/pages.dart';

class GetRoutes {
  get getRoutes {
    return [
      GetPage(name: '/', page: () => HomePage()),
    ];
  }
}
