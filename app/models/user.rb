class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :lastname, :email, :password, :password_confirmation, :remember_me
  attr_accessible :role_ids, :as => :admin
  # moving this before the name, lastname, etc makes the migrations not to work, putting it inthe same line makes UI cannot add new users
  #attr_accessible :role_ids, :as => :admin 

end
