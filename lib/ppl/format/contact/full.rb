
class Ppl::Format::Contact::Full < Ppl::Format::Contact

  attr_writer :postal_address_format

  def initialize
    @postal_address_format = Ppl::Format::Contact::PostalAddress.new
  end

  def process(contact)
    lines = []

    first_line = first_line(contact)
    if first_line != ""
      lines.push(first_line)
    end

    vitals = vitals(contact)
    if vitals != ""
      lines.push("")
      lines.push(vitals)
      lines.push("")
      lines.push("")
    end

    if !contact.postal_address.nil?
      lines.push("Postal Address:")
      lines.push(@postal_address_format.process(contact))
    end

    return lines.join("\n")
  end

  private

  def first_line(contact)
    line = ""
    if !contact.name.nil?
      line += contact.name
    end
    if !contact.email_addresses.empty?
      line += " <#{contact.email_addresses.first}>"
    end
    return line
  end

  def vitals(contact)
    vitals = []
    if !contact.birthday.nil?
      vitals.push(format_vital("Birthday", contact.birthday.strftime("%Y-%m-%d")))
    end
    if !contact.phone_number.nil?
      vitals.push(format_vital("Telephone", contact.phone_number))
    end
    if !contact.organization.nil?
      vitals.push(format_vital("Organization", contact.organization))
    end
    return vitals.join("\n")
  end

  def format_vital(name, value)
    return sprintf("  %-12s %s", name, value)
  end

end

