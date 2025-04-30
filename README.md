## Приложение app-netology

#### Сборка Docker-Образа

`DOCKER_BUILDKIT=1 docker build -t <id реестра>/ntlg-app:<версия> .`

Проверка работы сервиса:

`docker run -d --name app --rm -p 8080:80 <id реестра>/ntlg-app:<версия>`

`curl localhost:8080`
