class CreateUserCrm

  def call(user)
    puts "Enviando para o crm o usuário: #{user.name}"
    check_user(user)
  end

  private

  def check_user(user)
    user.send_crm!
  end
end