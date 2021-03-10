require './lib/product'
require './lib/scanItem'
require './lib/invoice'


Rspec.describe "Chekout Value for CART 1" do
    let(:heart)         {Product.new('001', 'Lavender Heart', 9.25) }
    let(:cufflinks)     {Product.new('002', 'Personalised Cufflinks', 45.00) }
    let(:t_shirt)       {Product.new('003', 'Kids T- Shirt', 19.95) }
    let(:firstItem)     {ScanItem.new(heart)
    let(:secondItem)    {ScanItem.new(cufflinks)
    let(:thirdItem)     {ScanItem.new(t_shirt)
    let(:firstCart)     {[firstItem, secondItem, thirdItem]}
    
    it "Calculates the total cost" do
        invoice = Invoice.new(firstCart)
        expect(invoice.total).to eq(66.78)  
        
    end

    it "Delivers the message on the console" do
        invoice = Invoice.new(firstCart)
        message = "Lavender Heart @ £9.25\nPersonalised Cufflinks @ £45.0\nKids T- Shirt @ £19.95\n======================\nTotal: 66.78\n======================"
        expect(invoice.message).to eq(message)  
    end
    
    
end
