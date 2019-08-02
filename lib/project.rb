class Project
  attr_reader :id
  attr_accessor :title
def initialize(attr)
  @title = attr.fetch(:title)
  @id = attr.fetch(:id)
  end

end
