# Harpacrista

Aplicativo Harpa Crista gratis.

## Começando

Este projeto é uma aplicação Flutter.

Alguns recursos para você começar se este for seu primeiro projeto Flutter:

- [Laboratório: Escreva seu primeiro aplicativo Flutter](https://docs.flutter.dev/get-started/codelab)
- [Livro de receitas: exemplos úteis do Flutter](https://docs.flutter.dev/cookbook)

Para obter ajuda para começar a desenvolver o Flutter, consulte o
[documentação online](https://docs.flutter.dev/), que oferece tutoriais,
exemplos, orientações sobre desenvolvimento móvel e uma referência completa da API.

## Estrutura do Projeto
lib/main.dart: Arquivo principal que inicializa o aplicativo e define a estrutura básica da interface do usuário.
lib/harpas/home.dart: Contém a tela principal para exibir a lista de hinos e gerenciar favoritos.
lib/favoritos/home.dart: Contém a tela para exibir e gerenciar a lista de hinos favoritos.
lib/contatos/home.dart: Contém a tela para exibir informações de contato.
lib/doacoes/home.dart: Contém a tela para gerenciar doações.
lib/palavra/home.dart: Contém a tela para exibir o louvor do dia.
Tecnologias Utilizadas
Flutter: Framework principal para desenvolvimento do aplicativo.
Dart: Linguagem de programação utilizada no desenvolvimento do aplicativo.
path_provider: Pacote utilizado para acessar o sistema de arquivos do dispositivo.
animated_text_kit: Pacote utilizado para animações de texto.
flutter_svg: Pacote utilizado para exibir imagens SVG.
Funcionalidades Principais
Lista de Hinos: Exibe uma lista de hinos com a opção de adicionar aos favoritos.
Favoritos: Permite adicionar e remover hinos da lista de favoritos.
Louvor do Dia: Exibe um louvor diário.
Contatos: Exibe informações de contato.
Doações: Gerencia doações.
Gerenciamento de Estado
Stateful Widgets: Utilizados para gerenciar o estado das telas e atualizar a interface do usuário conforme necessário.
Persistência de Dados
File I/O: Utilizado para salvar e ler a lista de hinos favoritos no sistema de arquivos do dispositivo.
API Utilizada
API de Hinos: O aplicativo utiliza uma API para buscar a lista de hinos. A API fornece os dados dos hinos, incluindo número, título e letras. A integração com a API é feita utilizando requisições HTTP e os dados são processados e exibidos no aplicativo.
