Mila Babies
=======

**Mila Babies** é uma aplicação feita para inicialmente atender as necessidades 
de negócio da Camila, irmã da Carla, o qual ela mesmo criou. Um negócio focado 
em serviço de babás premium para cuidar apenas das crianças, e cobrado por hora.
Sendo seu grande diferencial o cuidado especial com as mesmas.
Para essa necessidade, a aplicação foi introduzida com as ideias da Camila, Mila, 
que iria expandir o seu negócio fazendo uma curadoria das novas babás, além de encontrar
novas clientes. E com ajuda do sistema, gerenciar tudo isso sem perder o toque
pessoal dela na entrega desse serviço diferenciado.
A aplicação disponibiliza o cadastro das babás com direito a nota e depoimento
dados por quem já usou o serviço da babá. Depoimentos os quais segunda a Mila 
seriam o grande ponto de negócio, MVP, para o crescimento e sucesso do negócio.
Para facilitar a contratação do serviço, foi disponibilizado fazer a 
contratação/proposta via aplicação, a qual a gerência fica a cargo do administrador
da aplicação, englobando a curadoria das novas babás.

## URL do Deploy
https://millababies.herokuapp.com/ 

## Setup do Projeto

### Pré requisitos

 - Ter [Ruby](https://www.ruby-lang.org) versão 2.5.1 previamente instalado na máquina

### Configurando e executando testes

 - `bin/setup`
 - `bundle exec rspec`

#### Docker
 - `docker-compose build`
 - `docker-compose run --rm web bin/setup`
 - `docker-compose run --rm web EDITOR=vim rails credentials:edit`
 - `docker-compose run --rm --service-ports web bash`
 - `bundle exec rspec`

### Executando a aplicação

Após os passos de configuração executar o comando `rails server` e acessar pela
url [http://localhost:3000/](http://localhost:3000/).

#### Docker
 - `docker-compose build`
 - `docker-compose run --rm web bin/setup`
 - `docker-compose run --rm web rails assets:precompile`
 - `docker-compose up`

## Contribuindo
1. Faça um fork do projeto.
2. Clone seu projeto!
2. Crie sua feature branch: `git checkout -b <sua-feature>`
3. Commit suas mudanças: `git commit -am 'Minha super feature'`
4. Envie seu branch para o repositório: `git push origin <sua-feature>`
5. Envie um Pull Request :D

### Principais contribuidores
 - [carlacrude](https://github.com/carlacrude)
 - [antoniomurilo](https://github.com/antoniomurilo)
 - [luizlopes](https://github.com/luizlopes)
 - [mavmaso](https://github.com/mavmaso)
 - [campuscode](https://www.campuscode.com.br/)
