class Player
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :age, type: String
  field :position, type: String
  field :team, type: String
end
