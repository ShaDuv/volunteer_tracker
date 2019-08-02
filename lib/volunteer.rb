class Volunteer
  attr_reader :name,:id,:specialty_id
attr_accessor :specialty

def initialize(attr)
  @name = attr.fetch(:name)
  @id = attr.fetch(:id)
  @specialty_id = attr.fetch(:specialty_id)
  @specialty = ""
end
