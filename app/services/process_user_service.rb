class ProcessUserService < BusinessProcess::Base

  needs :user

  steps :create_user,
        :inform_to_platform,
        :notifier_new_contact

  private

  def create_user
    CreateUserCRM.new.call(user)
  end

  def inform_to_platform
    InformToPlatform.new.call(@user)
  end

  def notifier_new_contact
    NotifierNewContact.new.call(@user)
  end
end