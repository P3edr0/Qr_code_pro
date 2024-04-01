# Qr Code Pro

  <h3 align="center"> Módulo Imagem  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Módulo de Leitura   &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Módulo Criação</h3>
<p align="center">
<img src="assets/screenshots/insert_image.gif" width="200" alt="Texto Alternativo" style="display: inline-block; margin-right: 50px;">
<img src="assets/screenshots/read_image.gif" width="200" alt="Texto Alternativo" style="display: inline-block; margin-right: 50px;"">
<img src="assets/screenshots/create_qrcode.gif" width="200" alt="Texto Alternativo">
</p>



Este é um aplicativo que apresenta uma solução completa para tratamento de QR codes, onde é possível o usuário, ler, criar, e importar uma foto de sua galeria
que contenha um QR code e a aplicação fará a leitura. Além de conseguir acessar todos os QR codes que já leu, criou e importou, o usuário ainda pode compartilhar esse QR code em formato PNG.

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.


### 📋 Pré-requisitos

De que coisas você precisa para instalar o software e como instalá-lo?
Versão do FLutter:
```
Flutter 3.13.8
```
Versão do Dart:
```
Dart 3.1.4
```


### 🔧 Instalação

Se preferir temos o aplicativo já na [PlayStore](https://play.google.com/store/apps/details?id=com.app.qr_code_pro)

ou

Faça um clone do repositório, certifique-se que está com a versão do Dart e do Flutter correspondentes a do app em sua máquina.
Em uma IDE de sua preferência abra o projeto, vá até o arquivo ```main ```  contido na ```lib``` do projeto, e execute.


## ⚙️ Executando os testes

Esta aplicação possui:
* Testes Unitários
* Testes de Widgets
* Testes de Integração

### 🔩 Testes Unitários
Estes testes farão a verificação unitária de cada funçao relevante para testes do desejado, basta executar os seguintes comandos:

##### Módulo de Criação de Qr Code
```
flutter test /test/unit_tests/create_qr_unit_test.dart
```
##### Módulo de Leitura de Qr Code
```
flutter test /test/unit_tests/read_qr_unit_test.dart
```
##### Módulo de Leitura de imagem
```
flutter test /test/unit_tests/qr_code_image_unit_test.dart
```

### 📐 Testes de Integração
Estes testes farão a verificação da integração de cada módulo, mais especificamente as funções que integram a interface do App ao banco de dados local, basta executar os seguintes comandos:

##### Módulo de Criação de Qr Code
```
flutter test /test/integration_tests/create_qr_integration_test.dart
```
##### Módulo de Leitura de Qr Code
```
flutter test /test/integration_tests/read_qr_unit_test.dart
```
##### Módulo de Leitura de imagem
```
flutter test /test/integration_tests/qr_code_image_unit_test.dart
```

### 📲  Testes de Widgets
Estes testes farão a verificação dos componentes da tela de cada módulo, para verificar basta executar os seguintes comandos:

##### Módulo de Criação de Qr Code
```
flutter test /test/widget_tests/create_qr_widget_test.dart
```
##### Módulo de Leitura de Qr Code
```
flutter test /test/widget_tests/read_qr_page_widget_test.dart
```
##### Módulo de Leitura de imagem
```
flutter test /test/widget_tests/insert_image_page_widget_test.dart
```



## 🛠️ Construído com
* [Dart](https://dart.dev/) - Linguagem utilizada
* [Flutter](https://flutter.dev/?gad_source=1&gclid=CjwKCAjwtqmwBhBVEiwAL-WAYTronPzZuhNXVgdBaJrtKCZJHoijr-hUmePSpBlN3Nw-XNZqZMf63RoCO_kQAvD_BwE&gclsrc=aw.ds) - Framework Utilizado
* [Sqflite](https://pub.dev/packages/sqflite) -Library para Armazenamento local dos Qr Codes
* [Get_it](https://pub.dev/packages/get_it) - Library Gerente de Dependência
* [Mobx](https://pub.dev/packages/mobx) - Library para gestão de estado 


## 🛠️ Construído com
* [Dart](https://dart.dev/) - Linguagem utilizada
* [Flutter](https://flutter.dev/?gad_source=1&gclid=CjwKCAjwtqmwBhBVEiwAL-WAYTronPzZuhNXVgdBaJrtKCZJHoijr-hUmePSpBlN3Nw-XNZqZMf63RoCO_kQAvD_BwE&gclsrc=aw.ds) - Framework Utilizado
* [Sqflite](https://pub.dev/packages/sqflite) -Library para Armazenamento local dos Qr Codes
* [Get_it](https://pub.dev/packages/get_it) - Library Gerente de Dependência
* [Mobx](https://pub.dev/packages/mobx) - Library para gestão de estado 

## 🔭 Próximos Passos
Não pretendo trazer mais funcionalidades para o app, dado que a ideia inicial foi fazer dele uma solução simples para o tratamento de Qr Codes, sendo assim meu plano
é futuramente implementar testes automatizados á aplicação e também adicionar anúncios do Google com o AdMob.

## 🎁 Expressões de gratidão

*Este projeto foi desafiador, e me surpreendeu como uma solução relativamente simples, pode abrigar um leque de opções tão complexas
desde a implementação dos testes, até a publicação do app na loja, a cada tomada de decisão sobre o desfecho da aplicação, pude perceber o quanto me desenvolvi como programador, e estou realmente satisfeito com o resultado final.

---

