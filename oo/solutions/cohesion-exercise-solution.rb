class Dictionary
  def initialize(file)
    @definitions = Hash.new
    @file = file
  end
 
  def add_definition(term, definition)
    @definitions[term] = definition
  end
 
  def self.instance(file)
    if File.extname(file) == ".xml"
      XMLDictionary.new(file)
    else
      TextDictionary.new(file)
    end
  end
end
 
class XMLDictionary < Dictionary
  def write
    # write XML to @file using the @definitions hash
  end
  def read
    # read XML from @file and populate the @definitions hash
  end
end
 
class TextDictionary < Dictionary
  def write
    # write text to @file using the @definitions hash
  end
  def read
    # read text from @file and populate the @definitions hash
  end
end
 
dictionary = Dictionary.instance("dictionary.txt")
 
dictionary.add_definition("autodidact", "someone who learned without a teacher")
dictionary.add_definition("cogent", "clear, logical, and convincing")
dictionary.add_definition("pedagogy", "the method and practice of teaching")
 
dictionary.write
dictionary.read
