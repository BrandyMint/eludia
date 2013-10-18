class Project
  @@_projects = []
  attr_accessor :title, :url, :image, :description, :features, :technologies, :methodologies

  def self.build(yaml)
    project = project.new
    project.slug = yaml['slug'] || "Unknown"
    project.title = yaml['title']
    project.logo = yaml['logo']
    project.url = yaml['url'] || "Unknown"
    #project.slug = "#{project.title.downcase}"
    project.image = yaml['image'] || "Unknown"
    project.description = yaml['description'] || "unknown"
    project.features = yaml['features'] || false
    project.technologies = yaml['technologies'] || false
    project.methodologies = yaml['methodologies'] || false

    @@_projects << project
    #puts "Event#total (#{@@_projects.count}) | Event#build #{yaml}"

    project
  end

  def [](key)
    self.send(key.to_sym)
  end

  def to_s
    self.name
  end

  class << self
    def all
      @@_projects #.sort{|project1, project2| project1.date <=> project2.date}
    end

    def load_all(data_source)
      data_source.each do |project|
        project.build project
      end
    end
  end

end
