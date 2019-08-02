class Volunteer
  attr_reader :name,:id,:specialty_id
  attr_accessor :specialty

def initialize(attr)
  @name = attr.fetch(:name)
  @id = attr.fetch(:id)
  @project_id = attr.fetch(:project_id)
end

# def self.all
#     returned_volunteers = DB.exec("SELECT * FROM volunteers;")
#     volunteers = []
#     returned_vounteers.each() do |volunteer|
#       name = volunteer.fetch("name")
#       id = volunteer.fetch("id").to_i
#       vounteers.push(Volunteer.new({:name => name, :id => id}))
#     end
#     volunteers
#   end
#
#   def save
#       result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
#       @id = result.first().fetch("id").to_i
#     end
end
