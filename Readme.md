## Задание
Добавить чат с продавцом на страницу Профиль.

### Шаг 1. Доработка API
Теперь пользователи хранятся в Firebase. В таблицы БД (Корзина, Избранное) добавлено поле UID, которое является уникальным токеном клиента.
![alt text](image.png)

С учётом UID обновлены следующие запросы:
* POST /favourite - теперь требует firebase UID
* GET /favourite - теперь требует firebase UID
* DELETE /favourite - теперь требует firebase UID
* GET /cart - теперь требует firebase UID
* POST /cart - теперь требует firebase UID
* PUT /cart - теперь требует firebase UID
* DELETE /cart - теперь требует firebase UID
* GET /orders - теперь требует firebase UID
* POST /order - теперь требует firebase UID

<p>Весь API описан в файле <a href="./backend/backend.go">backend.go</a> и протестирован с помощью <a href="https://elements.getpostman.com/redirect?entityId=24015280-8a099f19-cf00-4125-9654-e3b574800df0&entityType=collection">Postman</a></p>

### Шаг 2. Доработка интерфейса
<p>Исходя из предыдущего шага понятно, что никаких действий кроме просмотра стрижек неавторизованный пользователь выполнить не может.</p>
<p>Поэтому неавторизованному пользователю будет видна только страница авторизации.</p>

* <p> Состояние: Неавторизован</p>
![alt text]({9996BA51-DCD2-4389-906E-3BFAE735B704}.png)

* <p> Состояние: Авторизован</p>
![alt text]({34EE12F0-3046-466C-9C9F-8F576D46A2E7}.png)

### Шаг 3.
<p>Подключим Firestore Database.</p>

![{06BB38D1-B663-4D11-91D7-75E24B819FC3}](https://github.com/user-attachments/assets/456b368d-e9b3-4b14-8f1f-05893388c83f)

Установим библиотеки: для работы с firestore и для отображения сообщений в пузырях.
<pre>
  flutter pub add cloud_firestore
  flutter pub add flutter_chat_bubble 
</pre>

### Шаг 4. 

<p>Пользователи не могут общаться с другими пользователями (только с продавцом), поэтому в сообщении нужно хранить только id покупателя. Дополнительная переменная будет отвечать за то, отправлено ли оно от Администратора.</p>

<p>Добавим структуру данных - элемент списка чатов:</p>
<pre> 
@JsonSerializable()
class ChatUser {
  ChatUser(this.email, this.uid, this.name, this.lastMessageContent);
  String email;
  String uid;
  String name;
  String lastMessageContent = "";
  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);
}
</pre>
<p>И ещё одну структуру - для хранения данных сообщения</p>
<pre> 
@JsonSerializable()
class Message {
  Message(this.customerUID, this.isFromAdmin, this.content, this.timestamp);
  String customerUID;
  bool isFromAdmin;
  String content;
  DateTime timestamp;
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
</pre>

<p>
Администратор - это единственный пользователь с почтой admin@admin.com
</p>
<p>
На странице Профиль у обычного пользователя есть кнопка "Чат с продавцом", которая открывает страницу с чатом. У администратора в этом же месте другая кнопка - "Чат с клиентами", которая открывает список чатов, в котором уже затем можно выбрать конкретного пользователя и ответить ему.
</p>

### Шаг 5. Тестирование
Очистим firestore и создадим 3-х пользователей:
- admin@admin.com
- danya@gmail.com
- egor@gmail.com
