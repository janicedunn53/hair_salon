require('spec_helper')

describe(Client) do
  describe('.all') do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#description') do
    it("tells the description of the client") do
      test_client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      expect(test_client.description()).to(eq("Jeff_haircut"))
    end
  end

  describe('#save') do
    it("lets you save clients to the database") do
      test_client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#stylist_id') do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe('#==') do
    it("is the same client if it has the same description") do
      client1 = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      client2 = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe('#update') do
    it("lets you update clients in the database") do
      client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      client.save()
      client.update({:description => "Jeff_color"})
      expect(client.description()).to(eq("Jeff_color"))
    end
  end

  describe('#delete') do
    it("lets you delete a client from the database") do
      client = Client.new({:description => "Jeff_haircut", :stylist_id => 1})
      client.save()
      client2 = Client.new({:description => "Anna_highlights", :stylist_id => 2})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
