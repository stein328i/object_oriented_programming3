require_relative 'contact'


class CRM

  def initialize

  end

  def main_menu
    while true
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number:'
  end

  def call_option
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter First Name of contact to modify'
    first_name = gets.chomp

    contact_to_modify = Contact.find_by(first_name)

    print 'What do you want to update?'
    attibute = gets.chomp

    print 'What do you want it to be updated to?'
    value = gets.chomp

    contact_to_modify.update(attibute, value)

  end

  def delete_contact
    print 'Enter First Name of contact to modify'
    first_name = gets.chomp

    print contact_to_delete = Contact.delete(first_name)


  end

  def display_all_contacts
    print Contact.all
  end

  def search_by_attribute
    print "What is the search?"
    first_name = gets.chomp
    
    print contact_find = Contact.find_by(first_name)

  end

end

# c = CRM.add_new_contact

# p c.display_all_contacts