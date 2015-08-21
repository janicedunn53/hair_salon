require('spec_helper')

describe(Client) do
  describe('.all') do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#description') do
    it("tells the description of the client") do
      test_client = Client.new({:description => "Jeff_haircut", :id => nil})
      expect(test_client.description()).to(eq("Jeff_haircut"))
    end
  end

  describe('#id') do
    it("sets the ID of the client when you save it") do
      client = Client.new({:description => "Jeff_haircut", :id => nil})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("lets you save clients to the database") do
      test_client = Client.new({:description => "Jeff_haircut", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#==') do
    it("is the same client if it has the same description") do
      client1 = Client.new({:description => "Jeff_haircut", :id => nil})
      client2 = Client.new({:description => "Jeff_haircut", :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe('.find') do
    it("returns a client by the ID") do
      test_client = Client.new({:description => "Jeff_haircut", :id => nil})
      test_client.save()
      test_client2 = Client.new({:description => "Anna_color", :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end
end
