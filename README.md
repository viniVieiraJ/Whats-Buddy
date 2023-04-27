# Whats-Buddy
<h1 align="center">CodeChat Api Pro</h1>

It is a version of this API with advanced features like message queue management, send processing status, integration with **[n8n](https://github.com/code-chat-br/n8n-nodes-codechat)** unique models and much more! **[Check it out](https://github.com/code-chat-br/docs-codechat)** 😉!

<div align="center">
  <a href="https://github.com/code-chat-br/docs-codechat" target="_blank" rel="noopener noreferrer">
    <img src="./public/images/code.png" style="width: 35% !important;">
  </a>
</div>

</br>
<hr style="height: 5px;background: #007500;margin: 20px 0;box-shadow: 0px 3px 5px 0px rgb(204 204 204);">

<div align="center">

[![Telegram Group](https://img.shields.io/badge/Group-Telegram-%2333C1FF)](https://t.me/codechatBR)
[![Whatsapp Group](https://img.shields.io/badge/Group-WhatsApp-%2322BC18)](https://chat.whatsapp.com/HyO8X8K0bAo0bfaeW8bhY5)
[![License](https://img.shields.io/badge/license-GPL--3.0-orange)](./LICENSE)
[![Support](https://img.shields.io/badge/Buy%20me-coffe-orange)](https://app.picpay.com/user/cleber.wilson.oliveira)
[![Support](https://img.shields.io/badge/Buy%20me%20coffe-pix-blue)](#pix-2b526ada-4ef4-4db4-bbeb-f60da2421fce)

</div>
  

<div align="center"><img src="./public/images/cover.png"></div>

## WhatsApp-Api-NodeJs

This code is an implementation of [Baileys](https://github.com/adiwajshing/Baileys), as a RestFull Api service, which controls whatsapp functions.</br>
With this one you can create multiservice chats, service bots or any other system that uses whatsapp. With this code you don't need to know javascript for nodejs , just start the server and make the language requests that you feel most comfortable with.

## [Node n8n](https://github.com/jrCleber/n8n-codechat-wapi)

<div align="center">
  <a href="https://github.com/jrCleber/n8n-codechat-wapi" target="_blank" rel="noopener noreferrer">
    <img src="./public/images/n8n-codechat-wapi.png" style="width: 50% !important;">
  </a>
</div>

## Infrastructure

### Nvm installation

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# or
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
>
> After finishing, restart the terminal to load the new information.
>

### Docker installation \[optional\]

```sh
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker ${USER}
```
### Nodejs installation

```sh
nvm install 16.17.0
```

### pm2 installation
```sh
npm i -g pm2
```

```sh
docker --version

node --version
```
## MongoDb [optional]

After installing docker and docker-compose, up the container.
  - [compose from mongodb](./mongodb/docker-compose.yaml)

In the same directory where the file is located, run the following command:
```sh
bash docker.sh
```
Using the database is optional.

## Application startup

Cloning the Repository
```
git clone https://github.com/code-chat-br/whatsapp-api.git
```

Go to the project directory and install all dependencies.</br>
```sh
cd whatsapp-api

npm i
```

Finally, run the command below to start the application:
```sh
# Under development
npm run start

# In production
npm run start:prod

# pm2
pm2 start 'npm run start:prod' --name ApiCodechat
```
## Authentication

You can define two authentication **types** for the routes in the **[env file](./src/dev-env.yml)**.
Authentications must be inserted in the request header.

1. **apikey**

2. **jwt:** A JWT is a standard for authentication and information exchange defined with a signature.

> Authentications are generated at instance creation time.

**Note:** There is also the possibility to define a global api key, which can access and control all instances.

### Connection

#### Create an instance

##### HTTP

> *NOTE:* This key must be inserted in the request header to create an instance.

```http
POST /instance/create HTTP/1.1
Host: localhost:8080
Content-Type: application/json
apikey: t8OOEeISKzpmc3jjcMqBWYSaJH2PIxns

{
  "instanceName": "codechat"
}
```
##### cURL

```bash
curl --location --request POST 'http://localhost:8080/instance/create' \
--header 'Content-Type: application/json' \
--header 'apikey: t8OOEeISKzpmc3jjcMqBWYSaJH2PIxns' \
--data-raw '{
  "instanceName": "codechat"
}'
```
### Response

```ts
{
  "instance": {
    "instanceName": "codechat",
    "status": "created"
  },
  "hash": {
    "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9. [...]"

    // or
    // "apikey": "88513847-1B0E-4188-8D76-4A2750C9B6C3"
  }
}
```
#### Connection with qrcode

##### HTTP

```http
GET /instance/connect/codechat HTTP/1.1
Host: localhost:8080
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9. [...]
```
```http
GET /instance/connect/codechat HTTP/1.1
Host: localhost:8080
apikey: 88513847-1B0E-4188-8D76-4A2750C9B6C3
```
##### cURL

```bash
curl --location --request GET 'http://localhost:8080/instance/connect/codechat' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9. [...]'
```
```bash
curl --location --request GET 'http://localhost:8080/instance/connect/codechat' \
--header 'apikey: 88513847-1B0E-4188-8D76-4A2750C9B6C3'
```

### Response

```ts
{
  "code": "2@nXSUgRJSBY6T0XJmiFKZ0 [...] ,XsgJhJHYa+0MPpXANdPHHt6Ke/I7O2QyXT/Lsge0uSg=",
  "base64": "data:image/png;base64,iVBORw0KGgoAAAANSUhE [...] LkMtqAAAAABJRU5ErkJggg=="
}
```

### App in Docker
  - [docker run](./docker.sh)
  - [docker-compose](./docker-compose.yml)
  - [env for docker](./Docker/.env)
  - [DockerHub-codechat/api](https://hub.docker.com/r/codechat/api)

After building the application, in the same directory as the files above, run the following command:
```sh
docker-compose up
```
## Send Messages
|     |   |
|-----|---|
| Send Text | ✔ |
| Send Buttons | ✔ |
| Send Template | ❌ |
| Send Media: audio - video - image - document - gif <br></br>base64: ```true``` | ✔ |
| Send Media File | ❌ |
| Send Audio type WhatsApp | ✔ |
| Send Location | ✔ |
| Send List | ✔ |
| Send Link Preview | ❌ |
| Send Contact | ✔ |
| Send Reaction - emoji | ✔ |

## Postman collections
  - [Postman Json](./postman.json)

## Webhook Events

| Name | Event | TypeData | Description |
|------|-------|-----------|------------|
| QRCODE_UPDATED | qrcode.updated | json | Sends the base64 of the qrcode for reading |
| CONNECTION_UPDATE | connection.update | json | Informs the status of the connection with whatsapp |
| MESSAGES_SET | message.set | json | Sends a list of all your messages uploaded on whatsapp</br>This event occurs only once |
| MESSAGES_UPSERT | message.upsert | json |  Notifies you when a message is received |
| MESSAGES_UPDATE | message.update | json | Tells you when a message is updated |
| SEND_MESSAGE | send.message | json | Notifies when a message is sent |
| CONTACTS_SET | contacts.set | json | Performs initial loading of all contacts</br>This event occurs only once |
| CONTACTS_UPSERT | contacts.upsert | json | Reloads all contacts with additional information</br>This event occurs only once |
| CONTACTS_UPDATE | contacts.update | json | Informs you when the chat is updated |
| PRESENCE_UPDATE | presence.update | json |  Informs if the user is online, if he is performing some action like writing or recording and his last seen</br>'unavailable' | 'available' | 'composing' | 'recording' | 'paused' |
| CHATS_SET | chats.set | json | Send a list of all loaded chats |
| CHATS_UPDATE | chats.update | json | Informs you when the chat is updated |
| CHATS_UPSERT | chats.upsert | json | Sends any new chat information |
| GROUPS_UPSERT | groups.upsert | JSON | Notifies when a group is created |
| GROUPS_UPDATE | groups.update | JSON | Notifies when a group has its information updated |
| GROUP_PARTICIPANTS_UPDATE | group-participants.update | JSON | Notifies when an action occurs involving a participant</br>'add' | 'remove' | 'promote' | 'demote' |
| NEW_TOKEN | new.jwt | JSON | Notifies when the token (jwt) is updated

## Env File

See additional settings that can be applied through the **env** file by clicking **[here](./src/dev-env.yml)**.

> **⚠️Attention⚠️:** rename the **dev-env.yml** file to **env.yml**.

## SSL

To install the SSL certificate, follow the **[instructions](https://certbot.eff.org/instructions?ws=other&os=ubuntufocal)** below.

# Note

This code is in no way affiliated with WhatsApp. Use at your own discretion. Don't spam this.

This code was produced based on the baileys library and it is still under development.

# Donate to the project.

#### Pix: 2b526ada-4ef4-4db4-bbeb-f60da2421fce

#### PicPay

<div align="center">
  <a href="https://app.picpay.com/user/cleber.wilson.oliveira" target="_blank" rel="noopener noreferrer">
    <img src="./public/images/picpay-image.png" style="width: 50% !important;">
  </a>
</div>

</br>