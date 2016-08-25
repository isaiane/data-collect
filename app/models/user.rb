class User < ActiveRecord::Base
  include Slugging
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :email, :slug, :rule
  validates_length_of :password, minimum: 8, allow_blank: true
  validates_length_of :name, :lastname, minimum: 2, allow_blank: true
  validates_length_of :phone_number, :in => 14..15, allow_blank: true
  validates_format_of :slug, with: /\A(?!_)(?:[a-z0-9]_?)*[a-z](?:_?[a-z0-9])*(?<!_)\z/i, allow_blank: true
  validates_uniqueness_of :slug, :email;
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true

  def self.search(search, sort, order, page)
    if search
      if order == "desc"
        where("name LIKE :search", search: "%#{search}%").sort_by { |h| h["#{sort}"] }.reverse.paginate(page: page, per_page: 9)
      else
        where("name LIKE :search", search: "%#{search}%").sort_by { |h| h["#{sort}"] }.paginate(page: page, per_page: 9)
      end
    end
  end

  @@master_rules = {
    1 => "admin",
    2 => "pit_stop",
    3 => "content",
    4 => "account_manager"
  }

  @@common_rules = {
    50 => "administrator",
    51 => "manager",
    52 => "editor",
    53 => "attendant",
    54 => "salesman",
    55 => "agency"
  }

  def common_rules
    @@common_rules
  end

  def master_rules
    @@master_rules
  end
end
