class Commune < ApplicationRecord
  belongs_to :intercommunality, optional: true
  has_many :commune_streets, dependent: :destroy
  has_many :streets, through: :commune_streets

  validates :name, :code_insee, presence: true
  validates :code_insee, length: {is: 5}, format: { with: /\A\d+\z/, message: "Allow number. No sign allowed." }

  def self.search(query)
    if query.start_with?('%') || query.end_with?("%")
      self.where("name LIKE ?", query.downcase)
    else
      self.where("name LIKE ?", "%#{query.downcase}%")
    end
  end

  def self.to_hash
    pluck(:code_insee, :name).to_h
  end

end
