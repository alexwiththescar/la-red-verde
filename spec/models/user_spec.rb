require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  email               :string(255)
#  description         :string(255)
#  password_digest     :string(255)
#  remember_token      :string(255)
#  admin               :boolean(1)      default(TRUE)
#  avatar              :string(255)
#  street_name         :string(255)
#  bldg_name           :string(255)
#  region              :string(255)
#  post_code           :integer(4)
#  province            :string(255)
#  contact_number      :integer(4)
#  longitude           :float
#  latitude            :float
#  delta               :boolean(1)      default(TRUE), not null
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :float
#  avatar_updated_at   :datetime
#

