# Mock Database
# We can create a mock database in a class like this (@@albums is the mock database - it is just a class variable):

class Album
  attr_reader :id, :name #Our new save method will need reader methods.

  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an Album is added.

  def initialize(name, id) # We've added id as a second parameter.
    @name = name
    @id = id || @@total_rows += 1  # We've added code to handle the id.
  end

  def self.all
    @@albums.values()
  end
  
  # ^^ .all Method ^^
  # We can use a basic hash method to retrieve values from our mock database for an Album.all() method:
  
  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end
  
  # ^^ #save Method ^^
  # To mock saving records in a database, we need to add a row number (the id of a record) when it is saved:

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end
  
  # ^^ .clear Method ^^
  # We need a method to clear all records in our mock database (for testing purposes):
  
  def self.find(id)
    @@albums[id]
  end
  
  # ^^ .find Method ^^ 
  # We need to be able to search our mock database to find a specific record: 
    
  def update(name)
    @name = name
  end
    
  # ^^ #update Method ^^
  # We need to be able to update specific records in our mock database:
        
  def delete
    @@albums.delete(self.id)
  end
        
  # ^^ #delete() Method ^^
  # We also need to be able to delete a specific record. We can just use a built-in hash method:
end

