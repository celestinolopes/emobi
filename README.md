# e_mobi

Aplicativo Flutter para gestão de transporte escolar, motoristas, responsáveis e alunos.

---

## Sumário

- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Estrutura de Pastas](#estrutura-de-pastas)
- [Dependências](#dependências)
- [Como Rodar o Projeto](#como-rodar-o-projeto)
- [Customização de Assets](#customização-de-assets)
- [Fontes](#fontes)
- [Observações](#observações)

---

## Visão Geral

O **e_mobi** é um aplicativo Flutter que permite o gerenciamento de motoristas, veículos, responsáveis e alunos no contexto de transporte escolar. O projeto possui integração com APIs REST, upload de documentos, autenticação, notificações, mapas e muito mais.

---

## Funcionalidades

- Cadastro e autenticação de motoristas e responsáveis
- Upload de documentos (PDF, imagens, etc.)
- Gerenciamento de veículos e alunos
- Integração com Google Maps
- Notificações e mensagens
- Visualização de documentos em PDF
- Pagamentos e cupons
- Interface responsiva com suporte a múltiplos dispositivos

---

## Estrutura de Pastas

```
lib/
├── models/          # Modelos de dados
├── views/          # Telas do aplicativo
├── controllers/    # Lógica de negócios
├── services/       # Serviços como API e banco de dados
├── utils/          # Utilitários e extensões
└── main.dart       # Ponto de entrada do aplicativo
```

---

## Dependências

Principais pacotes utilizados:

- **UI e Utilitários:**  
  `sizer`, `google_fonts`, `modal_progress_hud_nsn`, `gap`, `toastification`, `flutter_svg`, `font_awesome_flutter`
- **Imagens e Arquivos:**  
  `cached_network_image`, `galleryimage`, `file_picker`, `image_picker`, `camerawesome`
- **Formatação e Máscaras:**  
  `intl_phone_number_input`, `mask_text_input_formatter`, `brasil_fields`, `intl_phone_field`
- **Gerenciamento de Estado e Injeção:**  
  `provider`, `get`, `get_it`, `flutter_bloc`
- **HTTP e Conectividade:**  
  `http`, `internet_connection_checker`
- **Mapas:**  
  `google_maps_flutter`
- **PDF:**  
  `flutter_pdfview`
- **Outros:**  
  `dartz`, `permission_handler`, `mime`, `text_scroll`

Veja todas as dependências no [`pubspec.yaml`](pubspec.yaml).

---

## Como Rodar o Projeto

1. **Pré-requisitos:**  
   - Flutter SDK >= 3.3.1 < 4.0.0  
   - Android Studio ou VS Code  
   - Dispositivo ou emulador Android/iOS

2. **Instale as dependências:**
   ```sh
   flutter pub get
   ```

3. **Configure o emulador ou conecte um dispositivo.**

4. **Execute o aplicativo:**
   ```sh
   flutter run
   ```

---

## Customização de Assets

Os assets do projeto estão na pasta `assets/`. Para adicionar ou modificar imagens, ícones ou fontes, faça as alterações necessárias nesta pasta e atualize o `pubspec.yaml` conforme necessário.

---

## Fontes

As fontes utilizadas no aplicativo estão especificadas no arquivo `pubspec.yaml`. Para adicionar novas fontes, baixe os arquivos de fonte desejados e os adicione à pasta `assets/fonts/`. Não se esqueça de atualizar o `pubspec.yaml` para incluir as novas fontes.

---

## Observações

 - Algumas funcionalidades podem depender de serviços externos e requerer configuração adicional.
 