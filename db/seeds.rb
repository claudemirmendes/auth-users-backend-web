# seeds.rb

# Criação de um usuário administrador
admin_user = User.create(
    email: 'admin@example.com', # Insira o email desejado
    password: 'Senha65598*', # Insira a senha desejada
    password_confirmation: 'Senha65598',
    role: 'admin'
  )
  
  if admin_user.persisted?
    puts 'Usuário administrador criado com sucesso!'
  else
    puts 'Erro ao criar o usuário administrador.'
  end