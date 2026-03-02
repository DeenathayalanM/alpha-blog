class User < ApplicationRecord
  before_save { puts "before save" }
  after_save { puts "this is after save"}
  before_commit { puts "this is before commit" }
  after_commit { puts "this is after commit" }

  has_secure_password
  has_many :articles
  validates :name , presence: true, length: {minimum: 3 , maximum: 10}
  validates :email , presence: true , 
                     uniqueness: {case_sensitive: false},
                     format: { with: URI::MailTo::EMAIL_REGEXP }   
end


