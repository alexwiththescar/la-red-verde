require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  authentication_token   :string(255)
#  name                   :string(255)
#  description            :string(255)
#  admin                  :boolean         default(TRUE)
#  avatar                 :string(255)
#  street_name            :string(255)
#  bldg_name              :string(255)
#  region                 :string(255)
#  post_code              :integer
#  province               :string(255)
#  contact_number         :integer
#  longitude              :float
#  latitude               :float
#  delta                  :boolean         default(TRUE), not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :float
#  avatar_updated_at      :datetime
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

