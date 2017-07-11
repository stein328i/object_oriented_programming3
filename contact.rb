class Contact

@@contacts = []
@@id       = 1
  
  def initialize(first_name, last_name, email, note = 'na')
    @first_name  = first_name
    @last_name  = last_name
    @email      = email
    @note       = note

    @id         = @@id
    @@id       += 1
  end


  def first_name
    @first_name
  end


  def last_name
    @last_name
  end


  def email
    @email
  end


  def id
    @id
  end


  def note(note)
    @note = note
  end


  def self.create(first_name, last_name, email, note = 'na')
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  
  def self.all
    @@contacts
  end


  def self.find(id)
    @@contacts.each do |find_contact|
      if find_contact.id == id
        return find_contact
      end
    end
  end


  def update(attribute, value)
    if attribute    == 'first_name'
      @first_name   = value
    elsif attribute == 'last_name'
      @last_name    = value
    elsif email     == 'email'
      @email        = value
    elsif note      == 'note'
      @note         = value
    end
  end


  def self.find_by(value)
    @@contacts.each do |find_contact|
      if find_contact.first_name     == value
        return find_contact
      elsif find_contact.last_name   == value
        return find_contact
      elsif find_contact.email       == value
        return find_contact
      end
    end
    return "nothing found"
  end


  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(value)
    contact_to_delete = Contact.find_by(value)
    @@contacts.delete(contact_to_delete)
  end

  # Feel free to add other methods here, if you need them.
end

# betty = Contact.create('Betty', 'Boop', 'bb@gmail.com')
# john = Contact.create('John', 'doe', 'bvvvgmail.com')
# # p Contact.find(1)
# # p Contact.find_by('Betty')



# betty.update('first_name', 'john')
# betty.update('last_name', 'doe')


# p Contact.find_by('doe')


# betty.delete('john')

# p Contact.find_by('john')


# p Contact.delete_all