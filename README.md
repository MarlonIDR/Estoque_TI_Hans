# Controle Estoque TI Hans & Eder

Projeto pessoal para controle de entrada e saída de equipamentos relacionados à área de TI de uma fábrica da JBS.

## 1. Tela de Login

A tela de login implementa um sistema de autenticação utilizando o Back4App, com as seguintes funcionalidades:

- **Autenticação**: O usuário insere suas credenciais (e-mail e senha), que são validadas pelo Back4App. Caso as credenciais estejam corretas, um token de acesso é gerado e armazenado localmente.
- **Gerenciamento de Sessão**: O token de acesso possui um tempo de expiração. Quando expira, o usuário é automaticamente desconectado e redirecionado para a tela de login.
- **Interface do Usuário**: A tela apresenta campos para entrada de e-mail e senha, além de um botão de login. Mensagens de erro são exibidas em caso de falha no login.
- **Segurança**: As credenciais são transmitidas de forma segura, e o token de acesso é armazenado de maneira protegida no dispositivo.

Essa funcionalidade garante que apenas usuários autenticados possam acessar o sistema.
