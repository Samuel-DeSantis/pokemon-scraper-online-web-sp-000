class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", self.name, self.type)
  end

  def self.find
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", self.name, self.type).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: pokemon_info[3])
  end
end
