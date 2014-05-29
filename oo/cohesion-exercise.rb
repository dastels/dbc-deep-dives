class Dictionary

  def initialize(file)
    @definitions = Hash.new
    @file = file
  end
 
  def add_definition(term, definition)
    @definitions[term] = definition
  end
 
  def read
    if File.extname(@file) == ".xml"
      # read and return definitions in XML from @file
    else
      # read and return definitions in text from @file
    end
  end
 
  def write
    if File.extname(@file) == ".xml"
      # write definitions to @file in XML
    else
      # write definitions to @file in text
    end
  end

end

dictionary = Dictionary.new("dictionary.txt")
dictionary.add_definition("autodidact", "someone who learned without a teacher")
dictionary.add_definition("cogent", "clear, logical, and convincing")
dictionary.add_definition("pedagogy", "the method and practice of teaching")
 
dictionary.write
dictionary.read
