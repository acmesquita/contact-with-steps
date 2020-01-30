class Users::Create < BaseTransaction

  tee :params
  step :create_user
  step :create_user_crm
  step :info_to_platform
  step :notifier_new_contact

  def params(input)
    @params = input.fetch(:params)
  end

  def create_user(input)
    @user = User.create(@params)

    if(@user.errors.any?)
      Failure(error: @user.errors.full_messages.join(' | '))
    else
      Success(input)
    end
  end

  def create_user_crm(input)
    CreateUserCrm.new.call(@user)

    Success(input)
  rescue StandardError => e
    Failure(error: e)
  end

  def info_to_platform(input)
    InformToPlatform.new.call(@user)

    Success(input)
  rescue StandardError => e
    Failure(error: e)
  end

  def notifier_new_contact(input)
    NotifierNewContact.new.call(@user)

    Success(input)
  rescue StandardError => e
    Failure(error: e)
  end
end