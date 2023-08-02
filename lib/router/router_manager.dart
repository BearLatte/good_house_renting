// ignore_for_file: unnecessary_null_comparison
import 'package:fluro/fluro.dart';
import 'package:good_house_renting/pages/home/index.dart';
import 'package:good_house_renting/pages/login.dart';
import 'package:good_house_renting/pages/page_not_found.dart';
import 'package:good_house_renting/pages/registration.dart';
import 'package:good_house_renting/pages/room_add/index.dart';
import 'package:good_house_renting/pages/room_detail/index.dart';
import 'package:good_house_renting/pages/room_manage/index.dart';
import 'package:good_house_renting/pages/setting.dart';

class RouterManager {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';
  static String roomDetail = '/roomDetail/:roomId';
  static String registration = '/registration';
  static String setting = 'setting';
  static String roomManage = '/roomManage';
  static String addRoom = '/addRoom';

  // 路由处理函数
  static final Handler _homeHandler = Handler(handlerFunc: (context, params) {
    return const HomePage();
  });

  static final Handler _loginHandler = Handler(handlerFunc: (context, params) {
    return const LoginPage();
  });

  static final Handler _roomDetailHnadler =
      Handler(handlerFunc: (context, params) {
    return RoomDetailPage(roomId: params['roomId']![0]);
  });

  static final Handler _registrationHandler =
      Handler(handlerFunc: (context, params) {
    return const RegistrationPage();
  });

  static final Handler _settingHandler =
      Handler(handlerFunc: (context, params) {
    return const SettingPage();
  });

  static final Handler _roomManageHandler =
      Handler(handlerFunc: (context, params) {
    return const RoomManagePage();
  });

  static final Handler _notFoundHandler =
      Handler(handlerFunc: (context, params) {
    return const NotFoundPage();
  });

  static final Handler _addRoomFoundHandler =
      Handler(handlerFunc: (context, params) {
    return const RoomAddPage();
  });

  // 编写函数 configureRoutes 关联路由名称和处理函数
  static void defineRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(registration, handler: _registrationHandler);
    router.define(roomDetail, handler: _roomDetailHnadler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(addRoom, handler: _addRoomFoundHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
