// ignore_for_file: unnecessary_null_comparison
import 'package:fluro/fluro.dart';
import 'package:good_house_renting/pages/home/index.dart';
import 'package:good_house_renting/pages/login.dart';
import 'package:good_house_renting/pages/page_not_found.dart';
import 'package:good_house_renting/pages/registration.dart';
import 'package:good_house_renting/pages/room_detail/index.dart';

class RouterManager {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';
  static String roomDetail = '/room/:roomId';
  static String registration = '/registration';

  // 路由处理函数
  static final Handler _homeHadler = Handler(handlerFunc: (context, params) {
    return const HomePage();
  });

  static final Handler _loginHadler = Handler(handlerFunc: (context, params) {
    return const LoginPage();
  });

  static final Handler _roomDetailHadler =
      Handler(handlerFunc: (context, params) {
    return RoomDetailPage(roomId: params['roomId']![0]);
  });

  static final Handler _registrationHadler =
      Handler(handlerFunc: (context, params) {
    return const RegistrationPage();
  });

  static final Handler _notFoundHadler =
      Handler(handlerFunc: (context, params) {
    return const NotFoundPage();
  });

  // 编写函数 configureRoutes 关联路由名称和处理函数
  static void defineRoutes(FluroRouter router) {
    router.define(home, handler: _homeHadler);
    router.define(login, handler: _loginHadler);
    router.define(registration, handler: _registrationHadler);
    router.define(roomDetail, handler: _roomDetailHadler);
    router.notFoundHandler = _notFoundHadler;
  }
}
