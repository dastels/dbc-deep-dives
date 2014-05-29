# Reduce coupling in this code:
# - extending collection classes (or any class not explicitly
#   meant to be extended) is seldom a good idea.
# - add a method to return a member by name  'member_named(name)'
# - refactor to make name lookup more efficient
# - add country to Member and make old_enough_to_drink? vary based on
#   country:
#     USA - 21
#     Canada - 19
#     Azerbaijan - 16
#     Afghanistan - 1000 ( i.e. illegal)
#     Malta - 17
#     Russia - 0
#     Iceland - 20
# - make it easy to add new contries without having to edit Member for each


# 3. refactor to make name lookup more efficient

class Members

  def initialize
    @people = {}
  end

  def old_enough_to_drive
    @people.values.select {|m| m.old_enough_to_drive?}
  end

  def old_enough_to_drink
    @people.values.select {|m| m.old_enough_to_drink?}
  end

  def <<(aMember)
    @people[aMember.to_s] = aMember
  end

  def member_named(name)
    @people[name]
  end
  
end


class Member

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  def old_enough_to_drive?
    @age >= 16
  end

  def old_enough_to_drink?
    @age >= 21
  end
  
end


roster = DictMembers.new

roster << Member.new("John", "Doe", 14)
roster << Member.new("Bob", "White", 19)
roster << Member.new("Mary", "Smith", 23)

puts "\nOld enough to drive:"
roster.old_enough_to_drive.each {|m| puts m}

puts "\nOld enough to drink:"
roster.old_enough_to_drink.each {|m| puts m}

