
describe Ppl::Format::AddressBook::PostalAddresses do

  before(:each) do
    @format       = Ppl::Format::AddressBook::PostalAddresses.new
    @address_book = Ppl::Entity::AddressBook.new
    @contact      = Ppl::Entity::Contact.new
    @address      = Ppl::Entity::PostalAddress.new
    @table        = double(Ppl::Format::Table)

    @contact.id = "test"
    @contact.postal_address = @address
    @format.table = @table

    @address_book.add_contact(@contact)
  end

  describe "#process" do

    it "should at least show the contact's id" do
      @table.should_receive(:add_row).with({
        :id             => "test:",
        :postal_address => "",
      })
      @format.process(@address_book)
    end

    it "should show the postal address if it's available" do
      @address.street = "1 Test Road"
      @table.should_receive(:add_row).with({
        :id             => "test:",
        :postal_address => "1 Test Road",
      })
      @format.process(@address_book)
    end

  end

end

