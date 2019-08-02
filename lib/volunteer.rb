class Volunteer
  attr_reader :name,:id,:project_id
  attr_accessor :project

def initialize(attr)
  @name = attr.fetch(:name)
  @id = attr.fetch(:id)
  @project_id = attr.fetch(:project_id)
end

def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def self.find(id)
      volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
      if volunteer
        name = volunteer.fetch("name")
        project_id = volunteer.fetch("project_id").to_i
        id = volunteer.fetch("id").to_i
        Volunteer.new({:name => name, :project_id => project_id, :id => id})
      else
        nil
      end
    end

  def save
      result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i
    end

    def ==(name_to_compare)
    self.name() == name_to_compare.name()
  end
end
