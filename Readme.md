# Практика 14-15 Столяров ЭФБО-01-22 22T0318

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

![{E520D512-E36B-4A36-B38F-54E0781B4B74}](https://github.com/user-attachments/assets/8d409830-b596-43ed-8e1e-7715df3f875f)

![{D2F9F341-0CB1-42EF-A755-4780DA5B7D6E}](https://github.com/user-attachments/assets/5014211e-6c69-41b6-8679-4e27fe177be3)

![{767EDC08-C4D4-4A34-96FC-7AC89E6A4674}](https://github.com/user-attachments/assets/5ce73dc3-8b4a-4d33-b260-3e1b738bddca)

Войдём за admin@admin.com и увидим, что список чатов пуст.

![{A7E0E8CB-E365-4E0D-8896-DA2B01DEEACC}](https://github.com/user-attachments/assets/81ba6357-38d3-497e-b20e-0da3c3ea91c1)

![{72926E07-3D05-481A-A2DB-EA19C3A74DC2}](https://github.com/user-attachments/assets/698a5c92-a008-48ea-bd4b-5a8c408d6155)

Войдём за danya@gmail.com и egor@gmail.com, отправим пару сообщений:

![{49BC5E22-C2DB-477A-99FD-68377E3D761B}](https://github.com/user-attachments/assets/4304c86e-72e5-43b6-b0c1-cdf32f1b850d)

![{BF55C40D-1DC6-4965-B74A-E036A50D7908}](https://github.com/user-attachments/assets/81b34c3e-504e-413f-9329-3e4cbadc03d2)

Вот что увидит admin@gmail.com:

![{56BCF069-44EB-4692-9256-FCF2A2B2A857}](https://github.com/user-attachments/assets/c7e75bcb-021e-4d11-9a6e-3960e0a5369c)

![{1D06E640-7BE1-4E21-9AE0-1847367C96E5}](https://github.com/user-attachments/assets/7f372ec4-7fc3-4ab6-ba93-14d3bf48a9d6)

![{B2436E09-4A96-4940-89BF-EEAACFE90639}](https://github.com/user-attachments/assets/ff185b29-1083-4bdf-bc14-5a939e31cedf)

## Предпоказ .GIF
![Тут должна была быть гифка, но что-то пошло не так](./preview.gif)

## upd:
Добавлена иконка приложения
![{868434E0-B814-4A92-B0B4-591BC0C690EC}](https://github.com/user-attachments/assets/5cde32fa-6a28-4122-8940-9f2bbaa1645e)
