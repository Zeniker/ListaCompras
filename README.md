# README

* Instalar o RVM (https://rvm.io/)

* A partir dele, instale a versão 2.5.1 do ruby.

* Por padrão, a utilização do sqlite está desabilitada. Descomentar a gem para utiliza-lo.
```ruby
# gem 'sqlite3'
```

* Na pasta do projeto, rodar os comando abaixo e aguardar.
```
$ sudo apt-get install libpq-dev
$ bundle install
```

* Rode os testes para ver se está tudo ok
```
rake
```

* Com isso feito, crie o banco de dados
```
$ rake db:create
```

* Utilizando o rails console, crie um usuário mestre.
```
> v = Usuario.new
> v.nome = 
> v.login = 
> v.password
> v.password_confirmation
> v.save
> v.add_role(:admin)
```

* Abra o servidor e entre com os dados do seu usuário. Então seja feliz.


### Faltou incluir os testes, terei eles em uma versão futura!