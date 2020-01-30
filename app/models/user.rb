class User < ApplicationRecord

  enum status: {
    send_crm: 'send_crm',
    info_to_platform: 'info_to_platform',
    notifier_new_contact: 'notifier_new_contact'
  }
end
