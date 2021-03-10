# Root file to run the task !!!   run 'ruby store.rb' from project directory

require './lib/product'
require './lib/scanItem'
require './lib/invoice'


heart       = Product.new('001', 'Lavender Heart', 9.25)
cufflinks   = Product.new('002', 'Personalised Cufflinks', 45.00)
t_shirt     = Product.new('003', 'Kids T- Shirt', 19.95)


firstItem = ScanItem.new(heart)
secondItem = ScanItem.new(cufflinks)
thirdItem = ScanItem.new(t_shirt)

firstCart = [firstItem, secondItem, thirdItem]
secondCart = [firstItem, thirdItem, firstItem]
thirdCart = [firstItem, secondItem, firstItem, thirdItem]

checkOuts = [firstCart, secondCart, thirdCart]

number = 1 # Checkout cart numbers
checkOuts.each do |scanCart|
    invoice = Invoice.new(scanCart)
    puts "----   CART NO #{number}  ----\n"
    puts invoice.message
    number = number + 1
end
