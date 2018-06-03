# == Schema Information
#
# Table name: invite_codes
#
#  id         :bigint(8)        not null, primary key
#  code       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lab_id     :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_invite_codes_on_code     (code) UNIQUE
#  index_invite_codes_on_lab_id   (lab_id)
#  index_invite_codes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (lab_id => labs.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class InviteCodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
