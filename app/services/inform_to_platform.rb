class InformToPlatform

  def call(user)
    if(validade(user))
      puts "Enviando para a plataforma o usuário: #{user.name}"
      check_user(user)
    end
  end

  private

  def validade(user)
    user.send_crm?
  end

  def check_user(user)
    user.info_to_platform!
  end
end