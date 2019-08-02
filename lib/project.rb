class Project
  attr_reader :id
  attr_accessor :title

def initialize(attr)
  @title = attr.fetch(:title)
  @id = attr.fetch(:id)
  end

  def save
      result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
      @id = result.first().fetch("id").to_i
    end

    def ==(title_to_compare)
    self.title() == title_to_compare.title()
  end
end
