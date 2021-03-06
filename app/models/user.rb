# frozen_string_literal: true

class User < ApplicationRecord
  devise :masqueradable, :database_authenticatable, :confirmable, :registerable, :trackable, :recoverable,
         :rememberable, :validatable, :omniauthable
  # Validations
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true
  has_one_attached :avatar
  has_person_name
  has_many :tweets
  has_many :followers, :class_name => “Relationship”, :foreign_key => “user_id”
  has_many :following, :class_name => “Relationship”, :foreign_key => “follower_id”

  has_many :notifications, as: :recipient
  has_many :services
end
