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