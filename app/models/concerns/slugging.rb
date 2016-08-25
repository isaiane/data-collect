module Slugging
  extend ActiveSupport::Concern
  def to_param
    "#{slug}"
  end

  included do
    before_save :slugged
  end

  def slugged
  	self.slug = self.slug.parameterize.gsub("-", "_")
  end
end