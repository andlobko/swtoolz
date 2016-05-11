class IpAddr < ActiveRecord::Base
  belongs_to :subnet, touch: true

end
