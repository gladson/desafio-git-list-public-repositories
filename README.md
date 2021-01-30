# Desafio - Git List Public Repositories

## Rodar Projeto:

### Add os pacotes de dependências

```shell
$ flutter pub get
Running "flutter pub get" in desafio_git_list_public_repositories...                0,4s
```

### Executar

```shell
$ flutter run

Launching lib/main.dart on moto g 6 plus in debug mode...
Running Gradle task 'assembleDebug'...                                  
Running Gradle task 'assembleDebug'... Done                        16,0s
✓ Built build/app/outputs/flutter-apk/app-debug.apk.
Waiting for moto g 6 plus to report its views...                    13ms
Syncing files to device moto g 6 plus...                           510ms

Flutter run key commands.
r Hot reload. 🔥🔥🔥
R Hot restart.
h Repeat this help message.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).
An Observatory debugger and profiler on moto g 6 plus is available at: http://127.0.0.1:37697/vViFTu_9By0=/
```

### No modo desenvolvimento precisa executar também

#### Build Runner:

> models_build: 

```shell
$ flutter pub run build_runner build
```

> models_watch: 

```shell
$ flutter pub run build_runner watch --delete-conflicting-outputs
```

#### Gerar icones diferentes ao projeto

```shell
$ flutter pub run flutter_launcher_icons:main
```

#### Keystore

```shell
$ keytool -genkey -v -keystore .\keystore\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key

Enter keystore password: 12desafio12 
Re-enter new password: 12desafio12
...
$ keytool -importkeystore -srckeystore .\keystore\key.jks -destkeystore .\keystore\key.jks -deststoretype pkcs12
```

## Observação:

> Foi gerado o keystore.
> O Github limita a listagem para 100 itens.
> Agradeço a vocês pessoal, Felipe Delvan e Douglas Costa pelos esclarecimentos do projeto.