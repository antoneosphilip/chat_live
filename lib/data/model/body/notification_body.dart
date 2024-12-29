enum NotificationType {
  message,
  order,
  general,
}

class NotificationBody {
  NotificationType? notificationType;
  int? orderId;
  int? receiverId;
  String? type;
  int? conversationId;
  int? index;
  String? image;
  String? name;
  String? receiverType;

  NotificationBody({
    this.notificationType,
    this.orderId,
    this.receiverId,
    this.type,
    this.conversationId,
    this.index,
    this.image,
    this.name,
    this.receiverType,
  });

  NotificationBody.fromJson(Map<String, dynamic> json) {
    notificationType = convertToEnum(json['order_notification']);
    receiverId = json['receiver_id'];
    type = json['type'];
    conversationId = json['conversation_id'];
    index = json['index'];
    image = json['image'];
    name = json['name'];
    receiverType = json['receiver_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_notification'] = notificationType.toString();
    data['receiver_id'] = receiverId;
    data['type'] = type;
    data['conversation_id'] = conversationId;
    data['index'] = index;
    data['image'] = image;
    data['name'] = name;
    data['receiver_type'] = receiverType;
    return data;
  }

  NotificationType convertToEnum(String? enumString) {
    if (enumString == NotificationType.general.toString()) {
      return NotificationType.general;
    } else if (enumString == NotificationType.message.toString()) {
      return NotificationType.message;
    }
    return NotificationType.general;
  }
}
