GERENCIADOR DE ARTIGOS
===================

Integrantes
-------------
 - Gustavo Martins
 - Hugo Grochau
 - Michelle Valente
 - Érico Nascimento
 - Lucas Hardman
 - Marcelo Politzer
 - Tatiana Magdalena
 - Marcos Rapoport
 - Philipe Bonfim

Instalação
-------------
* Instale [lapis](http://leafo.net/lapis/reference/getting_started.html) e [openresty](https://openresty.org/en/installation.html)
* Edite o `config.lua.template` com a senha do banco e renome-o para `config.lua`
* Execute `lapis server`
* Acesse http://127.0.0.1:8080

Tecnologias
-------------
**Front-end (Páginas web)**
-  Bootstrap
-   JQuery

**Back-end**
-   Lápis

**Banco**
-   Postgresql

Diário
-------------
**03/06/2016**
-   Divisão do gurpo em 3 mini-grupos (Back-end/Front-end/Gerencial)
-   Modelagem básica do banco de dados
-   Página inicial

**10/06/2016**
-   Estruturação do back-end
-   Utilização de templates para renderização do layout basico
-   Configuração do lapis para uso do etLua (biblioteca de renderização dinamica)

**13/06/2016**
-   Criação das páginas : Conferência, Conferências, Edição e Artigo
-   Criação das sectios para poder adicionar conferência, edição e artigo

**26/06/2016**
-   Criação da página : Administrador
-   Novos campos foram adicionados nas páginas para poder adicionar autores e editores
-   Isso termina a parte do Front-End
