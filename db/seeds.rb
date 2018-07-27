# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(name: 'Camila', email: 'c@mail.com', password: '123456' )
u = User.create(email: 'u@mail.com', password: '123456', 
            main_responsible: 'Maria', main_phone: '(11) 99999-2344')
camila = AuPair.create(name: 'Camila', email: 'camila@baba.com', 
              phone: '(11) 99999-9999', cpf: '000.000.000-00',
              skills: 'Contadora de estórias, brincadeiras educativas',
              degree: 'Pedagogia', languages: 'Ingles e Espanhol',
              birth_date: '21/02/1999', city: 'São Paulo',
              wage: 40, photo: File.new(Rails.root.join('spec', 'support', 'baba.jpg')),
              status: :approved)
AuPair.create(name: 'Nana', email: 'nana@baba.com', 
              phone: '(11) 99999-9999', cpf: '000.000.000-10',
              skills: 'brincadeiras retro',
              degree: 'Psicologa', languages: 'Italiano e Espanhol',
              birth_date: '6/07/1995', city: 'São Paulo',
              wage: 40, photo: File.new(Rails.root.join('spec', 'support', 'baba2.png')),
              status: :approved)
AuPair.create(name: 'Karol', email: 'karol@baba.com', 
              phone: '(11) 99999-9999', cpf: '000.000.000-11',
              skills: 'brincadeiras retro',
              degree: 'Psicologa', languages: 'Espanhol',
              birth_date: '6/07/1995', city: 'Londrina',
              wage: 40, photo: File.new(Rails.root.join('spec', 'support', 'nophoto.jpg')),
              status: :pending)
Proposal.create(booked_date: '31/07/2018', start_hour: '13:00', end_hour: '16:00', message: 'Teste', au_pair: AuPair.last, user: User.last)``