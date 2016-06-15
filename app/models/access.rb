# == Schema Information
#
# Table name: accesses
#
#  id             :integer          not null, primary key
#  access_token   :string           not null
#  remember_token :string           not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Access < ActiveRecord::Base

  belongs_to :user

end
