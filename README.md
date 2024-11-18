# Task Manager

    Este é um projeto de gerenciamento de tarefas (**Task Manager**) que integra autenticação com outro serviço, utilizando Rails, Rails UI, MySQL, Faraday e JWT. O projeto é dividido em 4 serviços principais:

- **Serviço de Autenticação**: Responsável pela autenticação de usuários, usando JWT.
- **Serviço de Gerenciamento de Tarefas**: Permite que os usuários criem, editem e excluam tarefas.

## 🛠 Tecnologias

- **Ruby on Rails**: Framework web utilizado para o backend.
- **MySQL**: Banco de dados relacional utilizado para armazenar dados persistentes.
- **Faraday**: Biblioteca para realizar requisições HTTP, utilizada para integração com serviços externos.
- **JWT (JSON Web Token)**: Utilizado para autenticação e autorização de usuários.
- **Rails UI**: Framework para facilitar a construção de interfaces web com componentes prontos e uma boa experiência de usuário.

## ✨ Funcionalidades

- **Autenticação via JWT**: O sistema de login é realizado por meio de um serviço externo. Após a autenticação, o usuário recebe um JWT que será utilizado para autenticação nas próximas requisições.
- **Gerenciamento de Tarefas**: Usuários autenticados podem criar, editar e excluir tarefas. As tarefas são armazenadas em um banco de dados MySQL.
- **Interface de Usuário**: A aplicação utiliza o Rails UI para uma navegação intuitiva e uma boa experiência de usuário. O layout é responsivo e adaptado para diferentes dispositivos.
- **Integração com Serviços Externos**: Utiliza Faraday para realizar chamadas a APIs externas, como serviços de notificações ou integrações com outras plataformas.

## 📋 Requisitos

- **Ruby**: 3.3.1 ou superior
- **Rails**: 7.2.2 ou superior
- **MySQL**: 8.x ou superior
- **Node.js**: 18.20.5 ou superior
- **Yarn**: 1.22.22 ou superior
    
## 📦 Gems Utilizadas

```ruby
gem "rails", "~> 7.2.2"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", ">= 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "railsui", github: "getrailsui/railsui", branch: "main"
gem "jsbundling-rails"
gem "jwt"
gem "nokogiri"
gem "tailwindcss-rails"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "ransack"
gem "image_processing", "~> 1.2"
gem "faraday"

## 🤝 Contribuição

Se você deseja contribuir com este projeto, faça um **fork** do repositório, crie uma **branch** com suas mudanças e envie um **pull request**.

## 📝 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

