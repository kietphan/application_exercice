class Intercommunality < ApplicationRecord
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :communes, dependent: :destroy
  validates :name, presence: true
  validates :form, inclusion: {in: %w(ca cu cc met),
                               message: "%{value} is not a valid form"}, presence: true
  validates :siren,
            length: {is: 9},
            uniqueness: {case_sensitive: false}, presence: true


  def communes_hash
    communes.pluck(:code_insee, :name).to_h
  end

  def population
    communes.sum(:population)
  end

end