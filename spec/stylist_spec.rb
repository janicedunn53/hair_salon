require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("tells the name of the stylist") do
      stylist = Stylist.new({:name => "Julie", :id => nil})
      expect(stylist.name()).to(eq("Julie"))
    end
  end

  describe('#id') do
    it("sets the ID of the stylist when you save it") do
      stylist = Stylist.new({:name => "Julie", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Julie", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('#==') do
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Julie", :id => nil})
      stylist2 = Stylist.new({:name => "Julie", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.find') do
    it("returns a stylist by the ID") do
      test_stylist = Stylist.new({:name => "Julie", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Theresa", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#clients') do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Julie", :id => nil})
      test_stylist.save()
      test_client = Client.new({:description => "Jeff_haircut", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:description => "Anna_highlights", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe('#update') do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Julie", :id => nil})
      stylist.save()
      stylist.update({:name => "Cathy"})
      expect(stylist.name()).to(eq("Cathy"))
    end
  end
end
