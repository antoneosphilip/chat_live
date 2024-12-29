import 'package:get/get.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:live_app/controller/events_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class EchoService extends GetxService {
  IO.Socket? socket;
  Echo? echo;
  EventsController eventsController = Get.find();

  @override
  void onInit() {
    super.onInit();
    startSocketIo();
  }

  @override
  void onClose() {
    socket?.dispose();
    super.onClose();
  }

  void startSocketIo() {
    socket = IO.io(
      'http://192.168.1.10:6002',
      IO.OptionBuilder()
          .disableAutoConnect()
          .setTransports(['websocket']).build(),
    );

    socket?.onConnect((_) {
      print('Socket connected');
      echo = Echo(
        broadcaster: EchoBroadcasterType.SocketIO,
        client: socket,
        options: {
          'auth': {
            'headers': {
              'Authorization':
                  'Bearer 1|JKI9n6lc7hODVdl1rCVcPJsaOdDO0fKvx8eMAiY7',
            }
          },
        },
      );
    });

    socket?.onConnectError((error) {
      print('Socket connection error: $error');
    });

    socket?.connect();
  }

  void listenPublic(String channel, String event,
      Function(Map<String, dynamic> event) onEvent) {
    echo?.channel(channel).listen(event, (e) {
      onEvent(e);
      switch (event) {
        case 'BigHorn':
          eventsController.showBigHorn(
              sender: e['sender'], gift: e['gift'], room: e['room']);
          break;
        case 'AllRoomGift':
          eventsController.showAllRoom(
              sender: e['sender'], gift: e['gift'], room: e['room']);
          break;
        case 'AllSeatsGift':
          eventsController.showAllSeats(
              sender: e['sender'], gift: e['gift'], room: e['room']);
          break;
        case 'UserSendGift':
          eventsController.showInRoomSentGift(
              sender: e['sender'], gift: e['gift']);
          break;
      }
    });
  }

  void listenPrivate(String channel, String event) {
    echo?.private(channel).listen(event, (e) {
      print(e);
    });
  }

  void joinPresenceChannel(String channel, String event) {
    echo?.join(channel).here((users) {
      print(users);
    }).joining((user) {
      print(user);
    }).leaving((user) {
      print(user);
    }).listen(event, (e) {
      print(e);
    });
  }
}
