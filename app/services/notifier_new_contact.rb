class NotifierNewContact

  def call(user)
    if(validade(user))
      puts "Notificando o novo usuário: #{user.name}"
      check_user(user)
    end
  end

  private

  def validade(user)
    user.info_to_platform?
  end

  def check_user(user)
    user.notifier_new_contact!
  end
end